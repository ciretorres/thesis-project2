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
  String idModal = id;
  // Dimensiones
  int ancho = width - (width/2);
  int anchoModal = ancho;
  int alto = height - (height/3);
  int altoModal = alto;
  // Posición
  int x = width/2 - (anchoModal/2);
  int positionXModal = x;
  int y =  height/2 - (altoModal/2);
  int positionYModal = y;
  // Color
  color fondoColor = color(102, 102, 102, 191);
  color backgroundColorModal = fondoColor;
  color bordeColor = color(102, 102, 102, 191);
  color strokeColorModal = bordeColor;
  // Texto
  color textoColor = color(0);
  color colorTextModal = textoColor;
  String titulo = "# Título";
  String tituloModal = titulo;
  String texto = "Texto";
  String textoTitulo = texto;

  // declara object Botón en caso de necesitar
  Button btnInstrucciones;
  Button btnCerrar = new Button();
  Button btnComenzar;

  // propiedades botones
  String formaBtn = "rect";

  boolean conBtnUnoInferior = false;
  String idBtnUnoInferior;
  boolean colorFondoPrincipalBtnUnoInferior;
  color colorFondoBtnUnoInferior;
  int altoBtnUnoInferior = 72;
  int anchoBtnUnoInferior = anchoModal - (espaciado * 2);
  int positionXBtnUnoInferior = width/2 - (anchoBtnUnoInferior/2);
  int positionYBtnUnoInferior = height/2 + (altoModal/2) - (altoBtnUnoInferior);
  int tamanioTextoBtnUnoInferior;
  String textoBtnUnoInferior;

  boolean conBtnDosInferior = false;
  String idBtnDosInferior;
  color colorFondoBtnDosInferior;
  boolean colorFondoPrincipalBtnDosInferior;
  int altoBtnDosInferior = 72;
  int anchoBtnDosInferior = anchoModal - (espaciado * 2);
  int positionXBtnDosInferior = width/2 - (anchoBtnDosInferior/2);
  int positionYBtnDosInferior = height/2 + (altoModal/2) - (altoBtnDosInferior);
  int tamanioTextoBtnDosInferior;
  String textoBtnDosInferior;

  boolean conBtnCerrar = false;
  String idBtnCerrar;
  color colorFondoBtnCerrar;
  int tamanioBtnCerrar;
  String textoBtnCerrar;

  // propiedades botón rectángulo
  int rectX = width/2 - (anchoBtnUnoInferior/2);
  int rectY = height/2 + (altoModal/2) - (altoBtnUnoInferior);


  Modal() {
    // Constructor
    if (fullScreen) redimensiona();

    // this.alto = altoModal;
    // this.ancho = anchoModal;
    // this.posicionX = positionXModal;
    // this.posicionY = positionYModal;
    // this.colorFondo = backgroundColorModal;
    // titulo = tituloModal;
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void show() {
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
      btnCerrar.rectText = textoBtnCerrar;
      btnCerrar.render();
    }

    if (conBtnDosInferior) {
      // contruye
      btnComenzar = new Button(
        anchoBtnDosInferior,
        positionXBtnDosInferior,
        positionYBtnDosInferior - altoBtnDosInferior - espaciado
        );
      // inicializa
      btnComenzar.id = idBtnDosInferior;
      btnComenzar.rectColor = colorFondoBtnDosInferior;
      btnComenzar.conColorFondoPrincipal = colorFondoPrincipalBtnDosInferior;
      btnComenzar.rectTextSize = tamanioTextoBtnDosInferior;
      btnComenzar.rectText = textoBtnDosInferior;
      // render
      btnComenzar.render();
    }

    if (conBtnUnoInferior) {
      // contruye
      btnInstrucciones = new Button(
        anchoBtnUnoInferior,
        positionXBtnUnoInferior,
        positionYBtnUnoInferior
        );
      // inicializa
      btnInstrucciones.id = idBtnUnoInferior;
      btnInstrucciones.rectText = textoBtnUnoInferior;
      btnInstrucciones.rectTextSize = tamanioTextoBtnUnoInferior;
      btnInstrucciones.rectColor = colorFondoBtnUnoInferior;
      btnInstrucciones.conColorFondoPrincipal = colorFondoPrincipalBtnUnoInferior;
      btnInstrucciones.rectTextY = btnInstrucciones.rectY + (btnInstrucciones.rectAlto/2) - (btnInstrucciones.rectTextSize/5);
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
    text(textoTitulo, positionXModal + espaciado, positionYModal + tituloSize + espaciado);
  }

  /**
   * Método para redimensionar y reposicionar todo, si el ancho de la pantalla está fullscreen
   */
  void redimensiona() {
    println("la pantalla es más ancha que 1366px");
    // dialog
    anchoModal = 683;
    altoModal = 512;
    positionXModal = width/2 - (anchoModal/2);
    positionYModal = height/2 - (altoModal/2);
    // boton rect
    anchoBtnUnoInferior = anchoModal - (espaciado * 2);
    rectX = width/2 - (anchoBtnUnoInferior/2);
    rectY = height/2 + (altoModal/2) - (altoBtnUnoInferior);
    // boton circle
    // circleX = positionXModal + anchoModal - (circleSize/2) - espaciado;
    // circleY = positionYModal + (circleSize/2) + espaciado;
    btnCerrar.circleX = positionXModal + anchoModal - (btnCerrar.circleSize/2) - espaciado;
    btnCerrar.circleY = positionYModal + (btnCerrar.circleSize/2) + espaciado;
  }
}
