<?php
if (session_status() === PHP_SESSION_NONE) {
	session_start();
}


USE PDO;
	echo "<p style="."color='red'>This is above the pale</p><br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";
	echo "This is above the pale<br>";


	$xyz = dirname(__DIR__, 1).'/src/Connection.php';
	require_once($xyz);
	echo $xyz;
	die;
	$Conn = new Connection();
	var_dump($Conn);
	die;
	
	$pdo = $Conn->newConnection();
	
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
			$conn = null;
		} 
		catch (PDOException $e) {
			$error = $e->getMessage();
		}

		


	echo "a right load of rubbish";
