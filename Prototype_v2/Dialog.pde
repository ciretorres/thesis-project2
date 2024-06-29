/**
 * The Dialog show a rectangle that presents relevant
 * information about the system.
 */

class Dialog {
  boolean fullScreen = width > 1366;
  // propiedades Dialogo
  String id;
  String tituloDialog, textoDialog;
  color dialogTextColor;

  color dialogBackgroundColor = color(102, 102, 102, 191);
  int dialogAncho = width - (width/2);
  int dialogAlto = height - (height/3);
  int dialogPosicionX = width/2 - (dialogAncho/2);
  int dialogPosicionY = height/2 - (dialogAlto/2);

  // propiedades botones
  boolean conBtnCerrar, conBtnUno, conBtnDos, conColorPrincipal;

  String idBtnDos;
  String textoBtnUno;
  String textoBtnDos;


  // propiedades botón rectángulo
  int buttonAncho = dialogAncho - (espaciado * 2);
  int buttonAlto = 72;
  int rectX = width/2 - (buttonAncho/2);
  int rectY = height/2 + (dialogAlto/2) - (buttonAlto);

  
  // inicializa botón
  // Button btnInstrucciones  = new Button();
  Button btnInstrucciones;
  Button btnCerrar = new Button();
  Button btnComenzar;
  // Button btnComenzar = new Button();

  
  color colorButtonFondo;
  int tamanioFuente, bordeBoton;

  Dialog() {
    // Constructor
    if (fullScreen) redimensiona();

    // propiedades botón cerrar  
    btnCerrar.id = "btn_cerrar";
    btnCerrar.forma = "circle";
    btnCerrar.circleSize = 88;
    btnCerrar.circleColor = color(255);
    btnCerrar.circleHighlight = color(204);
    btnCerrar.circleX = dialogPosicionX + dialogAncho - (btnCerrar.circleSize/2) - espaciado;
    btnCerrar.circleY = dialogPosicionY + (btnCerrar.circleSize/2) + espaciado;

    // propiedades botón comenzar
    // btnComenzar.id = "btn_comenzar";
    // btnComenzar.forma = "rect";
    // btnComenzar.rectAncho = dialogAncho - (espaciado * 2);
    // btnComenzar.rectAlto = 72;
    // btnComenzar.rectX = width/2 - (buttonAncho/2);
    // btnComenzar.rectY = height/2 + (dialogAlto/2) - (buttonAlto) - espaciado;
    // btnComenzar.rectColor = color(0);
    // btnComenzar.rectHighlight = color(51);
    // btnComenzar.rectText = "Comenzar";
    // btnComenzar.rectTextSize = 56;
    // btnComenzar.rectTextX = width/2;
    // btnComenzar.rectTextY = btnComenzar.rectY + (btnComenzar.rectAlto/2) - (btnComenzar.rectTextSize/5);

    // if (conColorPrincipal) {
    //   colorButtonFondo = color(0);
    //   tamanioFuente = 56;
    // } else {
    //   colorButtonFondo = color(255, 255, 255, 0);
    //   tamanioFuente = 24;
    // }
    // // propiedades botón comenzar
    // btnInstrucciones.id = idBtnDos;
    // btnInstrucciones.forma = "rect";
    // btnInstrucciones.rectAncho = dialogAncho - (espaciado * 2);
    // btnInstrucciones.rectAlto = 72;
    // btnInstrucciones.rectX = width/2 - (buttonAncho/2);
    // btnInstrucciones.rectY = height/2 + (dialogAlto/2) - (buttonAlto) - espaciado;
    // btnInstrucciones.rectColor = colorButtonFondo;
    // btnInstrucciones.rectHighlight = color(51);
    // btnInstrucciones.rectText = textoBtnDos;
    // btnInstrucciones.rectTextSize = tamanioFuente;
    // btnInstrucciones.rectTextX = width/2;
    // btnInstrucciones.rectTextY = btnInstrucciones.rectY + (btnInstrucciones.rectAlto/2) - (btnInstrucciones.rectTextSize/5);
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void show() {
    // Dibuja rect dialogo
    fill(dialogBackgroundColor);
    rect(dialogPosicionX, dialogPosicionY, dialogAncho, dialogAlto, borderRadius);

    // Botones
    // TODO: revisar si se puede unir con lo de abajo o hacerlo función
    if (conBtnCerrar) btnCerrar.render();

    if (conBtnUno) {
      btnComenzar = new Button(
        "btn_comenzar",
        buttonAncho,
        buttonAlto,
        rectX,
        rectY - buttonAlto-espaciado,
        color(0),
        "Comenzar", 56, 1
        );
      btnComenzar.render();
    }
    if (conBtnDos) {
      // color colorButtonFondo;
      // int tamanioFuente;

      if (conColorPrincipal) {
        colorButtonFondo = color(0);
        tamanioFuente = 56;
        bordeBoton = 1;
      } else {
        colorButtonFondo = color(255, 255, 255, 0);
        tamanioFuente = 24;
        bordeBoton = 0;
      }

      btnInstrucciones = new Button(
        idBtnDos,
        buttonAncho,
        buttonAlto,
        rectX,
        rectY,
        colorButtonFondo,
        textoBtnDos, tamanioFuente, bordeBoton
        );
      btnInstrucciones.render();
    }

    // titulo dialog
    textSize(tituloSize);
    textAlign(LEFT, TOP);
    fill(dialogTextColor);
    text(tituloDialog, dialogPosicionX + espaciado, dialogPosicionY);
    // texto dialog
    textSize(textoSize);
    text(textoDialog, dialogPosicionX + espaciado, dialogPosicionY + tituloSize + espaciado);
  }

  /**
   * Método para redimensionar y reposicionar todo, si el ancho de la pantalla está fullscreen
   */
  void redimensiona() {
    println("la pantalla es más ancha que 1366px");
    // dialog
    dialogAncho = 683;
    dialogAlto = 512;
    dialogPosicionX = width/2 - (dialogAncho/2);
    dialogPosicionY = height/2 - (dialogAlto/2);
    // boton rect
    buttonAncho = dialogAncho - (espaciado * 2);
    rectX = width/2 - (buttonAncho/2);
    rectY = height/2 + (dialogAlto/2) - (buttonAlto);
    // boton circle
    // circleX = dialogPosicionX + dialogAncho - (circleSize/2) - espaciado;
    // circleY = dialogPosicionY + (circleSize/2) + espaciado;
    btnCerrar.circleX = dialogPosicionX + dialogAncho - (btnCerrar.circleSize/2) - espaciado;
    btnCerrar.circleY = dialogPosicionY + (btnCerrar.circleSize/2) + espaciado;
  }
}
