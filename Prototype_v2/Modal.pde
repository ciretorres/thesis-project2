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
  Button btnInstrucciones;
  Button btnCerrar = new Button();
  Button btnComenzar;

  // propiedades botones  
  
  String formaBtn = "rect";

  boolean conBtnInferiorUno = false;
  String btnInferiorUnoId;
  int btnInferiorUnoAlto = 72;
  int btnInferiorUnoAncho = ancho - (espaciado * 2);
  int btnInferiorUnoPositionX = width/2 - (btnInferiorUnoAncho/2);
  int btnInferiorUnoPositionY = height/2 + (alto/2) - (btnInferiorUnoAlto);
  color btnInferiorUnoColorFondo;
  int btnInferiorUnoTextoTamanio;
  String btnUnoInferiorTexto;
  
  // btn 2
  boolean conBtnInferiorDos = false;
  String btnInferiorDosId;  
  int altoBtnDosInferior = 72;
  int anchoBtnDosInferior = ancho - (espaciado * 2);
  int positionXBtnDosInferior = width/2 - (anchoBtnDosInferior/2);
  int positionYBtnDosInferior = height/2 + (alto/2) - (altoBtnDosInferior);
  color btnInferiorDosColorFondo;
  int btnInferiorDosTextoTamanio;
  String btnDosInferiorTexto;
  // btn cerrar
  boolean conBtnCerrar = false;
  String idBtnCerrar;
  color colorFondoBtnCerrar;
  int tamanioBtnCerrar;
  String textoBtnCerrar;

  // propiedades botón rectángulo
  int rectX = width/2 - (btnInferiorUnoAncho/2);
  int rectY = height/2 + (alto/2) - (btnInferiorUnoAlto);


  Modal() {
    // Constructor
    // if (fullScreen) redimensiona();
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void show() {    
    String idModal = id;
    int anchoModal = ancho;
    int altoModal = alto;
    int positionXModal = x;
    int positionYModal = y;
    color strokeColorModal = bordeColor;
    color backgroundColorModal = fondoColor;
    color colorTextModal = textoColor;
    String tituloModal = titulo;
    String textoModal = texto;


    // Dibuja rect dialogo
    fill(backgroundColorModal);
    noStroke();
    rect(positionXModal, positionYModal, anchoModal, altoModal, borderRadius);

    // Botones
    // TODO: revisar si se puede unir con lo de abajo o hacerlo función
    if (conBtnCerrar) {
      // propiedades botón cerrar
      btnCerrar.id = idBtnCerrar;
      btnCerrar.forma = formaBtn;
      btnCerrar.circleColor = colorFondoBtnCerrar;
      btnCerrar.circleSize = tamanioBtnCerrar;
      btnCerrar.circleX = positionXModal + anchoModal - (btnCerrar.circleSize/2) - espaciado;
      btnCerrar.circleY = positionYModal + (btnCerrar.circleSize/2) + espaciado;
      btnCerrar.render();
    }

    if (conBtnInferiorDos) {
      // contruye
      btnComenzar = new Button(
        anchoBtnDosInferior,
        positionXBtnDosInferior,
        positionYBtnDosInferior - altoBtnDosInferior - espaciado
        );
      // inicializa
      btnComenzar.id = btnInferiorDosId;
      btnComenzar.fondoColor = btnInferiorDosColorFondo;
      btnComenzar.texto = btnDosInferiorTexto;
      btnComenzar.textoTamanio = btnInferiorDosTextoTamanio;
      // render
      btnComenzar.render();
    }

    if (conBtnInferiorUno) {
      // contruye
      btnInstrucciones = new Button(
        btnInferiorUnoAncho,
        btnInferiorUnoPositionX,
        btnInferiorUnoPositionY
        );
      // inicializa
      btnInstrucciones.id = btnInferiorUnoId;      
      btnInstrucciones.fondoColor = btnInferiorUnoColorFondo;      
      btnInstrucciones.texto = btnUnoInferiorTexto;
      btnInstrucciones.textoTamanio = btnInferiorUnoTextoTamanio;

      
      btnInstrucciones.textoY = btnInstrucciones.rectY + (btnInstrucciones.rectAlto/2) - (btnInstrucciones.textoTamanio/5);
      // render
      btnInstrucciones.render();
    }

    // titulo dialog
    textSize(tituloSize);
    textAlign(LEFT, TOP);
    fill(colorTextModal);
    text(tituloModal, positionXModal + espaciado, positionYModal);
    // texto dialog
    textSize(textoSize);
    text(textoModal, positionXModal + espaciado, positionYModal + tituloSize + espaciado);
  }

  /**
   * Método para redimensionar y reposicionar todo, si el ancho de la pantalla está fullscreen
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
