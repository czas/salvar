<?php
  include('session.php');

  if( isset( $_GET['folder'] ) && $_GET['file'] !== '0' ){
    $nombreDirectorioFile = './../media/archivos/'.$_GET['folder'].'/'.$_GET['file'];
    unlink($nombreDirectorioFile);
  }
  header("Location: /admin#seccArchivos");
  exit;
