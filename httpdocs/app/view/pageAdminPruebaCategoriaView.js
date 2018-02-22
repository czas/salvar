// VIEW pageAdminPruebaCategoria

var pageAdminPruebaCategoriaView = Backbone.View.extend({
  el : '.admin .bodyAdminContent',

  mostrarAdminMinimas : _.template( $('#templateAdminMinimas').html() ),
  mostrarAdminUpdatePruebaCategoria : _.template( $('#templateUpdatePruebaCategoria').html() ),

  events: {
    'change .minimas .selectPrueba': 'get',
    'click .minimas button.update': 'put'
  },

  initialize: function(){
    var that = this;

    that.render();
  },

  put: function(){
    var that = this;

    var pruebaCategoriaDB = new pruebaCategoriaCollection();
    pruebaCategoriaDB.usePrivado();

    // Reseteamos por seguridad
    pruebaCategoriaDB.reset();

    $( '.minimas .table .fila' ).each( function(){

      var dato  = {
        tiempo_minima_masculina : $( this ).find('.minimaMasculina').val(),
        tiempo_minima_femenina : $( this ).find('.minimaFemenina').val(),
        id: $( this ).find('.idCat').val()
      }

      pruebaCategoriaDB.create( dato,
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
    });
  },

  get: function(){
    var that = this;

    var pruebasDB = new pruebasCollection();
    var categoriasDB = new categoriasCollection();
    var pruebaCategoriaDB = new pruebaCategoriaCollection();
    pruebaCategoriaDB.usePrivado();

    // Reseteamos por seguridad
    pruebasDB.reset();
    categoriasDB.reset();
    pruebaCategoriaDB.reset();

    var id = $('.minimas .selectPrueba option:selected').val();

    if( !isNaN(id) ){
      var anclaAdminUpdate = $(that.$el).find( '#update' );
      anclaAdminUpdate.html('');

      $.when( pruebasDB.fetch(), categoriasDB.fetch(), pruebaCategoriaDB.fetch() ).done( function(){
        anclaAdminUpdate.html( that.mostrarAdminUpdatePruebaCategoria( { prueba : pruebasDB.get( id ).toJSON(), categoria : categoriasDB.toJSON(), pruebaCategoria : pruebaCategoriaDB.toJSON() } ) );
      });
    }
  },

  render: function(){
    var that = this;

    var anclaAdmin = $(that.$el).find( '#renderDatos' );
    anclaAdmin.html('');

    var pruebasDB = new pruebasCollection();

    // Reseteamos por seguridad
    pruebasDB.reset();

    $.when( pruebasDB.fetch() ).done( function(){
      anclaAdmin.html( that.mostrarAdminMinimas( { pruebas : pruebasDB.toJSON() } ) );
    });
  }
});
