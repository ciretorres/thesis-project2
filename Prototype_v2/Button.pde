/**
 * Button allows to draw interactable rect or circle.
 */
class Button {
  String id;
  String forma;

  int rectAncho, rectAlto;
  int rectX, rectY;
  boolean rectOver = false;
  boolean rectClick = false;

  int textSize;
  String rectText;
  int textX, textY;

  color rectColor, circleColor;
  color rectHighlight, circleHighlight;

  int circleSize;
  int circleX, circleY;
  boolean circleOver = false;
  boolean circleClick = false;

  Button() {
    // Constructor
  }

  Button(String id, int rectAncho, int rectAlto, int rectX,
    int rectY, color rectColor, String rectText, int textSize) {
    // Constructor
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
    // Constructor
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

  void render() {
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
    if ( overCircle(circleX, circleY, circleSize) ) {
      circleOver = true;
      rectOver = false;
    } else if ( overRect(rectX, rectY, rectAncho, rectAlto) ) {
      rectOver = true;
      circleOver = false;
    } else {
      circleOver = rectOver = false;
    }
    // opera si presiona el mouse y debe avisar
    mousePressed();
  }
  /** */
  void mousePressed() {
    if (mousePressed == true && mouseButton == LEFT) {
      if (circleOver) {
        //println("presioné circle");
        circleClick = true;
        rectClick = false;

        switch(id) {
        case "btn_cerrar":
          opcionDialogAbierto = 3;
          break;
        default: //
        }
      }
      if (rectOver) {
        //println("presioné rect");
        rectClick = true;
        circleClick = false;

        switch(id) {
        case "btn_instrucciones":
          println("aca");
          opcionDialogAbierto = 1;
          break;
        case "btn_listo":
          println("alla");
          // opcionDialogAbierto = 4;
          break;
        case "btn_comenzar":
          opcionDialogAbierto = 2;
          break;
        default: //
        }
      }
    } else {
      rectClick = circleClick = false;
    }
  }


  /**
   * Método que regresa true o false si esta el cursor
   * encima del rect.
   */
  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  /**
   * Método que regresa true o false si esta el cursor
   * encima del circle.
   */
  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}
