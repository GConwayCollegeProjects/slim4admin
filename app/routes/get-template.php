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

$app->post('/get-template', function ($request, $response) use ($container) {
    if ($userid ='') {return $container->get('view')->render($response, 'logged-out.html.twig');
    }
    else {
		echo "we are here";
		echo "we are here";
		echo "we are here";
		echo "we are here";
		echo "we are here";
		echo "we are here";

        
    return $container->get('view')->render($response, 'blank.html.twig');
    }
})

    -> setName('get-template');