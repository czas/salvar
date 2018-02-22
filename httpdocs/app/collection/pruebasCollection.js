// COLLECTION pruebas

var pruebasCollection = Backbone.Collection.extend({
  url : '../../appPHP/syncPruebas.php',
  model : pruebasModel
});
