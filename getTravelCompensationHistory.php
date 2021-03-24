<?php	
	require 'databaseConnection.php';
	
	function jsonToCSV($json, $cfilename) {
		//$data = json_decode($json, true);
		$fp = fopen($cfilename, 'w');
		$header = false;
		foreach ($json as $row)
		{
			if (empty($header))
			{
				$header = array_keys($row);
				fputcsv($fp, $header);
				$header = array_flip($header);
			}
			fputcsv($fp, array_merge($header, $row));
		}
		fclose($fp);
		return;
	}
	
	$query  = explode('&', $_SERVER['QUERY_STRING']);
	$params = array();

	foreach( $query as $param )
	{
	  // prevent notice on explode() if $param has no '='
	  if (strpos($param, '=') === false) $param += '=';

	  list($name, $value) = explode('=', $param, 2);
	  $params[urldecode($name)][] = urldecode($value);
	}
	
	$connection = connectToDb();
	
	$response = array();
	$message = array();
	$statusOperation = array();
	
	$sql = "
	SELECT `firstname`, `lastname`,`role_id`,`title`,`compensation`, `transport`,`process_date`,`payment_date`, `year`, `month`
	FROM (SELECT `employee_id`,`firstname`, `lastname`,`role_id`,`title`,`compensation`, `transport`,`process_date`,`payment_date`, YEAR(lastdate) AS year, EXTRACT(MONTH FROM lastdate) AS month
		  FROM (SELECT `employee_id`,`firstname`, `lastname`,`role_id`,`title`,`compensation`,`name` AS transport,`process_date`,`payment_date`, DATE_SUB(`process_date`, INTERVAL 1 DAY) AS lastdate 
			  FROM `travel_compensation_history`, `employees`, `roles`, `transport_options`
			  WHERE `employee_id`=`employee`
			  AND `role` = `role_id` 
			  AND `employees`.`transport_option` = `transport_option_id`) AS com_hist 
		  ORDER BY `year` DESC, `month` ASC, `employee_id` ASC) AS compensation ";
	
	$sqlFilters = "";
	if(isset($_GET['fYear']) && isset($params['fYear']) && count($params['fYear']) > 0){
		$years = array();
		foreach ($params['fYear'] as $year)
			array_push($years," `year` = $year ");
		$sqlFilters .= "WHERE ".((count($params['fYear'])>1) ? "(" : "").join(" OR ",$years).((count($params['fYear'])>1) ? ") " : " ");
	}
	if(isset($_GET['fRoles']) && isset($params['fRoles']) && count($params['fRoles']) > 0){
		$roles = array();
		foreach ($params['fRoles'] as $role)
			array_push($roles," `role_id` = $role ");
		$sqlFilters .= ( ($sqlFilters == "") ? "WHERE " : "AND ").((count($params['fRoles'])>1) ? "(" : "").join(" OR ",$roles).((count($params['fRoles'])>1) ? ") " : " ");
	}
	
	$results = mysqli_query($connection, $sql.$sqlFilters);
	if (mysqli_num_rows($results) > 0) {
		$response[Operations::OVERVIEW] = mysqli_fetch_all($results, MYSQLI_ASSOC);
		$statusOperation[Operations::OVERVIEW] = Status::SUCCESS;
	} else {
		$statusOperation[Operations::OVERVIEW] = Status::WARNING;
		$message[Operations::OVERVIEW] = "0 records found";
	}
	
	$csv_filename = './data.csv';

    jsonToCSV($response[Operations::OVERVIEW], $csv_filename);
	$response[Operations::OVERVIEW] = $csv_filename;
	$jsonData = json_encode(array('response'=>$response, 'status' => $statusOperation, 'message' => $message));
	echo $jsonData;
		
?>