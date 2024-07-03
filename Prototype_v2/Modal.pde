/**
 * The Modal show a rectangle that presents relevant
 * information about the system.
 */

class Modal {
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


  // declara botón
  Button btnInstrucciones;
  Button btnCerrar = new Button();
  Button btnComenzar;

  color colorButtonFondo;
  int tamanioFuente, bordeBoton;

  Modal() {
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
