<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Salvamento Arteixo</title>
  <!-- CSS - Bootstrap/Font Awesome -->
  <link type="text/css" rel="stylesheet" href="frameworks/font-awesome/css/font-awesome.min.css">
  <!-- APP CSS -->
  <!-- <link rel="stylesheet/less" type="text/css" href="styles/less/allStyles.less">
  <script type="text/javascript" src="styles/less/js/optionsLess.js"></script>
  <script type="text/javascript" src="styles/less/js/less.js"></script> -->
  <link rel="stylesheet" type="text/css" href="styles/css/allStyles.less.css">
</head>
<body>

  <!-- HEADER -->
  <div class="headerContent">
    <nav class="navbar navbar-fixed-top" role="navigation">
      <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <i class="fa fa-3x fa-bars" aria-hidden="true"></i>
            </button>
            <a class="navbar-brand" href="#home">
              <img src="media/img/logo-salvar1.png" class="img-responsive" alt="Logo Salvar">
            </a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#home">Inicio</a></li>
              <li><a href="#noticias">Noticias</a></li>
              <li><a href="#equipo">Equipo</a></li>
              <li><a href="#contacto">Contacto</a></li>
            </ul>
          </div>
      </div>
    </nav>
    <div class="slider" style="margin-top:100px;">
      <div class="carousel slide" data-ride="carousel" data-interval="5000" data-pause="false"></div>
    </div>
  </div>

  <!-- BODY -->
  <div class="bodyContent">
    <div id="renderDatos"></div>
  </div>

  <!-- FOOTER -->
  <footer class="footerContent">
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-sm-5 col-sm-offset-1">
          <h5 class="contacto">Contacto</h5>
          <address>
            <i class="fa fa-fw fa-2x fa-envelope"></i> <a href="mailto:salvamentoarteixo@hotmail.com">salvamentoarteixo@hotmail.com</a>
          </address>
        </div>
        <div class="col-xs-12 col-sm-6">
          <h5 class="contacto">Redes Sociales</h5>
          <ul class="redesSociales">
            <li class="rs facebook">
              <a href="https://www.facebook.com/clubsalvamentoarteixo" target="_blank">
                <i class="fa fa-fw fa-2x fa-facebook" aria-hidden="true"></i>
              </a>
            </li>
            <li class="rs twitter">
              <a href="https://twitter.com/salvar09" target="_blank">
                <i class="fa fa-fw fa-2x fa-twitter" aria-hidden="true"></i>
              </a>
            </li>
            <li class="rs instagram">
              <a href="https://www.instagram.com/salvamentoarteixo/" target="_blank">
                <i class="fa fa-fw fa-2x fa-instagram" aria-hidden="true"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>


