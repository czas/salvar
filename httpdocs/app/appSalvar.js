$(document).ready(function(){

  noticiasDB = new noticiasCollection();
  noticiasDB.usePublico();

  $.when(
    noticiasDB.fetch()
  ).done(function(){
    // PageHome
    pageHome = new pageHomeView();

    rutas = new allRouter();
    Backbone.history.start();
  });
});
