<?php

// Conexión BBDD
function conectar_MySQL($host, $user, $pass, $bd){
  // Conectar con MySQL:
  $conexion = new mysqli($host, $user, $pass);
  if( $conexion->connect_errno ){
    die('Error de Conexion ('.$conexion->connect_errno.') '.$conexion->connect_error);
  }

  // Seleccionar la Base de Datos deseada
  $conexion->select_db($bd);
  if( $conexion->errno ){
    die('Error Seleccion BD ('.$conexion->errno.') '.$conexion->error);
  }
  return $conexion;
}


// Seleccionar Datos de tabla deseada - SELECT
function selectDatos($conexion, $tabla){
  $sql = 'SELECT * FROM '.$tabla;

  $resultado = $conexion->query($sql);

  if( $conexion->errno ){
    die('Error Selección datos ('.$conexion->errno.') '.$conexion->error);
  }

  if( $resultado->num_rows > 0 ){
    $salida = $resultado->fetch_all(MYSQLI_ASSOC);
    // $salida = $resultado->fetch_all(MYSQLI_NUM);
    // $salida = $resultado->fetch_all(MYSQLI_BOTH);
    return $salida;
  }
}


// Insert Datos en una tabla deseada - INSERT
function insertDatos($conexion, $tabla, $datoArray){
  $column = array();            //  Campos de las tablas de nuestra BD
  $valueColumn = array();       //  VALUES que traemos del formulario (datos que queremos meter en BD)
  $valuePrepare = array();      //  VALUES (?, ?, ?,...)
  $types = '';                  //  String => s, Integer => i, Double => d, Blob => b

  foreach( $datoArray as $key => $value ){
    array_push($column, $key);
    array_push($valueColumn, $value);
    array_push($valuePrepare, '?');
    $types .= ( gettype($value)==='integer' ) ? 'i' : 's';
  }

  $sql = 'INSERT INTO '.$tabla.' ('.implode(',', $column).') VALUES ('.implode(',', $valuePrepare).');';
  $sentencia = $conexion->prepare($sql);

  $bindParam = '$sentencia->bind_param($types';
  foreach( $valueColumn as $key => $value ){
    $bindParam.=', $valueColumn['.$key.']';
  }
  $bindParam.=');';

  eval($bindParam); //  Sentencia a ejecutar: $sentencia->bind_param($types, $valueColumn[0], $valueColumn[1], ..., $valueColumn[n]);

  $sentencia->execute();
  $sentencia->close();

  if( $conexion->errno ){
    die('Error Selección datos ('.$conexion->errno.') '.$conexion->error);
  }
}


// Update Datos en una tabla deseada - UPLOAD
function updateDatos($conexion, $tabla, $datoArray){
  $column = array();            //  Campos de las tablas de nuestra BD
  $valueColumn = array();       //  VALUES que traemos del formulario (datos que queremos meter en BD)
  $types = '';                  //  String => s, Integer => i, Double => d, Blob => b

  foreach( $datoArray as $key => $value ){
    if( $key !== 'id' ){
      array_push($column, $key.'=?');
    }
    array_push($valueColumn, $value);
    $types .= ( gettype($value)==='integer' ) ? 'i' : 's';
  }

  $sql = 'UPDATE '.$tabla.' SET '.implode(',', $column).' WHERE id=?;';

  $sentencia = $conexion->prepare($sql);

  $bindParam = '$sentencia->bind_param($types';
  foreach( $valueColumn as $key => $value ){
    $bindParam.=', $valueColumn['.$key.']';
  }
  $bindParam.=');';

  eval($bindParam); //  Sentencia a ejecutar: $sentencia->bind_param($types, $valueColumn[0], $valueColumn[1], ..., $valueColumn[n]);

  $sentencia->execute();
  $sentencia->close();

  if( $conexion->errno ){
    die('Error Selección datos ('.$conexion->errno.') '.$conexion->error);
  }
}


// Delete datos de una tabla - DELETE
function deleteDatos($conexion, $tabla, $dato){
  $sql = 'DELETE FROM '.$tabla.' WHERE id=?;';

  $sentencia = $conexion->prepare($sql);
  $sentencia->bind_param('i', $dato);

  $sentencia->execute();
  $sentencia->close();

  if( $conexion->errno ){
    die('Error Selección datos ('.$conexion->errno.') '.$conexion->error);
  }
}
