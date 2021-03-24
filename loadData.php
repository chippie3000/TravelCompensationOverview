<?php	
	require 'databaseConnection.php';
	
	$connection = connectToDb();
	
	$sqlRoles = "SELECT * FROM `roles` ORDER BY title ASC;";
	$sqlYears = " 
				SELECT DISTINCT YEAR(DATE_SUB(`process_date`, INTERVAL 1 DAY)) AS years
				FROM `travel_compensation_history`
				ORDER BY years DESC; ";
	
	$response = array();
	$message = array();
	$statusOperation = array();
	
	//Get list of available roles
	$results = mysqli_query($connection, $sqlRoles);
	if (mysqli_num_rows($results) > 0) {
		$response[Lists::ROLES] = mysqli_fetch_all($results, MYSQLI_ASSOC);
		$statusOperation[Lists::ROLES] = Status::SUCCESS;
	} else {
		$statusOperation[Lists::ROLES] = Status::WARNING;
		$message[Lists::ROLES] = "0 results for roles";
	}
	
	//Get list of available recorded years
	$results = mysqli_query($connection, $sqlYears);
	if (mysqli_num_rows($results) > 0) {
		$response[Lists::YEARS] = mysqli_fetch_all($results, MYSQLI_ASSOC);
		$statusOperation[Lists::YEARS] = Status::SUCCESS;
	} else {
		$statusOperation[Lists::YEARS] = Status::WARNING;
		$message[Lists::YEARS] = "0 records found";
	}
	
	$jsonData = json_encode(array('response'=>$response, 'status' => $statusOperation, 'message' => $message));
		
	echo $jsonData;
		
?>