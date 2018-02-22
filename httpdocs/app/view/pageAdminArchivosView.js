// VIEW pageAdminArchivos

var pageAdminArchivosView = Backbone.View.extend({
  el : '.admin .bodyAdminContent',

  mostrarAdminArchivos : _.template( $('#templateAdminArchivos').html() ),

  initialize: function(){
    var that = this;

    that.render();
  },

  render: function(){
    var that = this;

    var anclaAdmin = $(that.$el).find( '#renderDatos' );
    anclaAdmin.html('');

    anclaAdmin.html( that.mostrarAdminArchivos() );
  }
});
