<?php

  include('../../privateData.php');

  session_start();

  $error = '';

  if( isset( $_POST['submit'] ) ){
    if( empty( $_POST['userName'] ) || empty( $_POST['userPassword'] ) ){
      $error = '<div class="alert alert-danger">El usuario o el password es inválido</div>';
    }
    else{
      $user = $_POST['userName'];
      $passUser = $_POST['userPassword'];

      $admin = $userLogIn;
      $passAdmin = $passwordLogIn;

      if( password_verify( $user, $admin ) && password_verify( $passUser, $passAdmin ) ){
        $_SESSION['login_admin'] = $admin;
        header("location: /admin");
        exit;
      }
      else {
        $error = '<div class="alert alert-danger">El usuario o el password es inválido</div>';
      }
    }
  }

  if( isset( $_SESSION['login_admin'] ) ){
    header("location: /admin");
    exit;
  }
?>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login SALVAR Administración</title>
  <!-- CSS - Font Awesome/Message Box -->
  <link type="text/css" rel="stylesheet" href="../frameworks/font-awesome/css/font-awesome.min.css">

  <!-- APP CSS -->
  <link rel="stylesheet/less" type="text/css" href="../styles/less/allStyles.less">
  <script type="text/javascript" src="../styles/less/js/optionsLess.js"></script>
  <script type="text/javascript" src="../styles/less/js/less.js"></script>
  <!-- <link type="text/css" rel="stylesheet" href="../styles/css/allStyles.less.css"> -->
</head>
<body style="background:#e6e6e6;">

  <div class="container">
    <div class="row">
      <div class="col-md-4 col-md-offset-4" style="margin-top:50px;">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title">Iniciar sesión</h3>
          </div>
          <div class="panel-body">
            <form class="" action="" method="post">
              <div class="form-group">
                <label for="name">Usuario</label>
                <input type="text" class="form-control" id="name" name="userName" placeholder="Nombre usuario">
              </div>
              <div class="form-group">
                <label for="password">Contraseña</label>
                <input type="password" class="form-control" id="password" name="userPassword" placeholder="**********">
              </div>
              <div class="form-group">
                <input type="submit" class="btn btn-warning btn-block" name="submit" value="Iniciar sesión">
              </div>
              <?php echo $error; ?>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Frameworks - jQuery/Bootstrap/Underscore/Backbone -->
  <script type="text/javascript" src="../frameworks/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="../frameworks/bootstrap/dist/js/bootstrap.js"></script>

</body>
</html>
