/**
 * @class Over Conjunto de métodos para buscar y observar si el ratón está 
 * encima de alguna figura en forma de rectángulo o círculo.
 *
 * @property {function} rect Método que regresa true o false si el cursor 
 * está encima del rectángulo.
 * @param int x Indica la posición horizontal del rect.
 * @param int y Indica la posición vertical del rect.
 * @param int width Indica el ancho del rect.
 * @param int height Indica el alto del rect.
 * @return {boolean}
 *
 * @property {funtion} circle Método que regresa true o false si el cursor 
 * está encima del círculo.
 * @params int x Indica la posición horizontal del circle.
 * @params int y Indica la posición vertical del circle.
 * @params int diameter Indica el diámetro del circle.
 * @return {boolean}
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
