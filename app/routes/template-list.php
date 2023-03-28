<?php 

declare(strict_types=1);

if (session_status() === PHP_SESSION_NONE) {
	session_start();
	$_SESSION['userid'] = '1001';
    $_SESSION['username'] = 'Gordon Conway';
}

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\Views\Twig;

$userid = $_SESSION['userid'];

$app->post('/template-list', function ($request, $response, $args) use ($container) {
    if ($userid ='') {
		return $container->get('view')->render($response, 'logged-out.html.twig');
    }
    else {
		$data = $request->getParsedBody();
		$source = $data['source'];
		$value = $data['value'];
	
        $db_username = "u260357075_gconwayuk";
        $db_password = "#LovethePeaks48";
        $db_host = "sql582.main-hosting.eu";
        $db_name = "u260357075_cohortology";
   
        $dsn = "mysql:host=$db_host;dbname=$db_name";
        $pdo = new PDO($dsn, $db_username, $db_password);
	
    
		if ($source === 'type') {  

			if ($value === 'all') 
				{
					$sql = "SELECT * FROM templates";
					}
				else {
					$sql = "SELECT * FROM templates WHERE event_type = '$value' ";
				}
		}
		else {
			$value = '%'.$value.'%';
			
				$sql = "SELECT * FROM templates WHERE event_name LIKE '$value'";
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
			$href = 'getTemplate('.$row["event_id"].')';      //"{{url_for('/loggedout')}}";
			$tab = "showTab('#details')";
			echo '<div id='.$row["event_id"].' onclick='.$tab.' >';
			echo '<a style="font-size: vsmall; font-decoration: underline;display: block;" id='.$row["event_id"].' href="">'.$row["event_name"].'</a>';
			echo '</div>';
	   }

    return $container->get('view')->render($response, 'fresh.twig');
    }
})

    -> setName('template-list');