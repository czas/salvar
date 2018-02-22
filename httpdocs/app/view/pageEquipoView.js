// VIEW pageEquipo

var pageEquipoView = Backbone.View.extend({
  el : '.bodyContent',

  mostrarPageEquipo : _.template( $('#templatePageEquipo').html() ),
  mostrarSelect : _.template( $('#templateSelect').html() ),

  events: {
    'click .seleccionEquipo button': 'mostrar',
    'click .mostrarSeleccion .table .modalNadador': 'modal'
  },

  initialize: function(){
    var that = this;

    that.render();
  },

  mostrar: function(){
    var that = this;

    var selectNad = $('.selectEquipoNadadores option:selected').val();
    var selectInfo = $('.selectPruebasInfo option:selected').val();

    if( selectInfo === 'all' ){
      var nadadoresDB = new nadadoresCollection();
      var categoriasDB = new categoriasCollection();
      nadadoresDB.usePublico();

      var anclaSelectEquipo = $(that.$el.find( '#renderDatos .mostrarSeleccion' ));
      anclaSelectEquipo.html('');

      $.when( nadadoresDB.fetch(), categoriasDB.fetch() ).done( function(){
        var datosProcesados = nadadoresDB.toJSON();
        if( selectNad === 'nadadores' ){
          datosProcesados = new Array();
          var select = nadadoresDB.where( { genero : '0' } );

          $.each( select, function( i, elem ){
            datosProcesados.push( elem.toJSON() );
          });
        }
        else if( selectNad === 'nadadoras' ){
          datosProcesados = new Array();
          var select = nadadoresDB.where( { genero : '1' } );

          $.each( select, function( i, elem ){
            datosProcesados.push( elem.toJSON() );
          });
        }

        anclaSelectEquipo.html( that.mostrarSelect( {
          opcion : true,
          nadador : datosProcesados,
          categorias : categoriasDB.toJSON()
        } ) );
      });
    }
    else{
      var nadadoresDB = new nadadoresCollection();
      var categoriasDB = new categoriasCollection();
      var nadadorPruebaDB = new nadadorPruebaCollection();
      var pruebasDB = new pruebasCollection();

      nadadoresDB.usePublico();
      nadadorPruebaDB.usePublico();

      var anclaSelectEquipo = $(that.$el.find( '#renderDatos .mostrarSeleccion' ));
      anclaSelectEquipo.html('');

      $.when( nadadoresDB.fetch(), categoriasDB.fetch(), nadadorPruebaDB.fetch(), pruebasDB.fetch() ).done( function(){

        var pruebaSelect = nadadorPruebaDB.where( { pruebaId : selectInfo } );
        var nadadorPruebaSelect = new Array();
        $.each( pruebaSelect, function( i, elem ){
          nadadorPruebaSelect.push( elem.toJSON() );
        });

        var datosProcesados = nadadoresDB.toJSON();
        if( selectNad === 'nadadores' ){
          datosProcesados = new Array();
          var select = nadadoresDB.where( { genero : '0' } );

          $.each( select, function( i, elem ){
            datosProcesados.push( elem.toJSON() );
          });
        }
        else if( selectNad === 'nadadoras' ){
          datosProcesados = new Array();
          var select = nadadoresDB.where( { genero : '1' } );

          $.each( select, function( i, elem ){
            datosProcesados.push( elem.toJSON() );
          });
        }

        anclaSelectEquipo.html( that.mostrarSelect( {
          opcion : false,
          nadador : datosProcesados,
          categorias : categoriasDB.toJSON(),
          prueba : pruebasDB.findWhere( { id : selectInfo } ).toJSON(),
          nadadorPruebaSelect
        } ) );
      });
    }
  },

  modal: function(e){
    var that = this;

    var nadadoresDB = new nadadoresCollection();
    var categoriasDB = new categoriasCollection();

    nadadoresDB.usePublico();

    // Reseteamos por seguridad
    nadadoresDB.reset();

    $.when( nadadoresDB.fetch(), categoriasDB.fetch() ).done( function(){
      var id = '';
      if( e.srcElement ){
        id = e.srcElement.childNodes[1].value;
      }
      else if( e.target ){
        id = e.target.childNodes[1].value;
      }

      $( '.ficha_técnica .modal .modal-title' ).html( nadadoresDB.get( id ).get('nombre') + ' ' + nadadoresDB.get( id ).get('apellidos') );
      $( '.ficha_técnica .modal .modal-body img' ).attr( 'src', '/media/nadadores/' + nadadoresDB.get( id ).get('foto') );
      $( '.ficha_técnica .modal .modal-body img' ).attr( 'alt', 'Foto de ' +  nadadoresDB.get( id ).get('nombre') );
      $( '.ficha_técnica .modal .modal-body .fechaNac_Nadador' ).html( nadadoresDB.get( id ).get('fecha_nacimiento') );
      $( '.ficha_técnica .modal .modal-body .categoria_Nadador' ).html( categoriasDB.get( nadadoresDB.get( id ).get('categoria') ).get('nombre') );
      $( '.ficha_técnica .modal .modal-body .descripcion_Nadador' ).html( nadadoresDB.get( id ).get('descripcion') );
    });
  },

  render: function(){
    var that = this;

    $('.headerContent .slider .carousel').html('');

    var anclaPageEquipo = $(that.$el).find( '#renderDatos' );
    anclaPageEquipo.html('');

    var pruebasDB = new pruebasCollection();

    $.when( pruebasDB.fetch() ).done( function(){
      anclaPageEquipo.html( that.mostrarPageEquipo( { pruebas : pruebasDB.toJSON() } ) );
    });
  }
});
