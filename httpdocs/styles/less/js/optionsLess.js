less = {
  env: "development", // o "production"
  async: false,       // carga las importaciones de manera asíncrona
  fileAsync: false,   // carga las importaciones de manera asíncrona cuando
                      // una página usa un protocolo de archivos
  poll: 1000,         // cuando está activado el modo guarda, tiempo en ms
                      // entra consultas
  functions: {},      // funciones del usuario, especificadas por nombre
  dumpLineNumbers: "all", // "comments" o "mediaQuery" o "all"
  relativeUrls: false,// ajusta las urls para que sean relativas si false,
                      // las urls se considerarán relativas respecto al
                      // fichero less de entrada
  // rootpath: ":/a.com/"// una ruta para añadir al comienzo de cada una de las
                      // urls
};
