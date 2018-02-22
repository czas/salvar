// COLLECTION categorias

var categoriasCollection = Backbone.Collection.extend({
  url : '../../appPHP/syncCategorias.php',
  model : categoriasModel
});
