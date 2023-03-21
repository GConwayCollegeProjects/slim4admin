<?php


declare(strict_types=1);

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\Views\Twig;

   

$app->get('/processlostpassword', function ($request, $response) use ($container) {

  
    echo ("password reminder sent");
 
    return $container->get('view')->render($response, 'logged-out.html.twig');
   })
   
     -> setName('processlostpassword');



     