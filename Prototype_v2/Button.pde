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
  boolean rectOver = false;

  int textSize;
  String rectText;
  int textX;
  int textY;

  int circleSize;
  int circleX;
  int circleY;
  color circleColor;
  color circleHighlight;
  boolean circleOver = false;

  Button() {
    // Constructor
  }

  Button(String id, int rectAncho, int rectAlto, int rectX,
    int rectY, color rectColor, String rectText, int textSize) {
    // Constructor rectangle
    this.id = id;
    this.forma = "rect";
    this.rectAncho = rectAncho;
    this.rectAlto = rectAlto;
    this.rectX = rectX;
    this.rectY = rectY - espaciado;

    this.rectColor = rectColor;
    this.rectHighlight = color(51);

    this.textX = width/2;
    this.rectText = rectText;
    this.textSize = textSize;
    this.textY = this.rectY + (this.rectAlto/2) - (this.textSize/5);
  }

  Button(String id, int circleSize, int circleX, int circleY) {
    // Constructor circulo
    this.id = id;
    forma = "circle";
    this.circleSize = circleSize;
    this.circleColor = color(255);
    this.circleHighlight = color(204);
    this.circleX = circleX;
    this.circleY = circleY;

    // set ellipse location draw reference
    ellipseMode(CENTER);
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
      rect(rectX, rectY, rectAncho, rectAlto);
      // texto
      textSize(textSize);
      textAlign(CENTER, CENTER);
      fill(0, 408, 612, 816);
      text(rectText, textX, textY);
      break;
    case "circle":
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
