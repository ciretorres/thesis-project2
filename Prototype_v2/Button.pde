/**
 * Button allows to draw an interactable rect or circle.
 */

class Button {
  Over over = new Over();
  Mouse mouse = new Mouse();

  String id;
  String forma;

  int rectAncho;
  int rectAlto;
  int rectX;
  int rectY;
  color rectColor;
  color rectHighlight;
  String rectText;
  int rectTextSize;
  int rectTextX;
  int rectTextY;
  boolean rectOver = false;

  int circleSize;
  color circleColor;
  color circleHighlight;
  int circleX;
  int circleY;
  boolean circleOver = false;

  int borde;

  Button() {
    // Constructor
  }

  Button(String id, int rectAncho, int rectAlto, int rectX,
    int rectY, color rectColor, String rectText, int rectTextSize, int borde) {
    // Constructor rectangle
    this.id = id;
    this.forma = "rect";
    this.rectAncho = rectAncho;
    this.rectAlto = rectAlto;
    this.rectX = rectX;
    this.rectY = rectY - espaciado;

    this.rectColor = rectColor;
    this.rectHighlight = color(51);

    this.rectTextX = width/2;
    this.rectText = rectText;
    this.rectTextSize = rectTextSize;
    this.rectTextY = this.rectY + (this.rectAlto/2) - (this.rectTextSize/5);

    this.borde = borde;
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
      if (rectOver) {
        fill(rectHighlight);
      } else {
        fill(rectColor);
      }
      // figura
      stroke(255);
      strokeWeight(borde);
      rect(rectX, rectY, rectAncho, rectAlto);
      // texto
      textSize(rectTextSize);
      textAlign(CENTER, CENTER);
      fill(0, 408, 612, 816);
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
