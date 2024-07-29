/**
 * @class Modal Construye un modal de diálogo mediante un rectángulo blanco
 * que presentará información relevante o instrucciones del sistema.
 *
 * @property {String} id Indica el identificador del modal
 * @property {int} ancho Indica el ancho del modal
 * @property {int} alto Indica el alto del modal
 * @property {int} x Indica la posición horizontal del modal
 * @property {int} y Indica la posición vertical del modal
 * @property {color} fondoColor Indica el color del fondo del modal
 * @property {color} bordeColor Indica el color del borde del modal
 * @property {color} textoColor Indica el color del texto del modal
 * @property {String} titulo Indica el título del modal
 * @property {String} texto Indica el texto en el cuerpo del modal
 *
 * @property {Object} btnInstrucciones Indica el botón para ir las instrucciones
 * @property {Object} btnComenzar Indica el botón para cerrar el dialogo y comenzar
 * @property {Object} btnCerrar Indica el botón para cerrar el dialogo
 */
class Modal {
  // si el ancho de la pantalla es mayor
  boolean fullScreen = width > 1366;
  // Propiedades Diálogo
  String id;
  // Dimensiones
  int ancho = width - (width/2);
  int alto = height - (height/3);
  // Posición
  int x = width/2 - (ancho/2);
  int y =  height/2 - (alto/2);
  // Color
  color fondoColor = color(102, 102, 102, 191);
  color bordeColor = color(102, 102, 102, 191);
  // Texto
  color textoColor = color(0);
  String titulo = "# Título";
  String texto = "Texto";

  // declara object Botón en caso de necesitar
  Button btnInstrucciones = new Button();
  Button btnCerrar = new Button();
  Button btnComenzar = new Button();

  // propiedades botones
  String btnForma = "rect";
  // btn 1
  boolean conBtnInferiorUno = false;
  String btnInferiorUnoId;
  int btnInferiorUnoAncho = ancho - (espaciado * 2);
  int btnInferiorUnoAlto = 72;
  int btnInferiorUnoPositionX = width/2 - (btnInferiorUnoAncho/2);
  int btnInferiorUnoPositionY = height/2 + (alto/2) - (btnInferiorUnoAlto) - espaciado;
  color btnInferiorUnoColorFondo;
  String btnInferiorUnoTexto;
  int btnInferiorUnoTextoTamanio;
  // btn 2
  boolean conBtnInferiorDos = false;
  String btnInferiorDosId;
  int btnInferiorDosAncho = ancho - (espaciado * 2);
  int btnInferiorDosAlto = 72;
  int btnInferiorDosPositionX = width/2 - (btnInferiorDosAncho/2);
  int btnInferiorDosPositionY = height/2 + (alto/2) - (btnInferiorDosAlto) - (btnInferiorUnoAlto) - (espaciado * 2);
  color btnInferiorDosColorFondo;
  String btnInferiorDosTexto;
  int btnInferiorDosTextoTamanio;
  // btn cerrar
  boolean conBtnCerrar = false;
  String btnCerrarId;
  color btnCerrarFondoColor;
  int btnCerrarTamanio;


  Modal() {
    // Constructor
    // if (fullScreen) redimensiona();
  }

  String idModal = id;
  int anchoModal = ancho;
  int altoModal = alto;
  int positionXModal = x;
  int positionYModal = y;
  color strokeColorModal = bordeColor;
  color backgroundColorModal = fondoColor;
  color colorTextModal = textoColor;

  /** @function show Método donde se renderea todo lo que se va a dibujar */
  void show() {
    String tituloModal = titulo;
    String textoModal = texto;

    // Dibuja rectángulo modal
    fill(backgroundColorModal);
    noStroke();
    rect(positionXModal, positionYModal, anchoModal, altoModal, borderRadius);

    // Dibuja botones
    if (conBtnCerrar) {
      inicializaBtnCerrar();
      btnCerrar.render();
    }
    if (conBtnInferiorDos) {
      inicializaBtnComenzar();
      btnComenzar.render();
    }
    if (conBtnInferiorUno) {
      inicializaBtnInstrucciones();
      btnInstrucciones.render();
    }

    // dibuja titulo modal
    textSize(tituloTamanio);
    textAlign(LEFT, TOP);
    fill(colorTextModal);
    text(tituloModal, positionXModal + espaciado, positionYModal);
    // dibuja texto modal
    textSize(textoTamanio);
    text(textoModal, positionXModal + espaciado, positionYModal + tituloTamanio + espaciado);
  }

  /** @function inicializaBtnCerrar Inicializa el botón de cerrar */
  void inicializaBtnCerrar() {
    btnCerrar.id = btnCerrarId;
    btnCerrar.forma = btnForma;
    btnCerrar.btnCirculoTamanio = btnCerrarTamanio;
    btnCerrar.btnCirculoX = positionXModal + anchoModal - (btnCerrar.btnCirculoTamanio/2) - espaciado;
    btnCerrar.btnCirculoY = positionYModal + (btnCerrar.btnCirculoTamanio/2) + espaciado;
    btnCerrar.btnCirculoFondoColor = btnCerrarFondoColor;
  }
  /** @function inicializaBtnComenzar Inicializa el botón de comenzar */
  void inicializaBtnComenzar() {
    btnComenzar.id = btnInferiorDosId;
    btnComenzar.ancho = btnInferiorDosAncho;
    btnComenzar.x = btnInferiorDosPositionX;
    btnComenzar.y = btnInferiorDosPositionY;
    btnComenzar.fondoColor = btnInferiorDosColorFondo;
    btnComenzar.texto = btnInferiorDosTexto;
    btnComenzar.textoTamanio = btnInferiorDosTextoTamanio;
  }
  /** @function inicializaBtnInstrucciones Inicializa el botón de instrucciones */
  void inicializaBtnInstrucciones() {
    btnInstrucciones.id = btnInferiorUnoId;
    btnInstrucciones.ancho = btnInferiorUnoAncho;
    btnInstrucciones.x = btnInferiorUnoPositionX;
    btnInstrucciones.y = btnInferiorUnoPositionY;
    btnInstrucciones.fondoColor = btnInferiorUnoColorFondo;
    btnInstrucciones.texto = btnInferiorUnoTexto;
    btnInstrucciones.textoTamanio = btnInferiorUnoTextoTamanio;
  }

  /**
   * TODO: arreglar esta función
   * @funtion redimenciona Método para redimensionar y reposicionar todo, si el ancho de la pantalla está fullscreen
   */
  void redimensiona() {
    println("la pantalla es más ancha que 1366px");
    // // dialog
    // anchoModal = 683;
    // altoModal = 512;
    // positionXModal = width/2 - (anchoModal/2);
    // positionYModal = height/2 - (altoModal/2);
    // // boton rect
    // btnInferiorUnoAncho = anchoModal - (espaciado * 2);
    // rectX = width/2 - (btnInferiorUnoAncho/2);
    // rectY = height/2 + (altoModal/2) - (btnInferiorUnoAlto);
    // // boton circle
    // // circleX = positionXModal + anchoModal - (circleSize/2) - espaciado;
    // // circleY = positionYModal + (circleSize/2) + espaciado;
    // btnCerrar.circleX = positionXModal + anchoModal - (btnCerrar.circleSize/2) - espaciado;
    // btnCerrar.circleY = positionYModal + (btnCerrar.circleSize/2) + espaciado;
  }
}
