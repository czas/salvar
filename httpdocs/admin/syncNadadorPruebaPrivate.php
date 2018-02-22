<?php

  include('session.php');

  header('Content-type: application/json; charset=utf-8');

  // error_log(print_r($_SERVER, true));

  include('../../privateData.php');
  include('../appPHP/metodosBD.php');

  $conexionBD = conectar_MySQL($server, $user, $password, $BD);
  $tabla = 'salv_nadador_prueba';

  if($_SERVER['REQUEST_METHOD'] == "POST"){
    error_log('Entro en POST : CREATE');

    $rawJSONString = file_get_contents('php://input');
    $item = json_decode($rawJSONString);
    insertDatos($conexionBD, $tabla, $item);
  }
  else if($_SERVER['REQUEST_METHOD'] == "PUT"){
    error_log('Entro en PUT : UPDATE');

    $rawJSONString = file_get_contents('php://input');
    $item = json_decode($rawJSONString);
    updateDatos($conexionBD, $tabla, $item);
  }
  else if($_SERVER['REQUEST_METHOD'] == "DELETE"){
    error_log('Entro en DELETE : DELETE');

    $rawJSONString = substr($_SERVER['PATH_INFO'], 1);
    if(is_numeric($rawJSONString)){
      error_log($rawJSONString);
      deleteDatos($conexionBD, $tabla, $rawJSONString);
    }
  }

  $resultado = selectDatos($conexionBD, $tabla);
  echo json_encode($resultado);

  $conexionBD->close();
