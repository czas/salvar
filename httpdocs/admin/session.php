<?php

  include('../../privateData.php');

  session_start();

  if( isset( $_SESSION['login_admin'] ) ){
    $admin_check = $_SESSION['login_admin'];

    if( ( $userLogIn !== $admin_check ) ){
      header('Location: login.php');
      exit;
    }
  }
  else{
    header('Location: login.php');
    exit;
  }
