<?php

use Slim\Psr7\Request;
use Slim\Psr7\Response;
use Slim\Views\Twig;

if (session_status() === PHP_SESSION_NONE) {
    session_start();
    $_SESSION['userid'] = '1001';
    $_SESSION['username'] = 'Gordon Conway';
}

    $app->POST('/processlogin', function ($request, $response) use ($container) {
        $data = [$_REQUEST['email'], $_REQUEST['password']];
        var_dump($data);
        die;
        return $container->get('view')->render($response, 'home-page.html.twig');
       })
       
         -> setName('processlogin');
