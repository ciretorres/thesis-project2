class Button {
  int espaciado = 24;

  int rectX, rectY;      // Position of square button
  int circleX, circleY;  // Position of circle button
  int textX, textY;      // Position of square button
  String rectText;
  int textSize;
  int rectWidth, rectHeight, circleSize; // Diameter of circle
  color rectColor, circleColor;
  color rectHighlight, circleHighlight;

  color currentColor;

  boolean rectOver = false;
  boolean circleOver = false;

  boolean rectClick = false;
  boolean circleClick = false;

  String forma = "circle";

  Button() {
    // Constructor
  }

  Button(int ancho, int alto, int xPosicion, int yPosicion, color rectaColor, String texto, int tamanoTexto) {
    // Constructor
    forma = "rect";
    rectWidth = ancho;
    rectHeight = alto;
    rectX = xPosicion;
    rectY = yPosicion - espaciado;
    rectColor = rectaColor;
    rectHighlight = color(51);
    textX = width/2;
    rectText = texto;
    textSize = tamanoTexto;
    textY = rectY + (rectHeight/2) - (textSize/5);
  }

  Button(int radio, int xPosicion, int yPosicion) {
    // Constructor
    forma = "circle";
    circleSize = radio;
    circleColor = color(255);
    circleHighlight = color(204);
    circleX = xPosicion;
    circleY = yPosicion;

    // set ellipse location draw reference
    ellipseMode(CENTER);
  }

  void render() {
    update(mouseX, mouseY);

    switch(forma) {
    case "rect":
      if (rectOver) {
        fill(rectHighlight);
      } else {
        fill(rectColor);
      }
      stroke(255);
      rect(rectX, rectY, rectWidth, rectHeight);
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
    } else if ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
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
        println("presioné circle");
        circleClick = true;
        rectClick = false;
      }
      if (rectOver) {
        println("presioné rect");
        rectClick = true;
        circleClick = false;
      }
    } else {
      rectClick = circleClick = false;
    }
  }

  /** */
  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  /** */
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
