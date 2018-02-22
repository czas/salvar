<?php
  include('session.php');
  
  if( isset( $_GET['file'] ) && $_GET['file'] !== '0' ){
    $nombreDirectorioFile = './../media/'.$_GET['folder'].'/'.$_GET['file'];
    unlink($nombreDirectorioFile);
  }
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Salvar Administración</title>
  <!-- CSS - Font Awesome/Message Box -->
  <link type="text/css" rel="stylesheet" href="../frameworks/font-awesome/css/font-awesome.min.css">
  <link type="text/css" rel="stylesheet" href="../frameworks/message-box/messagebox.css">

  <!-- APP CSS -->
  <link rel="stylesheet/less" type="text/css" href="../styles/less/allStyles.less">
  <script type="text/javascript" src="../styles/less/js/optionsLess.js"></script>
  <script type="text/javascript" src="../styles/less/js/less.js"></script>
  <!-- <link type="text/css" rel="stylesheet" href="../styles/css/allStyles.less.css"> -->
  <style>
    .imageDelete{ position: relative; }
    .imageDelete a{
      position: absolute;
      top: 5%;
      left: 5%;
      -webkit-transform: translate(-5%, -5%); /* Safari */
          -ms-transform: translate(-5%, -5%); /* IE 9 */
              transform: translate(-5%, -5%);
    }
  </style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-xs-11">

        <?php
          if( isset( $_GET['fileUploaded'] ) && $_GET['fileUploaded'] !== '0' ){
            $nombreCompleto = './../media/'.$_GET['folder'].'/'.$_GET['fileUploaded'];
        ?>

          <div class="imageDelete">
            <img class="img-responsive" src="<?php echo $nombreCompleto ?>" alt="Foto">
            <a class="btn btn-xs btn-danger" href="./submitImage.php?folder=<?php echo $_GET['folder'] ?>&file=<?php echo $_GET['fileUploaded'] ?>"><i class="fa fa-trash" aria-hidden="true"></i></a>
          </div>

          <!-- Frameworks - jQuery/Bootstrap/Underscore/Backbone -->
          <script type="text/javascript" src="../frameworks/jquery/jquery.min.js"></script>
          <script type="text/javascript" src="../frameworks/bootstrap/dist/js/bootstrap.js"></script>

          <script type="text/javascript">
            window.parent.$( '.bodyAdminContent .hash_md5' ).val('<?php echo $_GET['fileUploaded'] ?>');
          </script>

        <?php
          }
          else{
        ?>
          <form class="" action="./uploadImage.php?upload=<?php echo $_GET['folder'] ?>" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <input type="file" name="imageFile" value="Imagen" onchange="this.form.submit()">
            </div>
          </form>

          <!-- Frameworks - jQuery/Bootstrap/Underscore/Backbone -->
          <script type="text/javascript" src="../frameworks/jquery/jquery.min.js"></script>
          <script type="text/javascript" src="../frameworks/bootstrap/dist/js/bootstrap.js"></script>

          <script type="text/javascript">
            window.parent.$( '.bodyAdminContent .hash_md5' ).val('<?php echo '0' ?>');
          </script>

        <?php
          }
        ?>

      </div>
    </div>
  </div>
<body>
</html>