<!-- TEMPLATES -->
<!---------------------------------------------------------------------------------------------------------->
<!---------------------------------------------------------------------------------------------------------->
<!-- _.template Slider -->
  <script type="text/template" id="templateSlider">
    <div class="carousel-inner" role="listbox">
      <div class="item item-01 active" style="height:50vh;width:100%;background: rgba(0, 0, 0, 0) url('./media/img/carousel/slider1.jpg') no-repeat scroll center / cover;"></div>
      <div class="item item-02" style="height:50vh;width:100%;background: rgba(0, 0, 0, 0) url('./media/img/carousel/slider2.jpg') no-repeat scroll center / cover;"></div>
      <div class="item item-03" style="height:50vh;width:100%;background: rgba(0, 0, 0, 0) url('./media/img/carousel/slider3.jpg') no-repeat scroll bottom / cover;"></div>
      <div class="item item-03" style="height:50vh;width:100%;background: rgba(0, 0, 0, 0) url('./media/img/carousel/slider4.jpg') no-repeat scroll center / cover;"></div>
    </div>
  </script>

  <!-- _.template Home -->
  <script type='text/template' id="templateHome">
    <div class="container">
      <div class="pageHome">
        <div class="row">
          <div class="col-md-9">
            <div class="row">
              <div class="col-xs-12">
                <h2>Noticias</h2>
                <!-- #templateHomeNoticias -->
                <div class="noticias"></div>
              </div>
            </div>
            <div class="row">
              <div class="jornadas">
                <div class="col-sm-6">
                  <h1>Normativa</h1>
                  <?php
                    $directorio = './media/archivos/normativa/';
            				if ( is_dir($directorio) ) {
            					$dir = opendir($directorio);
                      echo '<ul class="filesPdf">';
            					while( ( $elemento = readdir($dir) ) != false ){
            						if( $elemento != "." && $elemento != ".." ){

                          ?>
                            <li>
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
                <div class="col-sm-6">
                  <h1>Jornadas</h1>
                  <?php
                    $directorio = './media/archivos/jornadas/';
            				if ( is_dir($directorio) ) {
            					$dir = opendir($directorio);
                      echo '<ul class="filesPdf">';
            					while( ( $elemento = readdir($dir) ) != false ){
            						if( $elemento != "." && $elemento != ".." ){
                          ?>
                            <li>
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
          <div class="col-md-3">
            <div class="row">
              <div class="col-xs-12">
                <h3>Colaboradores</h3>
                <img class="img-responsive" src="/media/img/colaboradores.jpg" alt="Colaborades Club SALVAR">
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <h3>Facebook</h3>
                <div class="fb-page" data-href="https://www.facebook.com/clubsalvamentoarteixo" data-tabs="timeline" data-small-header="true" data-adapt-container-width="true" data-height="350" data-hide-cover="false" data-show-facepile="false">
                  <blockquote cite="https://www.facebook.com/clubsalvamentoarteixo" class="fb-xfbml-parse-ignore">
                    <a href="https://www.facebook.com/clubsalvamentoarteixo">Club Salvamento Arteixo</a>
                  </blockquote>
                </div>
                <div id="fb-root"></div>
                <script>
                  ( function( d, s, id ){
                      var js, fjs = d.getElementsByTagName(s)[0];
                      if( d.getElementById(id) ) return;
                      js = d.createElement(s); js.id = id;
                      js.src = '//connect.facebook.net/es_ES/sdk.js#xfbml=1&version=v2.8';
                      fjs.parentNode.insertBefore( js, fjs );
                  }( document, 'script', 'facebook-jssdk' ) );
                </script>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>

  <!-- _.template HomeNoticias -->
  <script type='text/template' id="templateHomeNoticias">
    <% if ( numElemt === (size-4) ) { %>
      <div class="row">
        <div class="col-xs-12 text-center">
          <span><a class="btn btn-default" href="#noticias">Ver más noticias</a></span>
        </div>
      </div>
    <% } %>
    <% if( numElemt >= (size-3) ) { %>
      <div class="row">
        <div class="col-md-8">
          <h3 class="tituloNoticia"><a href="#noticias/noticia/<%= id %>" class="goToIndivNoticia"><%= titulo %></a></h3>
          <p class="text-justify"><%= descripcion %></p>
        </div>
        <div class="col-md-4">
          <img class="img-responsive" src="media/noticias/<%= imagen %>" alt="<%= titulo %>">
        </div>
      </div>
    <% } %>
  </script>



<!---------------------------------------------------------------------------------------------------------->
<!---------------------------------------------------------------------------------------------------------->
  <!-- _.template Noticias -->
  <script type="text/template" id="templateNoticias">
    <div class="container">
      <div class="pageNoticias">
        <h2>Noticias</h2>
        <!-- #templateColNoticias -->
        <div class="colNoticias row row-eq-height"></div>
      </div>
    </div>
  </script>

  <!-- _.template templateColNoticias -->
  <script type="text/template" id="templateColNoticias">
    <div class="col-sm-4 moduloNoticia">
      <div class="row">
        <div class="col-xs-12">
          <img src="media/noticias/<%= imagen %>" class="img-responsive" alt="<%= titulo %>">
        </div>
        <div class="col-xs-12">
          <h3 class="tituloNoticia"><a href="#noticias/noticia/<%= id %>" class="individualNoticia"><%= titulo %></a></h3>
          <p class="text-justify"><%= subtitulo %></p>
        </div>
      </div>
    </div>
  </script>



<!---------------------------------------------------------------------------------------------------------->
<!---------------------------------------------------------------------------------------------------------->
  <!-- _.template Noticia -->
  <script type="text/template" id="templateIndivNoticia">
    <div class="container">
      <div class="zonaNoticia">
        <div class="row row-eq-height">
          <div class="col-xs-12 col-sm-12 col-md-12">
            <img src="media/noticias/<%= imagen %>" class="img-responsive" alt="<%= titulo %>">
          </div>
        </div>
        <div class="row">
          <div class="infoText">
            <div class="col-xs-12 col-sm-12 col-md-12">
              <h3 class="titulo"><%= titulo %></a></h3>
              <h4 class="subtitulo"><%= subtitulo %></h4>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
              <div class="text-justify"><%= contenido %></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </script>



<!---------------------------------------------------------------------------------------------------------->
<!---------------------------------------------------------------------------------------------------------->
  <!-- _.template pageEquipo -->
  <script type="text/template" id="templatePageEquipo">
    <div class="container">
      <div class="seleccionEquipo">
        <h2>Equipo</h2>
        <div class="row">
          <div class="col-xs-12 col-sm-12 col-md-12">
            <p class="text-justify">En esta sección podremos aplicar diferentes filtros para mostrar el conjunto de nadadores o separados por deportistas femeninos o masculinos. Por otra parte, tenemos las diferentes pruebas tanto en piscina como en playas las cuáles se mostrarán según nuestra elección.</p>
          </div>
          <div class="form-group col-md-5 col-sm-6 col-xs-12">
            <select class="form-control selectEquipoNadadores" name="selectEquipoNadadores">
              <option value="all" selected>Todos los nadadores</option>
              <option value="nadadores">Nadadores</option>
              <option value="nadadoras">Nadadoras</option>
            </select>
          </div>
          <div class="form-group col-md-5 col-sm-6 col-xs-12">
            <select class="form-control selectPruebasInfo" name="selectPruebasInfo">
              <option value="all" selected> - </option>
              <% _.each( pruebas, function(item){ %>
                <option value="<%= item.id %>"><%= item.nombre %> - <%= item.metros %> m</option>
              <% }); %>
            </select>
          </div>
          <div class="form-group col-md-2 col-sm-12 col-xs-12">
            <button type="button" name="button" class="btn btn-primary">Enviar</button>
          </div>
        </div>
      </div>
      <!-- #templateAllAll -->
      <div class="mostrarSeleccion"></div>
    </div>
  </script>

  <!-- _.template Select -->
  <script type="text/template" id="templateSelect">
    <div class="row">
      <div class="col-xs-12 col-sm-12 col-md-12">
        <div class="table-responsive">
          <table class="table table-hover">
            <% if( opcion ){ %>
              <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Categoría</th>
                  <th>F. Técnica</th>
                </tr>
              </thead>
              <tbody>
                  <% _.each( nadador, function( nad ){
                     var categoria = _.findWhere( categorias, { id: nad.categoria } );
                  %>
                  <tr>
                    <td><%= nad.apellidos %>, <%= nad.nombre %></td>
                    <td><%= categoria.nombre %></td>
                    <td>
                      <a class="btn btn-default btn-xs modalNadador" data-toggle="modal" data-target="#modalFichaTecnica">
                        Ficha Técnica
                        <input type="hidden" name="id" class="id" value="<%= nad.id %>">
                      </a>
                    </td>
                  </tr>
                <% }); %>
              </tbody>
            <%
              }else{
            %>
              <h4 class="titulo"><strong><%= prueba.nombre %> - <%= prueba.metros %>m</strong></h4>
              <p class="descripcion"><%= prueba.descripcion %></p>
              <% if( nadadorPruebaSelect.length !== 0 ){ %>
                <thead>
                  <tr>
                    <th>Nombre</th>
                    <th>Categoría</th>
                    <th>Tiempo</th>
                    <th>F. Técnica</th>
                  </tr>
                </thead>
                <tbody>
                  <% _.each( nadador, function( nad ){
                    var existeNad = _.findWhere( nadadorPruebaSelect, { nadadorId: nad.id } );
                    if( existeNad ){
                      var categoria = _.findWhere( categorias, { id: nad.categoria } );
                  %>
                    <tr>
                      <td><%= nad.apellidos %>, <%= nad.nombre %></td>
                      <td><%= categoria.nombre %></td>
                      <% if( prueba.tiempo === '0' ){ %>
                        <td>SIN TIEMPO</td>
                      <% }else{ %>
                        <td><%= existeNad.tiempo_nadador %></td>
                      <% } %>
                      <td>
                        <a class="btn btn-default btn-xs modalNadador" data-toggle="modal" data-target="#modalFichaTecnica">
                          Ficha Técnica
                          <input type="hidden" name="id" class="id" value="<%= nad.id %>">
                        </a>
                      </td>
                    </tr>
                  <%
                     }
                    });
                  %>
                </tbody>
              <%
                }else{
              %>
                <div class="alert alert-info">No existen nadadores en esta prueba.</div>
            <%
                }
              }
            %>
          </table>
        </div>
      </div>
    </div>
  </script>



<!---------------------------------------------------------------------------------------------------------->
<!---------------------------------------------------------------------------------------------------------->
  <!-- _.template pageSobreNosotros -->
  <script type="text/template" id="templatePageSobreNosotros">
    <div class="container">
      <div class="sobreNosotros">
        <h2>Sobre Nosotros <small>Salvamento Arteixo</small></h2>
        <div class="row row-eq-height">
          <div class="col-xs-12 col-sm-12 col-md-12">
            <p class="text-justify">
              Club de salvamento y socorrismo deportivo creado en el año 2008 por socorristas locales del Concello de Arteixo. En sus inicios, el club
              estaba compuesto únicamente por integrantes de categría senior y alguno de la categoría júnior. No es hasta el año 2011 en que se crea
              la escuela deportiva del club, a partir del cual el SALVAR pasa a competir en todas las categorías (alevín, infantil, cadete, juvenil,
              senior y master) en las competiciones organizadas por la Federación de Salvamento y Socorrismo de Galicia (FESSGA).
            </p>
          </div>
          <div class="col-xs-12 col-sm-5 col-md-5">
            <adress>
              <p><strong>COMPLEJO DEPORTIVO MUNICIPAL DE ARTEIXO</strong></p>
              <p>R/ Arsenio Iglesias, S/N</p>
              <p>15142 Arteixo (La Coruña)</p>
              <p><strong>teléfono:</strong> 691 10 53 57</p>
              <p><strong>email:</strong> salvamentoarteixo@hotmail.com</p>
            </address>
          </div>
          <div class="col-xs-12 col-sm-7 col-md-7 mapaSituacion">
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1278.5198721778543!2d-8.50899280082974!3d43.309340943452845!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e1!3m2!1ses!2ses!4v1480967232831" width="600" frameborder="0" style="border:0" allowfullscreen></iframe>
          </div>
        </div>
      </div>
    </div>
  </script>



<!---------------------------------------------------------------------------------------------------------->
<!---------------------------------------------------------------------------------------------------------->
<!-- MODAL -->
  <div class="ficha_técnica">
    <div class="modal fade" id="modalFichaTecnica" tabindex="-1" role="dialog">
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title"></h4>
          </div>
          <div class="modal-body">
            <div class="row">
              <div class="col-xs-12 col-sm-3 col-md-3">
                <img class="img-responsive" src="" alt="">
              </div>
              <div class="col-xs-12 col-sm-9 col-md-9">
                <p><strong>Fecha Nacimiento:</strong> <span class="fechaNac_Nadador"></span></p>
                <p><strong>Categoría:</strong> <span class="categoria_Nadador"></span></p>
                <p><strong>DESCRIPCION:</strong></p>
                <p class="text-justify descripcion_Nadador"></p>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-warning" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Frameworks - jQuery/Bootstrap/Underscore/Backbone -->
  <script type="text/javascript" src="frameworks/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="frameworks/bootstrap/dist/js/bootstrap.js"></script>
  <script type="text/javascript" src="frameworks/underscore/underscore-min.js"></script>
  <script type="text/javascript" src="frameworks/backbone/backbone-min.js"></script>


  <!-- APP Model/Collection/View/Router -->
  <script type="text/javascript" src="app/model/noticiasModel.js"></script>
  <script type="text/javascript" src="app/model/nadadoresModel.js"></script>
  <script type="text/javascript" src="app/model/categoriasModel.js"></script>
  <script type="text/javascript" src="app/model/pruebasModel.js"></script>
  <script type="text/javascript" src="app/model/nadadorPruebaModel.js"></script>

  <script type="text/javascript" src="app/collection/noticiasCollection.js"></script>
  <script type="text/javascript" src="app/collection/nadadoresCollection.js"></script>
  <script type="text/javascript" src="app/collection/categoriasCollection.js"></script>
  <script type="text/javascript" src="app/collection/pruebasCollection.js"></script>
  <script type="text/javascript" src="app/collection/nadadorPruebaCollection.js"></script>

  <script type="text/javascript" src="app/view/pageHomeView.js"></script>
  <script type="text/javascript" src="app/view/pageNoticiasView.js"></script>
  <script type="text/javascript" src="app/view/pageIndivNoticiaView.js"></script>
  <script type="text/javascript" src="app/view/pageEquipoView.js"></script>
  <script type="text/javascript" src="app/view/pageContactoView.js"></script>

  <script type="text/javascript" src="app/router/allRouter.js"></script>

  <script type="text/javascript" src="app/appSalvar.js"></script>

</body>
</html>
