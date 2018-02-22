// VIEW pageNoticias

var pageNoticiasView = Backbone.View.extend({
  el : '.bodyContent',

  mostrarNoticias : _.template( $('#templateNoticias').html() ),
  mostrarColNoticias : _.template( $('#templateColNoticias').html() ),

  initialize: function(){
    var that = this;

    that.render();
  },

  render: function(){
    var that = this;

    $('.headerContent .slider .carousel').html('');

    var anclaNoticias = $(that.$el).find( '#renderDatos' );
    anclaNoticias.html('');

    anclaNoticias.prepend( that.mostrarNoticias() );

    var anclaColNoticias = $(anclaNoticias.find( '.colNoticias' ));
    anclaColNoticias.html('');

    noticiasDB.each( function(i, elem){
      var fila = {
        id : i.get('id'),
        titulo : i.get('titulo'),
        subtitulo : i.get('subtitulo'),
        imagen : i.get('imagen')
      };
      anclaColNoticias.prepend( that.mostrarColNoticias( fila ) );
    });
  }
});
