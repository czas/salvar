// VIEW pageHome

var pageHomeView = Backbone.View.extend({
  el : '.bodyContent',

  mostrarSlider : _.template( $('#templateSlider').html() ),
  mostrarHome : _.template( $('#templateHome').html() ),
  mostrarHomeNoticias : _.template( $('#templateHomeNoticias').html() ),

  initialize: function(){
    var that = this;

    that.render();
  },

  render: function(){
    var that = this;

    $('.headerContent .slider .carousel').html( that.mostrarSlider() );

    var anclaHome = $(that.$el).find( '#renderDatos' );
    anclaHome.html('');

    anclaHome.prepend( that.mostrarHome() );

    var anclaHomeNoticias = $(anclaHome.find( '.noticias' ));
    anclaHomeNoticias.html('');

    noticiasDB.each( function(i, elem){
      var dato = {
        id : i.get('id'),
        titulo : i.get('titulo'),
        descripcion : i.get('descripcion'),
        imagen : i.get('imagen'),
        numElemt : elem,
        size: noticiasDB.length
      };
      anclaHomeNoticias.prepend( that.mostrarHomeNoticias( dato ) );
    });
  }
});
