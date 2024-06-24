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

  // inicializa botón
  Button btnInstrucciones;
  Button btnComenzar;
  Button btnCerrar;


  // propiedades botón rectángulo
  int buttonAncho = dialogAncho - (espaciado * 2);
  int buttonAlto = 72;
  int rectX = width/2 - (buttonAncho/2);
  int rectY = height/2 + (dialogAlto/2) - (buttonAlto);

  // propiedades botón circulo
  int circleSize = 88;
  int circleX = dialogPosicionX + dialogAncho - (circleSize/2) - espaciado;
  int circleY = dialogPosicionY + (circleSize/2) + espaciado;

  Dialog() {
    // Constructor
    if (fullScreen) redimensiona();

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
    if (conBtnCerrar) {
      btnCerrar = new Button("btn_cerrar", circleSize, circleX, circleY);
      btnCerrar.render();
    }
    if (conBtnUno) {
      btnComenzar = new Button(
        "btn_comenzar",
        buttonAncho,
        buttonAlto,
        rectX,
        rectY - buttonAlto-espaciado,
        color(0),
        "Comenzar", 56
        );
      btnComenzar.render();
    }
    if (conBtnDos) {
      color colorButtonFondo;
      int tamanioFuente;

      if (conColorPrincipal) {
        colorButtonFondo = color(0);
        tamanioFuente = 56;
      } else {
        colorButtonFondo = color(255, 255, 255, 0);
        tamanioFuente = 24;
      }

      btnInstrucciones = new Button(
        idBtnDos,
        buttonAncho,
        buttonAlto,
        rectX,
        rectY,
        colorButtonFondo,
        textoBtnDos, tamanioFuente
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
    circleX = dialogPosicionX + dialogAncho - (circleSize/2) - espaciado;
    circleY = dialogPosicionY + (circleSize/2) + espaciado;
  }
}
