<?php

// you can nix this if you really want php garbage notices spammming our logs
error_reporting(E_ERROR | E_PARSE);

require_once('rest/lib/db.php');
require_once('rest/inc/instance.inc');

$db = $GLOBALS['db'] = dbConnect($GLOBALS['instance']['app_name'], $GLOBALS['instance']['database']);

$uri = $_SERVER['REQUEST_URI'];
$bits = explode('/', $uri);

if ($bits[count($bits)] == '') {
    unset($bits[count($bits)]);
}

$model = $bits[2];
$id = intval($bits[3]);

$method = strtolower($_SERVER['REQUEST_METHOD']);

if ($method == 'post' || $method == 'put') {
  $data = json_decode(file_get_contents('php://input'));
}

$resp = array();
include('rest/actions/' . $model . '/' . $method . '.inc');

if($err) {
  header('Content-type: application/json');
  header('HTTP/1.1 400 Bad Request', true, 400);
  $resp = array();
  $resp['msg'] = $err;
  echo json_encode($resp);
} else {
  header('Cache-Control: no-cache, must-revalidate');
  header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
  header('Content-type: application/json');

  echo json_encode($resp);
}

?>