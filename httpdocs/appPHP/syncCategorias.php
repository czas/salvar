<?php

  header('Content-type: application/json; charset=utf-8');

  // error_log(print_r($_SERVER, true));

  include('../../privateData.php');
  include('metodosBD.php');

  $conexionBD = conectar_MySQL($server, $user, $password, $BD);
  $tabla = 'salv_categorias';

  $resultado = selectDatos($conexionBD, $tabla);
  echo json_encode($resultado);

  $conexionBD->close();
