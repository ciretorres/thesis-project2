/**
 * Over is looking or watching if the mouse is making over through a shape.
 */
class Over {
  Over() {
    // Constructor
  }

  /**
   * Método que regresa true o false si el cursor está encima del rect.
   */
  boolean rect(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height) {
      return true;
    } else {
      return false;
    }
  }
  /**
   * Método que regresa true o false si el cursor está encima del circle.
   */
  boolean circle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } else {
      return false;
    }
  }
}
