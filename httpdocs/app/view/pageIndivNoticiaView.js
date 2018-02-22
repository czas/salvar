// VIEW pageIndivNoticia

var pageIndivNoticiaView = Backbone.View.extend({
  el : '.bodyContent',

  mostrarIndivNoticia : _.template( $('#templateIndivNoticia').html() ),
  // mostrarComentarios : _.template( $('#templateComentarios').html() ),

  initialize: function( id ){
    var that = this;

    that.render( id );
  },

  render: function( id ){
    var that = this;

    $('.headerContent .slider .carousel').html('');

    var anclaIndivNoticia = $(that.$el).find( '#renderDatos' );
    anclaIndivNoticia.html('');

    anclaIndivNoticia.prepend( that.mostrarIndivNoticia( noticiasDB.get( id ).toJSON() ) );

    // var anclaComentarios = $(anclaIndivNoticia.find( '.comentarios' ));
    // anclaComentarios.html('');
    //
    // var comentarios = comentariosDB.where( { noticia : id } );
    //
    // $.each( comentarios, function(i, elem){
    //   var fila = {
    //     anonimoNombre : elem.get('anonimoNombre'),
    //     anonimoEmail : elem.get('anonimoEmail'),
    //     contenido : elem.get('contenido'),
    //     fecha_publicacion : elem.get('fecha_publicacion'),
    //   }
    //   anclaComentarios.prepend( that.mostrarComentarios( fila ));
    // });
  }
});
