<?php

	abstract class Status {
		const  SUCCESS = "SUCCESS",
		WARNING = "WARNING",
		ERROR = "ERROR";
	}
	
	abstract class Lists {
		const  ROLES = "ROLES",
		YEARS = "YEARS";
	}
	
	abstract class Operations {
		const OVERVIEW = "OVERVIEW_COMPENSATION";
	}
	
	function connectToDb(){
		$servername   = "localhost";
		$user   =  "root";
		$password = "";
		$database  = "companydb";
		
		// Create connection
		$conn = new mysqli($servername, $user, $password, $database);

		// Check connection
		if ($conn->connect_error) {
		  die("Connection failed: " . $conn->connect_error);
		}
		//echo "Connected successfully";
		return $conn;
	}
	
	function closeConnectionToDb($conn){
		$conn->close();
	}
?>