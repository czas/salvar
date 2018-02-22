// COLLECTION nadadores

var nadadoresCollection = Backbone.Collection.extend({
  urlPrivada : '../../admin/syncNadadoresPrivate.php',
  urlPublica : '../../appPHP/syncNadadoresPublic.php',
  model : nadadoresModel,

  usePrivado: function() {
    this.url = this.urlPrivada;
  },

  usePublico: function() {
    this.url = this.urlPublica;
  }
});
