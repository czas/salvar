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
  <!-- <link rel="stylesheet/less" type="text/css" href="../styles/less/allStyles.less">
  <script type="text/javascript" src="../styles/less/js/optionsLess.js"></script>
  <script type="text/javascript" src="../styles/less/js/less.js"></script> -->
  <link type="text/css" rel="stylesheet" href="../styles/css/allStyles.less.css">
</head>
<body>

  <div class="admin">
    <div class="menuAdmin">
      <nav class="navbar" role="navigation">
        <div class="logo clearfix">
          <a class="urlLogoImg" href="#">
            <picture>
              <source srcset="../media/img/logo-admin200.png" media="(max-width: 350px)">
              <img src="../media/img/logo-admin200.png" alt="Logo Salvar">
            </picture>
          </a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarAdmin" aria-expanded="false" aria-controls="navbar">
            <i class="fa fa-2x fa-bars" aria-hidden="true"></i>
          </button>
        </div>
        <div id="navbarAdmin" class="navbar-collapse collapse" aria-expanded="false">
          <div class="dropdown">
            <button class="btn btn-default dropdown-toggle" type="button" id="logiut" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              ADMINISTRADOR
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" aria-labelledby="logiut">
              <li><a href="logout.php">Cerrar sesión</a></li>
            </ul>
          </div>
          <ul class="nav nav-pills nav-stacked">
            <li><a href="#seccNoticias">Noticias</a></li>
            <li><a href="#seccNadadores">Nadadores</a></li>
            <li><a href="#seccMinimas">T. Mínimas</a></li>
            <li><a href="#seccPruebas">Pruebas</a></li>
            <li><a href="#seccArchivos">Archivos</a></li>
          </ul>
        </div>
      </nav>
    </div>

    <div class="bodyAdminContent">
      <div id="renderDatos"></div>
    </div>
  </div>

  <!-- TEMPLATES -->
  <!-- _.template adminNoticias -->
  <script type="text/template" id="templateAdminNoticias">
    <div class="container">
      <h3>SECCIÓN NOTICIAS</h3>
      <div class="row">
        <div class="col-xs-12">
          <div class="panel-group" id="accordionNoticias" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingNewNoticia" data-toggle="collapse" data-parent="#accordionNoticias" href="#collapseNewNoticia" aria-expanded="true" aria-controls="collapseNewNoticia">
                <h4 class="panel-title">Nueva Noticia</h4>
              </div>
              <div id="collapseNewNoticia" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNewNoticia">
                <div class="panel-body">
                  <form class="formNoticias" action="" method="post">
                    <div class="row">
                      <div class="col-md-8 col-xs-12">
                        <div class="form-group">
                          <label for="labelNew_title">Título</label>
                          <input type="text" name="titulo" id="labelNew_title" class="form-control titulo" placeholder="Título">
                        </div>
                        <div class="form-group">
                          <label for="labelNew_subtitle">Subtítulo</label>
                          <input type="text" name="subtitulo" id="labelNew_subtitle" class="form-control subtitulo" placeholder="Subtítulo">
                        </div>
                        <div class="form-group">
                          <label for="labelNew_description">Descripción</label>
                          <textarea name="descripcion" id="labelNew_description" class="form-control descripcion" rows="3" cols="40" placeholder="Descripción"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="labelNew_content">Contenido</label>
                          <!-- Pondremos CKEditor -->
                          <textarea name="contenido" id="labelNew_content" class="form-control contenido" rows="6" cols="40" placeholder="Contenido"></textarea>
                        </div>
                        <div class="form-group">
                          <label>Imagen</label>
                          <input type="hidden" name="imagen" class="hash_md5">
                        </div>
                        <!-- IFRAME para poder subir imágenes -->
                        <iframe src="./submitImage.php?folder=noticias" style="border-width: 0;height:200px;float:left;"></iframe>
                        <div class="form-group">
                          <button type="button" name="button" class="btn btn-primary insert" style="float:left;">Enviar</button>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingUpdateDeleteNoticia" data-toggle="collapse" data-parent="#accordionNoticias" href="#collapseUpdateDeleteNoticia" aria-expanded="false" aria-controls="collapseUpdateDeleteNoticia">
                <h4 class="panel-title">Editar / Borrar Noticia</h4>
              </div>
              <div id="collapseUpdateDeleteNoticia" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingUpdateDeleteNoticia">
                <div class="panel-body">
                  <div class="row">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="form-group col-md-8">
                          <select class="form-control selectNoticias" name="selectNoticias">
                            <option value="-"> - Elige Noticia - </option>
                            <% _.each(noticias , function(item){ %>
                              <option value="<%= item.id %>"><%= item.titulo %></option>
                            <% }); %>
                          </select>
                        </div>
                        <div class="form-group col-md-4">
                          <button type="button" name="button" class="btn btn-success editar">Editar</button>
                          <button type="button" name="button" class="btn btn-danger delete">Borrar</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- #templateUpdateNoticia -->
                  <div id="update"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>
  <!-- _.template updateNoticia -->
  <script type="text/template" id="templateUpdateNoticia">
    <div class="row">
      <div class="col-xs-12">
        <div class="row">
          <form class="formNoticias" action="" method="post">
            <input type="hidden" name="name" class="id" value="<%= noticias.id %>">
            <div class="col-md-8 col-xs-12">
              <div class="form-group">
                <label for="labelUpdate_title">Título</label>
                <input type="text" name="titulo" id="labelUpdate_title" class="form-control titulo" value="<%= noticias.titulo %>" placeholder="Título">
              </div>
              <div class="form-group">
                <label for="labelUpdate_subtitle">Subtítulo</label>
                <input type="text" name="subtitulo" id="labelUpdate_subtitle" class="form-control subtitulo" value="<%= noticias.subtitulo %>" placeholder="Subtítulo">
              </div>
              <div class="form-group">
                <label for="labelUpdate_description">Descripción</label>
                <textarea name="descripcion" id="labelUpdate_description" class="form-control descripcion" rows="3" cols="40" placeholder="Descripción"><%= noticias.descripcion %></textarea>
              </div>
              <div class="form-group">
                <label for="labelUpdate_content">Contenido</label>
                <!-- Pondremos CKEditor -->
                <textarea name="contenido" id="labelUpdate_content" class="form-control contenido" rows="6" cols="40" placeholder="Contenido"><%= noticias.contenido %></textarea>
              </div>
              <div class="form-group">
                <label>Imagen</label>
                <input type="hidden" class="hash_md5">
              </div>
              <!-- IFRAME para poder subir imágenes -->
              <iframe src="./submitImage.php?folder=noticias&fileUploaded=<%= noticias.imagen %>" style="border-width: 0;height:200px;float:left;"></iframe>
              <div class="form-group">
                <button type="button" name="button" class="btn btn-primary update" style="float:left;">Enviar</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </script>



  <!-- _.template adminNadadores -->
  <script type="text/template" id="templateAdminNadadores">
    <div class="container">
      <h3>SECCIÓN NADADORES</h3>
      <div class="row">
        <div class="col-xs-12">
          <div class="panel-group" id="accordionNadadores" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingNewNadador" data-toggle="collapse" data-parent="#accordionNadadores" href="#collapseNewNadador" aria-expanded="true" aria-controls="collapseNewNadador">
                <h4 class="panel-title">Nuevo Nadador</h4>
              </div>
              <div id="collapseNewNadador" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNewNadador">
                <div class="panel-body">
                  <form class="formNadadores" action="" method="post">
                    <div class="row">
                      <div class="col-md-8 col-xs-12">
                        <div class="form-group">
                          <label for="labelNew_nombre">Nombre</label>
                          <input type="text" name="nombre" id="labelNew_nombre" class="form-control nombre" placeholder="Nombre">
                        </div>
                        <div class="form-group">
                          <label for="labelNew_apellidos">Apellidos</label>
                          <input type="text" name="apellidos" id="labelNew_apellidos" class="form-control apellidos" placeholder="Apellidos">
                        </div>
                        <div class="form-group">
                          <label for="labelNew_fecha_nacimiento">Fecha Nacimiento</label>
                          <input type="text" name="fecha_nacimiento" id="labelNew_fecha_nacimiento" class="form-control fecha_nacimiento" placeholder="Fecha Nacimiento">
                        </div>
                        <div class="radio">
                          <label id="genero_masculino">
                            <input type="radio" name="genero" class="genero" id="genero_masculino" value="0">
                            Chico
                          </label>
                        </div>
                        <div class="radio">
                          <label id="genero_femenino">
                            <input type="radio" name="genero" class="genero" id="genero_femenino" value="1">
                            Chica
                          </label>
                        </div>
                        <label for="genero" class="error"></label>
                        <div class="form-group">
                          <label for="labelNew_email">Email</label>
                          <input type="text" name="email" id="labelNew_email" class="form-control email" placeholder="Email">
                        </div>
                        <div class="form-group">
                          <label for="labelNew_telefono">Telefono</label>
                          <input type="text" name="telefono" id="labelNew_telefono" class="form-control telefono" placeholder="Telefono">
                        </div>
                        <div class="form-group">
                          <label for="labelNew_descripcion">Descripción</label>
                          <textarea name="descripcion" id="labelNew_descripcion" class="form-control descripcion" rows="6" cols="40" placeholder="Descripción"></textarea>
                        </div>
                        <div class="form-group">
                          <label for="labelNew_categoria">Categoría</label>
                          <select class="form-control selectCategoria" id="labelNew_categoria" name="selectCategoria">
                            <option value="-"> - Elige Categoría - </option>
                            <% _.each(categoria , function(item){ %>
                              <option value="<%= item.id %>"><%= item.nombre %></option>
                            <% }); %>
                          </select>
                        </div>
                        <div class="form-group">
                          <label>Imagen</label>
                          <input type="hidden" class="hash_md5">
                        </div>
                        <!-- IFRAME para poder subir imágenes -->
                        <iframe src="./submitImage.php?folder=nadadores" style="border-width: 0;height:200px;float:left;"></iframe>
                        <div class="form-group">
                          <button type="button" name="button" class="btn btn-primary insert" style="float:left;">Enviar</button>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="panel panel-default">
              <div class="panel-heading" role="tab" id="headingUpdateDeleteNadador" data-toggle="collapse" data-parent="#accordionNadadores" href="#collapseUpdateDeleteNadador" aria-expanded="false" aria-controls="collapseUpdateDeleteNadador">
                <h4 class="panel-title">Editar / Borrar Nadador</h4>
              </div>
              <div id="collapseUpdateDeleteNadador" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingUpdateDeleteNadador">
                <div class="panel-body">
                  <div class="row">
                    <div class="col-xs-12">
                      <div class="row">
                        <div class="form-group col-md-8">
                          <select class="form-control selectNadadores" name="selectNadadores">
                            <option value="-"> - Elige Nadador - </option>
                            <% _.each(nadadores , function(item){ %>
                              <option value="<%= item.id %>"><%= item.apellidos %>, <%= item.nombre %></option>
                            <% }); %>
                          </select>
                        </div>
                        <div class="form-group col-md-4">
                          <button type="button" name="button" class="btn btn-success editar">Editar</button>
                          <button type="button" name="button" class="btn btn-danger delete">Borrar</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- #templateUpdateNadador -->
                  <div id="update"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>
  <!-- _.template updateNadador -->
  <script type="text/template" id="templateUpdateNadador">
    <div class="row">
      <div class="col-xs-12">
        <div class="row">
          <form class="formNadadores" action="" method="post">
            <input type="hidden" name="name" class="id" value="<%= nadadores.id %>">
            <div class="col-md-8 col-xs-12">
              <div class="form-group">
                <label for="labelUpdate_nombre">Nombre</label>
                <input type="text" name="nombre" id="labelUpdate_nombre" class="form-control nombre" value="<%= nadadores.nombre %>" placeholder="Nombre">
              </div>
              <div class="form-group">
                <label for="labelUpdate_apellidos">Apellidos</label>
                <input type="text" name="apellidos" id="labelUpdate_apellidos" class="form-control apellidos" value="<%= nadadores.apellidos %>" placeholder="Apellidos">
              </div>
              <div class="form-group">
                <label for="labelUpdate_fecha_nacimiento">Fecha Nacimiento</label>
                <input type="text" name="fecha_nacimiento" id="labelUpdate_fecha_nacimiento" class="form-control fecha_nacimiento" value="<%= nadadores.fecha_nacimiento %>" placeholder="Fecha Nacimiento">
              </div>
              <% if( nadadores.genero == 0){ %>
                <div class="radio">
                  <label><input type="radio" name="genero" class="genero" value="0" checked> Chico</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="genero" class="genero" value="1"> Chica</label>
                </div>
                <label for="genero" class="error"></label>
              <% }else{ %>
                <div class="radio">
                  <label><input type="radio" name="genero" class="genero" value="0"> Chico</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="genero" class="genero" value="1" checked> Chica</label>
                </div>
                <label for="genero" class="error"></label>
              <% } %>
              <div class="form-group">
                <label for="labelUpdate_email">Email</label>
                <input type="text" name="email" id="labelUpdate_email" class="form-control email" value="<%= nadadores.email %>" placeholder="Email">
              </div>
              <div class="form-group">
                <label for="labelUpdate_telefono">Telefono</label>
                <input type="text" name="telefono" id="labelUpdate_telefono" class="form-control telefono" value="<%= nadadores.telefono %>" placeholder="Telefono">
              </div>
              <div class="form-group">
                <label for="labelUpdate_descripcion">Descripción</label>
                <textarea name="descripcion" id="labelUpdate_descripcion" class="form-control descripcion" rows="6" cols="40" placeholder="Descripción"><%= nadadores.descripcion %></textarea>
              </div>
              <div class="form-group">
                <label for="labelUpdate_categoria">Categoría</label>
                <select class="form-control selectCategoria" id="labelUpdate_categoria" name="selectCategoria">
                  <option value="-"> - Elige Categoría - </option>
                  <% _.each(categoria , function(item){
                      if( nadadores.categoria  === item.id ){
                  %>
                    <option value="<%= item.id %>" selected><%= item.nombre %></option>
                  <% }else{ %>
                    <option value="<%= item.id %>"><%= item.nombre %></option>
                  <% }}); %>
                </select>
              </div>
              <div class="form-group">
                <label>Imagen</label>
                <input type="hidden" class="hash_md5">
              </div>
              <!-- IFRAME para poder subir imágenes -->
              <iframe src="./submitImage.php?folder=nadadores&fileUploaded=<%= nadadores.foto %>" style="border-width: 0;height:200px;float:left;"></iframe>
              <div class="form-group">
                <button type="button" name="button" class="btn btn-primary update" style="float:left;">Enviar</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </script>



  <!-- _.template adminMinimas -->
  <script type="text/template" id="templateAdminMinimas">
    <div class="container">
      <h3>SECCIÓN T. MÍNIMAS</h3>
      <div class="row">
        <div class="col-xs-12">
          <div class="minimas">
              <div class="row">
                <div class="form-group col-md-8">
                  <select class="form-control selectPrueba" name="selectPrueba">
                    <option value="-"> - Elige Prueba - </option>
                    <% _.each( _.where( pruebas, { tiempo: '1' } ), function(item){ %>
                      <option value="<%= item.id %>"><%= item.nombre %> - <%= item.metros %> m</option>
                    <% }); %>
                  </select>
                </div>
              </div>
              <!-- #templateUpdatePruebaCategoria -->
              <div id="update"></div>
          </div>
        </div>
      </div>
    </div>
  </script>
  <!-- _.template updatePruebaCategoria -->
  <script type="text/template" id="templateUpdatePruebaCategoria">
    <div class="row">
      <div class="col-xs-12 col-sm-11 col-md-8">
        <div class="panel panel-default">
          <div class="panel-heading">
            <input type="hidden" name="id" class="id" value="<%= prueba.id %>">
            <h3 class="panel-title"><button type="button" name="button" class="btn btn-xs btn-primary update">Actualizar</button> <%= prueba.nombre %> - <%= prueba.metros %> m</h3>
          </div>
          <div class="panel-body table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th>Categoría</th>
                  <th>T. Mínima Masculina (min:seg:ms)</th>
                  <th>T. Mínima Femenina (min:seg:ms)</th>
                </tr>
              </thead>
              <tbody>
                <% _.each(_.where( pruebaCategoria, { pruebaId: prueba.id } ), function(item){
                    var cat = _.findWhere( categoria, { id: item.categoriaId } );
                %>
                  <tr class="fila">
                    <form class="tiempoValidate">
                      <input type="hidden" name="idCat" class="idCat" value="<%= item.id %>">
                      <td><%= cat.nombre %></td>
                      <td><input type="text" name="minimaMasculina" class="form-control minimaMasculina asdf" value="<%= item.tiempo_minima_masculina %>" placeholder="min:seg:miliseg"></td>
                      <td><input type="text" name="minimaFemenina" class="form-control minimaFemenina asdf" value="<%= item.tiempo_minima_femenina %>" placeholder="min:seg:miliseg"></td>
                    </form>
                  </tr>
                <% }); %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </script>



  <!-- _.template adminPruebas -->
  <script type="text/template" id="templateAdminPruebas">
    <div class="container">
      <h3>SECCIÓN PRUEBAS Y NADADOR</h3>
      <div class="row">
        <div class="col-xs-12">
          <div class="nadadorPrueba">
            <div class="row">
              <div class="form-group col-sm-3">
                <select class="form-control selectNadadorPrueba" name="selectNadadorPrueba">
                  <option value="-"> - Elige Nadador - </option>
                  <% _.each(nadadores, function(item){ %>
                    <option value="<%= item.id %>"><%= item.apellidos %>, <%= item.nombre %></option>
                  <% }); %>
                </select>
              </div>
              <div class="form-group col-sm-6">
                <select class="form-control selectPruebaNadador" name="selectPruebaNadador">
                  <option value="-"> - Elige Prueba - </option>
                  <% _.each( pruebas, function(item){ %>
                    <option value="<%= item.id %>"><%= item.nombre %> - <%= item.metros %> m</option>
                  <% }); %>
                </select>
              </div>
              <div class="col-xs-12">
                <div class="candidato">
                  <h4>DATOS</h4>
                  <form>
                    <div class="form-group col-xs-12 col-sm-6 col-md-3">
                      <input type="hidden" name="idNad" class="idNad">
                      <input type="text" name="nadador" class="form-control nadador" style="width:100%;" readonly>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-4">
                      <input type="hidden" name="idPrueb" class="idPrueb">
                      <input type="text" name="prueba" class="form-control prueba" style="width:100%;" readonly>
                    </div>
                    <div class="form-group col-xs-12 col-sm-6 col-md-3">
                      <input type="text" name="tiempo" class="form-control tiempo" placeholder="min:seg:miliseg">
                    </div>
                    <div class="form-group col-xs-12">
                      <button type="button" name="button" class="btn btn-primary insert">Enviar</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th></th>
                        <th>Nombre</th>
                        <th>Categoría</th>
                        <th>Prueba</th>
                        <th>T. Nadador</th>
                        <th>T. Mínima</th>
                        <th>Mínima</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% _.each(nadadoresPruebas, function( item ){
                          var nadador = _.findWhere( nadadores, { id: item.nadadorId } );
                          var categoria = _.findWhere( categorias, { id: nadador.categoria } );
                          var prueba = _.findWhere( pruebas, { id: item.pruebaId } );
                          if( prueba.tiempo == '1' ){
                            var pruebaCat = _.findWhere( pruebasCategorias, { pruebaId: item.pruebaId, categoriaId: nadador.categoria  } );
                            var tiempo_minima = ( nadador.genero == 0 ? pruebaCat.tiempo_minima_masculina : pruebaCat.tiempo_minima_femenina );
                            var minima =  ( item.tiempo_nadador <= tiempo_minima ? 'SI' : 'NO' );
                          }
                      %>
                        <tr>
                          <td class="text-center">
                            <button type="button" class="btn btn-danger btn-xs delete">
                              X<input type="hidden" name="idNP" class="idNP" value="<%= item.id %>">
                            </button>
                          </td>
                          <td><%= nadador.apellidos %>, <%= nadador.nombre %></td>
                          <td><%= categoria.nombre %></td>
                          <td><%= prueba.nombre %></td>
                          <% if( prueba.tiempo == '1' ){ %>
                            <td><%= item.tiempo_nadador %></td>
                            <td><%= tiempo_minima %></td>
                            <td><%= minima %></td>
                          <% }else{ %>
                            <td> - </td>
                            <td> - </td>
                            <td> - </td>
                          <% } %>
                        </tr>
                      <% }); %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>



  <!-- _.template adminArchivos -->
  <script type="text/template" id="templateAdminArchivos">
    <div class="container">
      <div class="archivos">
        <h3>SECCIÓN SUBIDA ARCHIVOS</h3>
        <div class="row">
          <div class="col-xs-12">
            <form class="" action="<?php $_SERVER["PHP_SELF"] ?>" method="post" enctype="multipart/form-data">
              <div class="form-group col-xs-12 col-sm-4">
                <label>Nombre archivo</label>
                <input type="name" class="form-control" name="namePDF" placeholder="Nombre archivo">
              </div>
              <div class="form-group col-xs-12 col-sm-4">
                <label>Jornada</label>
                <select class="form-control" name="selectJornada">
                  <option value="0">Normativa</option>
                  <option value="1">Jornadas</option>
                </select>
              </div>
              <div class="form-group col-xs-12 col-sm-12">
                <label>Archivo (PDF)</label>
                <input type="file" name="filePDF">
              </div>
              <div class="form-group col-xs-12 col-sm-12">
                <input class="btn btn-success" type="submit" name="sendFile" value="SUBIR">
              </div>
            </form>
            <?php
              if( isset( $_POST['sendFile'] ) ){
                if( preg_match( '/^application\/pdf$/', $_FILES['filePDF']['type'] ) ){
                  if ( is_uploaded_file( $_FILES['filePDF']['tmp_name'] ) ){
                    $nombreDirectorio = false;
                    if( $_POST['selectJornada'] === '0' ){
                      $nombreDirectorio = './../media/archivos/normativa/';
                    }
                    else{
                      $nombreDirectorio = './../media/archivos/jornadas/';
                    }

                    $carpetaExiste = false;
                    if( is_dir($nombreDirectorio) ){ // Miramos si el directorio existe
                      $carpetaExiste = true;
                    }
                    else{
                      $carpetaExiste = true;
                      mkdir($nombreDirectorio, 0777, true); // Creamos el directorio si no existe
                    }

                    if( $carpetaExiste ){
                      $nombreFichero = $_POST['namePDF'].'.pdf';

                      if( empty( trim( $_POST['namePDF'] ) ) ){
                        $nombreFichero = $_FILES['filePDF']['name']; // Le damos el nuevo nombre al archivo
                      }

                      $nombreCompleto = $nombreDirectorio.$nombreFichero; // Ruta completa donde se guardara el archivo (dentro del directorio que creamos)
                      move_uploaded_file( $_FILES['filePDF']['tmp_name'], $nombreCompleto ); // Hacemos el movimiento de archivo a la carpeta que creamos
                    }
                  }// is_uploaded_file()
                }// preg_match( '/^ ... $/', $_FILES[''][''] )
              }// isset( $_POST['']
            ?>
          </div>
        </div>
        <div class="row">
          <div class="col-xs-12 col-sm-4">
            <h4>Normativa</h4>
            <?php
              $directorio = './../media/archivos/normativa/';
      				if ( is_dir($directorio) ) {
      					$dir = opendir($directorio);
                echo '<ul class="filesPdf">';
      					while( ( $elemento = readdir($dir) ) != false ){
      						if( $elemento != "." && $elemento != ".." ){

                    ?>
                      <li>
                        <a class="btn btn-danger btn-xs" href="./removeFile.php?folder=normativa&file=<?php echo $elemento ?>">Borrar</a>
                        <a href="<?php echo $directorio.$elemento ?>" target="_blank">
                          <i class="fa fa-file-pdf-o" aria-hidden="true"></i> <?php echo $elemento ?>
                        </a>
                      </li>
                    <?php

      						}
      					}
                echo '</ul>';
      					closedir($dir);
      				}
            ?>
          </div>
          <div class="col-xs-12 col-sm-4">
            <h4>Jornadas</h4>
            <?php
              $directorio = './../media/archivos/jornadas/';
      				if ( is_dir($directorio) ) {
      					$dir = opendir($directorio);
                echo '<ul class="filesPdf">';
      					while( ( $elemento = readdir($dir) ) != false ){
      						if( $elemento != "." && $elemento != ".." ){
                    ?>
                      <li>
                        <a class="btn btn-danger btn-xs" href="./removeFile.php?folder=jornadas&file=<?php echo $elemento ?>">Borrar</a>
                        <a href="<?php echo $directorio.$elemento ?>" target="_blank">
                          <i class="fa fa-file-pdf-o" aria-hidden="true"></i> <?php echo $elemento ?>
                        </a>
                      </li>
                    <?php
      						}
      					}
                echo '</ul>';
      					closedir($dir);
      				}
            ?>
          </div>
        </div>
      </div>
    </div>
  </script>



  <!-- Frameworks - jQuery/Bootstrap/Underscore/Backbone -->
  <script type="text/javascript" src="../frameworks/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="../frameworks/bootstrap/dist/js/bootstrap.js"></script>
  <script type="text/javascript" src="../frameworks/message-box/messagebox.min.js"></script>
  <script type="text/javascript" src="../frameworks/underscore/underscore-min.js"></script>
  <script type="text/javascript" src="../frameworks/backbone/backbone-min.js"></script>

  <!-- jQuery Validate -->
  <script type="text/javascript" src="../frameworks/jquery-validate/jquery.validate.min.js"></script>

  <!-- APP Model/Controller/View -->
  <script type="text/javascript" src="../app/model/noticiasModel.js"></script>
  <script type="text/javascript" src="../app/model/nadadoresModel.js"></script>
  <script type="text/javascript" src="../app/model/categoriasModel.js"></script>
  <script type="text/javascript" src="../app/model/pruebasModel.js"></script>
  <script type="text/javascript" src="../app/model/pruebaCategoriaModel.js"></script>
  <script type="text/javascript" src="../app/model/nadadorPruebaModel.js"></script>

  <script type="text/javascript" src="../app/collection/noticiasCollection.js"></script>
  <script type="text/javascript" src="../app/collection/nadadoresCollection.js"></script>
  <script type="text/javascript" src="../app/collection/categoriasCollection.js"></script>
  <script type="text/javascript" src="../app/collection/pruebasCollection.js"></script>
  <script type="text/javascript" src="../app/collection/pruebaCategoriaCollection.js"></script>
  <script type="text/javascript" src="../app/collection/nadadorPruebaCollection.js"></script>

  <script type="text/javascript" src="../app/view/pageAdminNoticiasView.js"></script>
  <script type="text/javascript" src="../app/view/pageAdminNadadoresView.js"></script>
  <script type="text/javascript" src="../app/view/pageAdminPruebaCategoriaView.js"></script>
  <script type="text/javascript" src="../app/view/pageAdminNadadorPruebaView.js"></script>
  <script type="text/javascript" src="../app/view/pageAdminArchivosView.js"></script>

  <script type="text/javascript" src="../app/router/allRouter.js"></script>
  <script type="text/javascript" src="../app/appAdminSalvar.js"></script>

</body>
</html>
