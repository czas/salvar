// COLLECTION noticias

var noticiasCollection = Backbone.Collection.extend({
  urlPrivada : '../../admin/syncNoticiasPrivate.php',
  urlPublica : '../../appPHP/syncNoticiasPublic.php',
  model : noticiasModel,

  usePrivado: function() {
    this.url = this.urlPrivada;
  },

  usePublico: function() {
    this.url = this.urlPublica;
  }
});
