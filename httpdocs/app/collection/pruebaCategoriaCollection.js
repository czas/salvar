// COLLECTION pruebaCategoria

var pruebaCategoriaCollection = Backbone.Collection.extend({
  urlPrivada : '../../admin/syncPruebaCategoriaPrivate.php',
  urlPublica : '../../appPHP/syncPruebaCategoriaPublic.php',
  model : pruebaCategoriaModel,

  usePrivado: function() {
    this.url = this.urlPrivada;
  },

  usePublico: function() {
    this.url = this.urlPublica;
  }
});
