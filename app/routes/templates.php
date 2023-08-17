<?php

declare(strict_types=1);

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\Views\Twig;


$app->get('/templates', function ($request, $response) use ($container) {
 if (session_status() === PHP_SESSION_NONE) {
            session_start();
            $_SESSION['userid'] = '1001';
            $_SESSION['username'] = 'Gordon Conway';
        }

    if ($_SERVER['userid'] ='') {return $container->get('view')->render($response, 'logged-out.html.twig');
    }
    else {
        return $container->get('view')->render($response, 'templates.html.twig', [

            'route' => ROUTE_ARRAY


        ]);

    }

}

)
    -> setName('templates');


