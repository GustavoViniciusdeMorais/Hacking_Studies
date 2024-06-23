<?php

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;

require_once __DIR__ . '/vendor/autoload.php';

$app = AppFactory::create();

$app->get('/', function (Request $request, Response $response, $args) {
    $response->getBody()->write("PHP API Service\n");
    return $response;
});

$app->get('/api/check', function (Request $request, Response $response, $args) {
    $response->getBody()->write(
        json_encode([
            'status' => 'sucess',
            'data' => true,
            'message' => 'OK'
        ])
    );
    return $response;
});

$app->run();
