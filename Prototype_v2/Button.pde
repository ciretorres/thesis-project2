/**
 * @class Button permite dibujar botones en forma de círculo y rectángulo como referencia.
 * @property {String} id (default: "idButton") Indica el identificador del botón
 */

class Button {
  Over over = new Over();
  Mouse mouse = new Mouse();

  // propiedades iniciales del botón
  String forma = "rect";
  String id = "btnId";
  
  int rectX;
  int rectY;
  int rectAlto = 72;
  int rectAncho;
  
  color fondoColor = color(0);
  color fondoColorResaltado = color(fondoColor, 71);
  color bordeColor = color(255);  
  int bordeAncho = 1;
  boolean conBorde = true;
  boolean btnConBorde = conBorde;

  String texto = "Botón";
  int textoTamanio = 56;
  color colorTexto = color(0, 408, 612, 816);
  int textoX = width/2;
  int textoY = rectY + (rectAlto/2) - (textoTamanio/5);

  int posicionXButton;
  int posicionYButton;
  int altoButton;
  int anchoButton;
  int radioBordeButton = 0;

  int tamanioTextoButton = 56;
  int posicionTextoXButton;
  int posicionTextoYButton;

  boolean rectOver = false;

  //

  int circleSize;
  color circleColor;
  color circleHighlight = color(circleColor, 51);
  int circleX;
  int circleY;
  boolean circleOver = false;
  
  Button() {
    // Constructor
  }

  Button(int rectAncho, int rectX, int rectY) {
    // Constructor rectangle
    this.rectAncho = rectAncho;
    this.rectX = rectX;
    this.rectY = rectY - espaciado;
    textoY = rectY;
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void render() {
    // actualiza posición del cursor
    update(mouseX, mouseY);
    
    String btnId = id;
    String btnForma = forma;    
    color btnFondoColor = fondoColor;
    color btnFondoColorResaltado = fondoColorResaltado;
    color btnBordeColor = bordeColor;
    int btnBordeAncho = bordeAncho;
    String btnRectText = texto;
    int btnRectTextoTamanio = textoTamanio;
    int btnRectTextoX = textoX;
    int btnRectTextY = textoY;  

    // Dibuja botones
    switch(btnForma) {
    case "rect":
      // si hay over cambia el color del fondo con o si borde
      if (rectOver) {
        fill(btnFondoColorResaltado);
        if(btnFondoColor == color(0)) {
          strokeWeight(0);
        } else {
          strokeWeight(btnBordeAncho);
        }
      } else {
        fill(btnFondoColor);
        if(btnFondoColor == color(0)) {
          strokeWeight(0);
        } else {
          strokeWeight(btnBordeAncho);
        }
      }
      // dibuja la figura
      stroke(btnBordeColor);
      rect(rectX, rectY, rectAncho, rectAlto);
      // dibuja el texto
      textSize(btnRectTextoTamanio);
      textAlign(CENTER, CENTER);
      fill(colorTexto);
      text(btnRectText, btnRectTextoX, btnRectTextY);
      break;

    case "circle":
      // set ellipse location draw reference
      ellipseMode(CENTER);

      if (circleOver) {
        fill(circleHighlight);
      } else {
        fill(circleColor);
      }
      // figura
      stroke(0);
      ellipse(circleX, circleY, circleSize, circleSize);
      break;
    }
  }

  /**
   * Método update
   */
  void update(int x, int y) {
    // opera si se hace hover en el circulo o el rec y avisa
    if ( over.circle(circleX, circleY, circleSize) ) {
      circleOver = true;
      rectOver = false;
    } else if ( over.rect(rectX, rectY, rectAncho, rectAlto) ) {
      rectOver = true;
      circleOver = false;
    } else {
      circleOver = rectOver = false;
    }
    // opera si presiona el mouse y debe avisar
    mouse.pressed(id, circleOver, rectOver);
  }
}
