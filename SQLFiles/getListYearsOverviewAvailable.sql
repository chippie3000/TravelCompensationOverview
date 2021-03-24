SELECT DISTINCT YEAR(DATE_SUB(`process_date`, INTERVAL 1 DAY)) AS years
FROM `travel_compensation_history`
ORDER BY years DESC