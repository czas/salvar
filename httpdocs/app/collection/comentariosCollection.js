// COLLECTION comentarios

var comentariosCollection = Backbone.Collection.extend({
  url : '../../appPHP/syncComentarios.php',
  model : comentariosModel
});
