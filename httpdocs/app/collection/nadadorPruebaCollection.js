// COLLECTION nadadorPrueba

var nadadorPruebaCollection = Backbone.Collection.extend({
  urlPrivada : '../../admin/syncNadadorPruebaPrivate.php',
  urlPublica : '../../appPHP/syncNadadorPruebaPublic.php',
  model : nadadorPruebaModel,

  usePrivado: function() {
    this.url = this.urlPrivada;
  },

  usePublico: function() {
    this.url = this.urlPublica;
  }
});
