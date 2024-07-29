/**
 * @class Button permite dibujar botones en forma de círculo y rectángulo como referencia.
 * @property {String} id (default: "idButton") Indica el identificador del botón
 */

class Button {
  Over over = new Over();
  Mouse mouse = new Mouse();

  // propiedades iniciales del botón
  String id = "idButton";
  String forma = "rect";

  color rectColor = color(0);
  color rectHighlight = color(rectColor, 51);
  boolean conColorFondoPrincipal = true;

  color colorBorde = color(255);
  int anchoBorde = 1;
  boolean conBorde = true;

  int rectX;
  int rectY;
  int rectAlto = 72;
  int rectAncho;

  int rectTextSize = 56;
  color colorTexto = color(0, 408, 612, 816);
  String rectText = "Botón";
  int rectTextX = width/2;
  int rectTextY = rectY + (rectAlto/2) - (rectTextSize/5);

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
    rectTextY = rectY;
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void render() {
    // actualiza posición del cursor
    update(mouseX, mouseY);

    // Dibuja botones
    switch(forma) {
    case "rect":
      // si hay over cambia de color el fondo
      if (rectOver) {
        fill(rectHighlight);
        strokeWeight(anchoBorde);
      } else {
        fill(rectColor);
        if(!conColorFondoPrincipal) {
          strokeWeight(0);
        } else {
          strokeWeight(anchoBorde);
        }
      }
      // dibuja la figura
      stroke(colorBorde);

      rect(rectX, rectY, rectAncho, rectAlto);
      // dibuja el texto
      textSize(rectTextSize);
      textAlign(CENTER, CENTER);
      fill(colorTexto);
      text(rectText, rectTextX, rectTextY);
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
