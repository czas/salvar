// VIEW pageAdminNadadorPrueba

var pageAdminNadadorPruebaView = Backbone.View.extend({
  el : '.admin .bodyAdminContent',

  templateAdminPruebas : _.template( $('#templateAdminPruebas').html() ),

  events: {
    'click .nadadorPrueba .candidato .insert': 'postPut',
    'click .nadadorPrueba .table .delete': 'delete',
    'change .nadadorPrueba select': 'write'
  },

  initialize: function(){
    var that = this;

    that.render();
  },

  write: function(){
    var that = this;

    var nadadorPruebaDB = new nadadorPruebaCollection();
    nadadorPruebaDB.usePrivado();

    // Reseteamos por seguridad
    nadadorPruebaDB.reset();

    var idNadador = $('.nadadorPrueba .selectNadadorPrueba option:selected').val();
    var idPrueba = $('.nadadorPrueba .selectPruebaNadador option:selected').val();

    $.when( nadadorPruebaDB.fetch() ).done( function(){

      if( !isNaN(idNadador) && !isNaN(idPrueba) ){
        var existe = nadadorPruebaDB.findWhere( { nadadorId : idNadador, pruebaId : idPrueba } )

        $( '.nadadorPrueba .candidato' ).show();

        $('.nadadorPrueba .candidato .idNad').val(idNadador);
        $('.nadadorPrueba .candidato .nadador').val( $('.nadadorPrueba .selectNadadorPrueba option:selected').text() );
        $('.nadadorPrueba .candidato .idPrueb').val(idPrueba);
        $('.nadadorPrueba .candidato .prueba').val( $('.nadadorPrueba .selectPruebaNadador option:selected').text() );

        if( existe ){
          $('.nadadorPrueba .candidato .tiempo').val( nadadorPruebaDB.findWhere( { nadadorId : idNadador, pruebaId : idPrueba } ).get('tiempo_nadador') );
        }
        else{
          $('.nadadorPrueba .candidato .tiempo').val('00:00:00');
        }
      }
      else{
        $( '.nadadorPrueba .candidato' ).hide();
      }
    });
  },

  postPut: function(){
    var that = this;

    var dato = new Object();

    var nadadorPruebaDB = new nadadorPruebaCollection();
    var nadadoresDB = new nadadoresCollection();
    var pruebasDB = new pruebasCollection();
    var pruebaCategoriaDB = new pruebaCategoriaCollection();
    nadadorPruebaDB.usePrivado();
    nadadoresDB.usePrivado();
    pruebaCategoriaDB.usePrivado();

    // Reseteamos por seguridad
    nadadoresDB.reset();
    pruebasDB.reset();
    nadadorPruebaDB.reset();
    pruebaCategoriaDB.reset();

    $.when( nadadorPruebaDB.fetch(), nadadoresDB.fetch(), pruebasDB.fetch(), pruebaCategoriaDB.fetch() ).done( function(){

      var idNddr = $('.nadadorPrueba .candidato').find('.idNad').val();
      var nddr = $('.nadadorPrueba .candidato').find('.nadador').val();
      var idPrb = $('.nadadorPrueba .candidato').find('.idPrueb').val();
      var prb = $('.nadadorPrueba .candidato').find('.prueba').val();
      var tmp = $('.nadadorPrueba .candidato').find('.tiempo').val();

      var existe = nadadorPruebaDB.findWhere( { nadadorId : idNddr, pruebaId : idPrb } );

      // jQuery Validate
      $.validator.addMethod( 'tiempo', function(valor, elemento){
        return this.optional(elemento) || /^([0]?[0-9]):([0-5]?[0-9])(:([0-5]?[0-9]))?$/i.test(valor);
      }, 'Formato inválido');

      if( existe ){
        dato = {
          nadadorId: idNddr,
          pruebaId: idPrb,
          categoria_nadador: nadadoresDB.findWhere( { id : idNddr } ).get('categoria'),
          tiempo_nadador: tmp,
          id: existe.get('id')
        }
      }
      else{
        dato = {
          nadadorId: idNddr,
          pruebaId: idPrb,
          categoria_nadador: nadadoresDB.findWhere( { id : idNddr } ).get('categoria'),
          tiempo_nadador: tmp
        }
      }

      $( '.candidato form' ).validate({
        rules: {
          tiempo: { required: true, tiempo: true },
        },

        messages: {
          tiempo: 'Tiempo erróneo',
        }
      });

      var formValido = false;

      if( $( '.candidato form' ).valid() ){
        formValido = true;
      }


      if( formValido ){
        console.log("VALIDADO");
        nadadorPruebaDB.create( dato,
          {
            wait: true,
            success: function( resp ){
              console.log('EXITO');
              console.log(resp);
              that.render();
            },
            error: function( err ){
              console.log('ERROR');
              console.log(err);
            }
          }
        );
      }
    });
  },

  delete: function(e){
    var that = this;

    var nadadorPruebaDB = new nadadorPruebaCollection();
    nadadorPruebaDB.usePrivado();

    // Reseteamos por seguridad
    nadadorPruebaDB.reset();

    $.when( nadadorPruebaDB.fetch() ).done( function(){
      var id = '';
      if( e.srcElement ){
        id = e.srcElement.childNodes[1].value;
      }
      else if( e.target ){
        id = e.target.childNodes[1].value;
      }

      if( !isNaN(id) ){
        $.MessageBox({
          buttonDone  : 'SI',
          buttonFail  : 'NO',
          message     : '¿Quieres borrar ese registro?'
        }).done(function(){
          console.log('PULSO SI');

          nadadorPruebaDB.get( id ).destroy({
            success: function(resp) {
              console.log('EXITO');
              $.MessageBox('BORRADO');
              console.log(resp);
              that.render();
            },
            error: function( err ){
              console.log('ERROR');
              console.log(err);
            }
          });
        }).fail(function(){
          console.log('PULSO NO');
        });
      }
    });
  },

  render: function(){
    var that = this;

    var anclaAdmin = $(that.$el).find( '#renderDatos' );
    anclaAdmin.html('');

    var nadadoresDB = new nadadoresCollection();
    var pruebasDB = new pruebasCollection();
    var nadadorPruebaDB = new nadadorPruebaCollection();
    var pruebaCategoriaDB = new pruebaCategoriaCollection();
    var categoriasDB = new categoriasCollection();
    nadadorPruebaDB.usePrivado();
    nadadoresDB.usePrivado();
    pruebaCategoriaDB.usePrivado();

    // Reseteamos por seguridad
    nadadoresDB.reset();
    pruebasDB.reset();
    nadadorPruebaDB.reset();
    pruebaCategoriaDB.reset();
    categoriasDB.reset();

    $.when( nadadoresDB.fetch(), pruebasDB.fetch(), nadadorPruebaDB.fetch(), pruebaCategoriaDB.fetch(), categoriasDB.fetch() ).done( function(){
      anclaAdmin.html( that.templateAdminPruebas( {
        nadadores : nadadoresDB.toJSON(),
        pruebas : pruebasDB.toJSON(),
        nadadoresPruebas : nadadorPruebaDB.toJSON(),
        pruebasCategorias : pruebaCategoriaDB.toJSON(),
        categorias : categoriasDB.toJSON()
      } ) );

      $( '.nadadorPrueba .candidato' ).hide();
    });
  }
});
