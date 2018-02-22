// VIEW pageAdminNoticias

var pageAdminNoticiasView = Backbone.View.extend({
  el : '.admin .bodyAdminContent',

  mostrarAdminNoticias : _.template( $('#templateAdminNoticias').html() ),
  mostrarAdminUpdateNoticias : _.template( $('#templateUpdateNoticia').html() ),

  events: {
    'click #collapseNewNoticia .insert': 'postPut',
    'click #collapseUpdateDeleteNoticia .editar': 'get',
    'click #collapseUpdateDeleteNoticia .delete': 'delete',
    'click #collapseUpdateDeleteNoticia .update': 'postPut',
    'change #collapseUpdateDeleteNoticia .selectNoticias': 'clean'
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
    var noticiasDB = new noticiasCollection();
    noticiasDB.usePrivado();

    // Reseteamos por seguridad
    noticiasDB.reset();

    var id = parseInt( $('#collapseUpdateDeleteNoticia .selectNoticias option:selected').val() );

    // jQuery Validate
    $( '#collapseNewNoticia .formNoticias' ).validate({
      rules: {
        titulo: 'required',
        subtitulo: 'required',
        descripcion: 'required',
        contenido: 'required'
      },

      messages: {
        titulo: 'Campo título obligatorio',
        subtitulo: 'Campo subtítulo obligatorio',
        descripcion: 'Campo descripción obligatorio',
        contenido: 'Campo contenido obligatorio'
      }
    });

    $( '#collapseUpdateDeleteNoticia .formNoticias' ).validate({
      rules: {
        titulo: 'required',
        subtitulo: 'required',
        descripcion: 'required',
        contenido: 'required'
      },

      messages: {
        titulo: 'Campo título obligatorio',
        subtitulo: 'Campo subtítulo obligatorio',
        descripcion: 'Campo descripción obligatorio',
        contenido: 'Campo contenido obligatorio'
      }
    });

    var formValido = false;

    if( $( '#collapseNewNoticia' ).length ){
      formValido = false;
      if( $( '#collapseNewNoticia .formNoticias' ).valid() ){
        formValido = true;
      }
    }

    if( $( '#collapseUpdateDeleteNoticia .formNoticias' ).length ){
      formValido = false;
      if( $( '#collapseUpdateDeleteNoticia .formNoticias' ).valid() ){
        formValido = true;
      }
    }

    if( !isNaN(id) ){
      dato = {
        titulo: $('#collapseUpdateDeleteNoticia .titulo').val(),
        subtitulo: $('#collapseUpdateDeleteNoticia .subtitulo').val(),
        descripcion: $('#collapseUpdateDeleteNoticia .descripcion').val(),
        contenido: $('#collapseUpdateDeleteNoticia .contenido').val(),
        imagen: $('#collapseUpdateDeleteNoticia .hash_md5').val(),
        id: $('#collapseUpdateDeleteNoticia .id').val()
      }
    }
    else{
      dato = {
        titulo: $('#collapseNewNoticia .titulo').val(),
        subtitulo: $('#collapseNewNoticia .subtitulo').val(),
        descripcion: $('#collapseNewNoticia .descripcion').val(),
        contenido: $('#collapseNewNoticia .contenido').val(),
        imagen: $('#collapseNewNoticia .hash_md5').val(),
        fecha_publicacion: new Date()
      }
    }

    if( formValido ){
      console.log("VALIDADO");
      noticiasDB.create( dato,
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

    var noticiasDB = new noticiasCollection();
    noticiasDB.usePrivado();

    var id = parseInt( $('#collapseUpdateDeleteNoticia .selectNoticias option:selected').val() );

    if( !isNaN(id) ){
      var anclaAdminUpdate = $(that.$el).find( '#update' );
      anclaAdminUpdate.html('');

      $.when( noticiasDB.fetch() ).done( function(){
        anclaAdminUpdate.html( that.mostrarAdminUpdateNoticias( { noticias : noticiasDB.get( id ).toJSON() } ) );
      });
    }
  },

  delete: function(){
    var that = this;

    var noticiasDB = new noticiasCollection();
    noticiasDB.usePrivado();

    // Reseteamos por seguridad
    noticiasDB.reset();

    $.when( noticiasDB.fetch() ).done( function(){
      var id = parseInt( $('#collapseUpdateDeleteNoticia .selectNoticias option:selected').val() );

      if( !isNaN(id) ){
        $.MessageBox({
          buttonDone  : 'SI',
          buttonFail  : 'NO',
          message     : '¿Quieres borrar la noticia?'
        }).done(function(){
          console.log('PULSO SI');

          noticiasDB.get( id ).destroy({
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

    var noticiasDB = new noticiasCollection();
    noticiasDB.usePrivado();

    // Reseteamos por seguridad
    noticiasDB.reset();

    $.when( noticiasDB.fetch() ).done( function(){
      anclaAdmin.html( that.mostrarAdminNoticias( { noticias : noticiasDB.toJSON() } ) );
    });
  }
});
