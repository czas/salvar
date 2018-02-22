// ROUTER páginas

var allRouter = Backbone.Router.extend({
  routes : {
    'home' : 'index',                              // salvar/
    'noticias' : 'goToNoticias',                   // salvar/#noticias
    'noticias/noticia/:id' : 'goToIndivNoticia',   // salvar/#noticias/noticia/id
    'equipo' : 'goToEquipo',                       // salvar/#equipo
    'contacto' : 'goToContacto',                   // salvar/#contacto
    // 'admin': 'goToAdmin',
    'seccNoticias' : 'goToAdminNoticias',          // salvar/admin/#seccNoticias
    'seccNadadores' : 'goToAdminNadadores',        // salvar/admin/#seccNadadores
    'seccMinimas' : 'goToAdminMinimas',            // salvar/admin/#seccMinimas
    'seccPruebas' : 'goToAdminPruebas',            // salvar/admin/#seccPruebas
    'seccArchivos' : 'goToAdminArchivos'           // salvar/admin/#seccArchivos
  },

  index: function(){
    pageHome = new pageHomeView();
  },

  goToNoticias: function(){
    pageNoticias = new pageNoticiasView();
  },

  goToIndivNoticia: function( id ){
    pageIndivNoticia = new pageIndivNoticiaView( id );
  },

  goToEquipo: function(){
    pageEquipo = new pageEquipoView();
  },

  goToContacto: function(){
    pageContacto = new pageContactoView();
  },

  goToAdminNoticias: function(){
    pageAdminNoticias = new pageAdminNoticiasView();
  },

  goToAdminNadadores: function(){
    pageAdminNadadores = new pageAdminNadadoresView();
  },

  goToAdminMinimas: function(){
    pageAdminPruebaCategoria = new pageAdminPruebaCategoriaView();
  },

  goToAdminPruebas: function(){
    pageAdminNadadorPrueba = new pageAdminNadadorPruebaView();
  },

  goToAdminArchivos: function(){
    pageAdminArchivos = new pageAdminArchivosView();
  }

});
