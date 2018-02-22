// VIEW pageAdminNadadores

var pageAdminNadadoresView = Backbone.View.extend({
  el : '.admin .bodyAdminContent',

  mostrarAdminNadadores : _.template( $('#templateAdminNadadores').html() ),
  mostrarAdminUpdateNadadores : _.template( $('#templateUpdateNadador').html() ),

  events: {
    'click #collapseNewNadador .insert': 'postPut',
    'click #collapseUpdateDeleteNadador .editar': 'get',
    'click #collapseUpdateDeleteNadador .delete': 'delete',
    'click #collapseUpdateDeleteNadador .update': 'postPut',
    'change #collapseUpdateDeleteNadador .selectNadadores': 'clean'
  },

  initialize: function(){
    var that = this;

    that.render();
  },

  clean: function(){
    var that = this;

    var anclaAdminUpdate = $(that.$el).find( '#update' );
    anclaAdminUpdate.html('');
  },

  postPut: function(){
    var that = this;

    var dato = new Object();
    var nadadoresDB = new nadadoresCollection();
    nadadoresDB.usePrivado();

    // Reseteamos por seguridad
    nadadoresDB.reset();

    var id = parseInt( $('#collapseUpdateDeleteNadador .selectNadadores option:selected').val() );

    // jQuery Validate
    $.validator.addMethod( 'valorNoIgual', function(value, element, argumento ){
      return argumento != value;
    });

    $( '#collapseNewNadador .formNadadores' ).validate({
      rules: {
        nombre: 'required',
        apellidos: 'required',
        fecha_nacimiento: { required: true, dateISO: true},
        genero: { required: true },
        email: { required: true, email: true },
        telefono: { required: true, digits: true },
        descripcion: 'required',
        selectCategoria: { valorNoIgual: '-' }
      },

      messages: {
        nombre: 'Campo nombre obligatorio',
        apellidos: 'Campo apellidos obligatorio',
        fecha_nacimiento: 'Campo fecha erróneo',
        genero: 'Campo género obligatorio',
        email: 'Campo email erróneo',
        telefono: 'Campo teléfono erróneo',
        descripcion: 'Campo descripción obligatorio',
        selectCategoria: 'Selecciona categoría'
      }
    });

    $( '#collapseUpdateDeleteNadador .formNadadores' ).validate({
      rules: {
        nombre: 'required',
        apellidos: 'required',
        fecha_nacimiento: { required: true, dateISO: true},
        genero: { required: true },
        email: { required: true, email: true },
        telefono: { required: true, digits: true },
        descripcion: 'required',
        selectCategoria: { valorNoIgual: '-' }
      },

      messages: {
        nombre: 'Campo nombre obligatorio',
        apellidos: 'Campo apellidos obligatorio',
        fecha_nacimiento: 'Campo fecha erróneo',
        genero: 'Campo género obligatorio',
        email: 'Campo email erróneo',
        telefono: 'Campo teléfono erróneo',
        descripcion: 'Campo descripción obligatorio',
        selectCategoria: 'Selecciona categoría'
      }
    });

    var formValido = false;

    if( $( '#collapseNewNadador' ).length ){
      formValido = false;
      if( $( '#collapseNewNadador .formNadadores' ).valid() ){
        formValido = true;
      }
    }

    if( $( '#collapseUpdateDeleteNadador .formNadadores' ).length ){
      formValido = false;
      if( $( '#collapseUpdateDeleteNadador .formNadadores' ).valid() ){
        formValido = true;
      }
    }

    if( !isNaN(id) ){
      dato = {
        nombre: $('#collapseUpdateDeleteNadador .nombre').val(),
        apellidos: $('#collapseUpdateDeleteNadador .apellidos').val(),
        fecha_nacimiento: $('#collapseUpdateDeleteNadador .fecha_nacimiento').val(),
        genero: parseInt( $('#collapseUpdateDeleteNadador input[name=genero]:checked').val() ),
        email: $('#collapseUpdateDeleteNadador .email').val(),
        telefono: $('#collapseUpdateDeleteNadador .telefono').val(),
        foto: $('#collapseUpdateDeleteNadador .hash_md5').val(),
        descripcion: $('#collapseUpdateDeleteNadador .descripcion').val(),
        categoria: $('#collapseUpdateDeleteNadador .selectCategoria option:selected').val(),
        id: $('#collapseUpdateDeleteNadador .id').val()
      }
    }
    else{
      dato = {
        nombre: $('#collapseNewNadador .nombre').val(),
        apellidos: $('#collapseNewNadador .apellidos').val(),
        fecha_nacimiento: $('#collapseNewNadador .fecha_nacimiento').val(),
        genero: parseInt( $('#collapseNewNadador input[name=genero]:checked').val() ),
        email: $('#collapseNewNadador .email').val(),
        telefono: $('#collapseNewNadador .telefono').val(),
        foto: $('#collapseNewNadador .hash_md5').val(),
        descripcion: $('#collapseNewNadador .descripcion').val(),
        categoria: $('#collapseNewNadador .selectCategoria option:selected').val()
      }
    }

    if( formValido ){
      console.log("VALIDADO");
      nadadoresDB.create( dato,
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
  },

  get: function(){
    var that = this;

    var nadadoresDB = new nadadoresCollection();
    var categoriasDB = new categoriasCollection();
    nadadoresDB.usePrivado();

    // Reseteamos por seguridad
    nadadoresDB.reset();
    categoriasDB.reset();

    var id = parseInt( $('#collapseUpdateDeleteNadador .selectNadadores option:selected').val() );

    if( !isNaN(id) ){
      var anclaAdminUpdate = $(that.$el).find( '#update' );
      anclaAdminUpdate.html('');

      $.when( nadadoresDB.fetch(), categoriasDB.fetch() ).done( function(){
        anclaAdminUpdate.html( that.mostrarAdminUpdateNadadores( { nadadores : nadadoresDB.get( id ).toJSON(), categoria : categoriasDB.toJSON() } ) );
      });
    }
  },

  delete: function(){
    var that = this;

    var nadadoresDB = new nadadoresCollection();
    var nadadorPruebaDB = new nadadorPruebaCollection();
    nadadoresDB.usePrivado();
    nadadorPruebaDB.usePrivado();

    // Reseteamos por seguridad
    nadadoresDB.reset();
    nadadorPruebaDB.reset();

    $.when( nadadoresDB.fetch(), nadadorPruebaDB.fetch() ).done( function(){
      var id = $('#collapseUpdateDeleteNadador .selectNadadores option:selected').val();

      if( !isNaN(id) ){
        $.MessageBox({
          buttonDone  : 'SI',
          buttonFail  : 'NO',
          message     : '¿Quieres borrar a '+nadadoresDB.get( id ).get('nombre')+' '+nadadoresDB.get( id ).get('apellidos')+'?'
        }).done(function(){
          console.log('PULSO SI');

          // Tenemos que borrar las entrada con el usuario indicado de la tabla 'salv_nadador_prueba'
          $.each( nadadorPruebaDB.where( { nadadorId : id } ), function(i, elem){
            nadadorPruebaDB.get( elem.get('id') ).destroy({
              success: function(resp) {
                console.log('EXITO');
                console.log(resp);
              },
              error: function( err ){
                console.log('ERROR');
                console.log(err);
              }
            });
          });

          nadadoresDB.get( id ).destroy({
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
    var categoriasDB = new categoriasCollection();
    nadadoresDB.usePrivado();

    // Reseteamos por seguridad
    nadadoresDB.reset();
    categoriasDB.reset();

    $.when( nadadoresDB.fetch(), categoriasDB.fetch() ).done( function(){
      anclaAdmin.html( that.mostrarAdminNadadores( { nadadores : nadadoresDB.toJSON(), categoria : categoriasDB.toJSON() } ) );
    });
  }
});
