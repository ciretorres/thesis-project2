/**
 * @class Modal Construye un modal de diálogo mediante un rectángulo blanco
 * que presentará información relevante o instrucciones del sistema.
 *
 * @property {String} id Indica el identificador del modal
 * @property {int} anchoModal Indica el ancho del modal
 * @property {int} altoModal Indica el alto del modal 
 * @property {int} positionXModal Indica la posición horizontal del modal
 * @property {int} positionYModal Indica la posición vertical del modal
 * @property {color} backgroundColorModal Indica el color del fondo del modal
 * @property {color} strokeColorModal Indica el color del borde del modal
 * @property {color} colorTextModal Indica el color del texto del modal
 * @property {String} tituloModal Indica el título del modal
 * @property {String} textoModal Indica el texto en el cuerpo del modal
 */
class Modal {
  // si el ancho de la pantalla es mayor
  boolean fullScreen = width > 1366;
  // propiedades Dialogo
  String id;  
  int anchoModal = width - (width/2);
  int altoModal = height - (height/3);
  int positionXModal = width/2 - (anchoModal/2);
  int positionYModal = height/2 - (altoModal/2);
  color backgroundColorModal = color(102, 102, 102, 191);
  color colorTextModal = color(0);
  color strokeColorModal = color(102, 102, 102, 191);
  String tituloModal = "# Título";
  String titulo = "# Título";
  String textoModal = "Texto";

  // declara botón
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
    titulo = tituloModal;
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
    text(titulo, positionXModal + espaciado, positionYModal);
    // texto dialog
    textSize(textoSize);
    text(textoModal, positionXModal + espaciado, positionYModal + tituloSize + espaciado);
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