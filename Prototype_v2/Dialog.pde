/**
 * The Dialog show a rect that presents relevant
 * information about the system.
 */

class Dialog {
  String id, idBtnDos;
  String textoDialog, textoBtnUno, textoBtnDos;
  boolean conBtnCerrar, conBtnUno, conBtnDos, colorPrincipal;
  
  // inicializa botón
  Button btnInstrucciones;
  Button btnComenzar;
  Button btnCerrar;

  // propiedades Dialogo
  int dialogAncho = width - (width/2);
  int dialogAlto = height - (height/3);
  int dialogX = width/2 - (dialogAncho/2);
  int dialogY = height/2 - (dialogAlto/2);
  
  color dialogBackgroundColor = color(102, 102, 102, 191);
  color dialogTextColor = color(0, 408, 612, 816);

  // propiedades botón rectángulo
  int buttonAncho = dialogAncho - (espaciado * 2);
  int buttonAlto = 72;
  int rectX = width/2 - (buttonAncho/2);
  int rectY = height/2 + (dialogAlto/2) - (buttonAlto);

  // propiedades botón circulo
  int circleSize = 88;
  int circleX = dialogX + dialogAncho - (circleSize/2) - espaciado;
  int circleY = dialogY + (circleSize/2) + espaciado;

  Dialog(String id, String textoDialog, boolean conBtnCerrar, 
    boolean conBtnUno, boolean conBtnDos, boolean colorPrincipal,
    String idBtnDos, String textoBtnDos) {    
    // Constructor
    this.id = id;
    this.textoDialog = textoDialog;
    this.conBtnCerrar = conBtnCerrar;
    this.conBtnUno = conBtnUno;
    this.conBtnDos = conBtnDos;
    this.colorPrincipal = colorPrincipal;
    this.idBtnDos = idBtnDos;
    this.textoBtnDos = textoBtnDos;

    if (conBtnCerrar) {
      btnCerrar = new Button("btn_cerrar", circleSize, circleX, circleY);
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
    }

    if (conBtnDos) {
      color colorButtonFondo;
      int tamanioFuente;
      if (colorPrincipal) {
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
    }
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void show() {
    // Dibuja rect dialogo
    fill(dialogBackgroundColor);
    rect(dialogX, dialogY, dialogAncho, dialogAlto, borderRadius);

    // Botones
    if (conBtnDos) btnInstrucciones.render();
    if (conBtnUno) btnComenzar.render();
    if (conBtnCerrar) btnCerrar.render();

    // texto dialog
    textSize(56);
    textAlign(LEFT, TOP);
    fill(dialogTextColor);
    text(textoDialog, dialogX + espaciado, dialogY);
  }

  void update() {
    
  }
}
