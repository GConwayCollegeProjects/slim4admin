<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}

	$db_username = "u260357075_gconwayuk";
	$db_password = "#LovethePeaks48";
	$db_host = "sql582.main-hosting.eu";
	$db_name = "u260357075_cohortology";

   
   $dsn = "mysql:host=$db_host;dbname=$db_name";
   $pdo = new PDO($dsn, $db_username, $db_password);
	 
	
	$userid = $_SESSION['userid'];

	$type = 'all';

	if ($type==='all') 
		{
			$sql = "SELECT * FROM templates";
			}
		else {
			$sql = "SELECT * FROM templates where event_type = $type";
		}
			
	try {
			$stmt = $pdo->prepare("$sql");
			$stmt->execute();

			$result = $stmt->fetchAll();
			$stmt = null;
			$pdo = null;
		} 
		catch (PDOException $e) {
			$error = $e->getMessage();
		}

		

   foreach($result as $key => $row) {
	   echo '<div  >';
	
	   echo '<a style="font-size: vsmall; font-decoration: underline;display: block;" id='.$row["event_id"].' href=getTemplate(this.id)>'.$row["event_name"].'</a>';

	   echo '</div>';
		   

	   }
   
