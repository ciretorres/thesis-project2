class Dialog {
  Button button = new Button();

  int rectX, rectY;      // Position of square button
  int circleX, circleY;  // Position of circle button
  int textX, textY;  // Position of circle button
  int dialogX, dialogY;  // Position of circle button
  int dialogWidth = width - (width/2); // Width of dialog
  int dialogHeight = height - (height/3); // Height of dialog
  int rectWidth = dialogWidth -48;     // Diameter of rect
  int rectHeight = 88;     // Diameter of rect
  int circleSize = 88;   // Diameter of circle
  color rectColor, circleColor, baseColor;
  color rectHighlight, circleHighlight;
  color currentColor;
  boolean rectOver = false;
  boolean circleOver = false;

  Dialog() {
    // Constructor
    rectColor = color(0);
    rectHighlight = color(51);
    circleColor = color(255);
    circleHighlight = color(204);
    baseColor = color(102, 102, 102, 191);
    currentColor = baseColor;
    dialogX = width/2-dialogWidth/2;
    dialogY = height/2-dialogHeight/2;

    circleX = dialogX + dialogWidth - (circleSize/2) - 24;
    circleY = dialogY + (circleSize/2) + 24;

    rectX = width/2-dialogWidth/2+24;
    rectY = dialogY + dialogHeight - rectHeight - 24;

    textX = dialogX + 24;
    textY = height/2-dialogHeight/2+88+24;
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void show() {
    //println("hola desde Button");
    update(mouseX, mouseY);

    // TODO: dialogo uno
    fill(currentColor);
    rect(dialogX, dialogY, dialogWidth, dialogHeight);

    textSize(88);
    fill(0, 408, 612, 816);
    text("Titulo", textX, textY);

    textSize(40);
    text("Texto", textX, textY+40+24);


    if (rectOver) {
      fill(rectHighlight);
      strokeWeight(1);
    } else {
      fill(rectColor);
      strokeWeight(0);
    }
    stroke(255);
    rect(rectX, rectY, rectWidth, rectHeight);

    if (circleOver) {
      fill(rectHighlight);
      strokeWeight(1);
    } else {
      fill(rectColor);
      strokeWeight(0);
    }
    stroke(255);
    ellipse(circleX, circleY, circleSize, circleSize);
  }

  /**
   * Método update
   */
  void update(int x, int y) {
    if ( overCircle(circleX, circleY, circleSize) ) {
      circleOver = true;
      rectOver = false;
    } else if ( overRect(rectX, rectY, rectWidth, rectHeight) ) {
      rectOver = true;
      circleOver = false;
    } else {
      circleOver = rectOver = false;
    }

    mousePressed();
  }

  void mousePressed() {
    if (mousePressed == true && mouseButton == LEFT) {
      if (circleOver) {
        currentColor = circleColor;
      }
      if (rectOver) {
        //currentColor = rectColor;
        println("presioné botón");
      }
    }
  }

  boolean overRect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }

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
