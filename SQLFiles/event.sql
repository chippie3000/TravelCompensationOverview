INSERT INTO travel_compensation_history(`transport_compensation_history_id`,`employee`, `transport_option`,`process_date`,`compensation`, `payment_date`)
SELECT NULL,`comp_vals`.`employee_id`, `comp_vals`.`transport_option`, `comp_vals`.`dateprocess`, `comp_vals`.compensation, DATE_ADD(`comp_vals`.`dateprocess`, INTERVAL 2 DAY)
FROM (SELECT `employee_id`, `transport_option`,
	(SELECT 
    	(CASE 
          WHEN COUNT(DISTINCT `process_date`) = 0 THEN "2018-01-01" 
          ELSE DATE_ADD((SELECT `process_date` FROM `travel_compensation_history` ORDER BY `process_date` DESC LIMIT 1), INTERVAL 1 MONTH)
    	END) AS date_now
	FROM `travel_compensation_history`) AS dateprocess,
	(CASE 
       WHEN `transport_option` = 1 THEN (`travel_distance` * 2 * `workdays` * 4 * 0.1)  
       WHEN `transport_option` = 2 or `transport_option` = 4 THEN (`travel_distance` * 2 * `workdays` * 4 * 0.25)  
       WHEN `transport_option` = 3 AND `travel_distance` < 5.0 THEN (`travel_distance` * 2 * `workdays` * 4 * 0.5) 
       WHEN `transport_option` = 3 AND `travel_distance` >= 5.0 THEN (`travel_distance` * 2 * `workdays` * 4 * (0.5*2))  
       ELSE 0.0
     END) AS compensation
FROM `employees`) AS comp_vals