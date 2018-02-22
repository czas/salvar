<?php
  include('session.php');
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
          if( preg_match( '/^image\/[a-zA-Z]*$/', $_FILES['imageFile']['type'] ) ){
            if ( is_uploaded_file( $_FILES['imageFile']['tmp_name'] ) ){
              $nombreDirectorio = './../media/'.$_GET['upload'].'/';
              $nombreFichero = $_FILES['imageFile']['name'];

              /*
               *  Calcula el resumen criptográfico MD5 del archivo especificado por el parámetro filename usando el » Algoritmo de resumen de mensajes MD5 de RSA Data Security, Inc.,
               *  y devuelve ese resumen. El resumen criptográfico es un número hexadecimal de 32 caracteres.
               */
              $hash_md5 = md5( $nombreFichero );

              if( $hash_md5 ){
                $carpetaExiste = false;
                if( is_dir($nombreDirectorio) ){ // Miramos si el directorio existe
                  $carpetaExiste = true;
                }
                else{
                  $carpetaExiste = true;
                  mkdir ($nombreDirectorio); // Creamos el directorio si no existe
                }

                if( $carpetaExiste ){
                  $nombreFichero = $hash_md5; // Le damos el nuevo nombre al archivo
                  $nombreCompleto = $nombreDirectorio.$nombreFichero; // Ruta completa donde se guardara el archivo (dentro del directorio que creamos)

                  move_uploaded_file($_FILES['imageFile']['tmp_name'], $nombreCompleto); // Hacemos el movimiento de archivo a la carpeta que creamos
                ?>

                  <div class="imageDelete">
                    <img class="img-responsive" src="<?php echo $nombreCompleto ?>" alt="Foto">
                    <a class="btn btn-xs btn-danger" href="./submitImage.php?folder=<?php echo $_GET['upload'] ?>&file=<?php echo $nombreFichero ?>"><i class="fa fa-trash" aria-hidden="true"></i></a>
                  </div>

                  <script type="text/javascript">
                    window.parent.$( '.bodyAdminContent .hash_md5' ).val('<?php echo $nombreFichero ?>');
                  </script>

                <?php
                }
                else{ echo '<div class="alert alert-danger" role="alert">Directorio definitivo inválido</div>'; }
              }
              else{ echo '<div class="alert alert-danger" role="alert">No funcionó el criptografico_md5</div>'; }
            }
            else{ echo '<div class="alert alert-danger" role="alert">No se ha podido subir el fichero</div>'; }
          }
          else{ echo '<div class="alert alert-danger" role="alert">Tiene que ser una imagen</div>'; }
        ?>
      </div>
    </div>
  </div>

  <!-- Frameworks - jQuery/Bootstrap/Underscore/Backbone -->
  <script type="text/javascript" src="../frameworks/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="../frameworks/bootstrap/dist/js/bootstrap.js"></script>
<body>
</html>
