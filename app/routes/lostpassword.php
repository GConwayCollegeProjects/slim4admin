<?php


declare(strict_types=1);

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\Views\Twig;

$app->get('/lostpassword', function ($request, $response) use ($container) {
    return $container->get('view')->render($response, 'lost-password.html.twig');
   })
   
     -> setName('lostpassword');