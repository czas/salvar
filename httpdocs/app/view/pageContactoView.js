// VIEW pageHome

var pageContactoView = Backbone.View.extend({
  el : '.bodyContent',

  mostrarSlider : _.template( $('#templateSlider').html() ),
  mostrarSobreNosotros : _.template( $('#templatePageSobreNosotros').html() ),

  initialize: function(){
    var that = this;

    that.render();
  },

  render: function(){
    var that = this;

    $('.headerContent .slider .carousel').html( that.mostrarSlider() );

    var ancla = $(that.$el).find( '#renderDatos' );
    ancla.html('');

    ancla.html( that.mostrarSobreNosotros() );
  }
});
