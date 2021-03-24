SELECT `firstname`, `lastname`,`role_id`,`title`,`compensation`, `transport`,`process_date`,`payment_date`, `year`, `month`
FROM (SELECT `employee_id`,`firstname`, `lastname`,`role_id`,`title`,`compensation`, `transport`,`process_date`,`payment_date`, YEAR(lastdate) AS year, EXTRACT(MONTH FROM lastdate) AS month
      FROM (SELECT `employee_id`,`firstname`, `lastname`,`role_id`,`title`,`compensation`,`name` AS transport,`process_date`,`payment_date`, DATE_SUB(`process_date`, INTERVAL 1 DAY) AS lastdate 
          FROM `travel_compensation_history`, `employees`, `roles`, `transport_options`
          WHERE `employee_id`=`employee`
		  AND `role` = `role_id` 
		  AND `employees`.`transport_option` = `transport_option_id`) AS com_hist 
      ORDER BY `year` DESC, `month` ASC, `employee_id` ASC) AS compensation
WHERE `year` = 2020
AND (`role_id`=4 OR `role_id`=5)