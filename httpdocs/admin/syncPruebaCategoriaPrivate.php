<?php

  include('session.php');

  header('Content-type: application/json; charset=utf-8');

  // error_log(print_r($_SERVER, true));

  include('../../privateData.php');
  include('../appPHP/metodosBD.php');

  $conexionBD = conectar_MySQL($server, $user, $password, $BD);
  $tabla = 'salv_prueba_categoria';

  if($_SERVER['REQUEST_METHOD'] == "PUT"){
    error_log('Entro en PUT : UPDATE');

    $rawJSONString = file_get_contents('php://input');
    $item = json_decode($rawJSONString);
    updateDatos($conexionBD, $tabla, $item);
  }

  $resultado = selectDatos($conexionBD, $tabla);
  echo json_encode($resultado);

  $conexionBD->close();
