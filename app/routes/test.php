<?php 

declare(strict_types=1);

if (session_status() === PHP_SESSION_NONE) {
	session_start();
}

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\Views\Twig;

$app->get('/test', function ($request, $response) use ($container) {
    if ($_SERVER['userid'] ='') {return $container->get('view')->render($response, 'logged-out.html.twig');
    }
    else {
        $db_username = "u260357075_gconwayuk";
        $db_password = "#LovethePeaks48";
        $db_host = "sql582.main-hosting.eu";
        $db_name = "u260357075_cohortology";
   
        $dsn = "mysql:host=$db_host;dbname=$db_name";
        $pdo = new PDO($dsn, $db_username, $db_password);
	
        $userid = $_SESSION['userid'];

        $type = 'all'; // temporary only

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
	   echo '<a style="font-size: vsmall; font-decoration: underline;display: block;" id='.$row["event_id"].' href=getTemplate(this.id)>'.$row["event_name"].'</a>';
	   }

    return $container->get('view')->render($response, 'fresh.twig');
    }
})

    -> setName('test');