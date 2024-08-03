/**
 * @class Button Permite dibujar botones en forma de círculo y rectángulo.
 *
 * @property {String} id (default: "btnId") Indica el identificador.
 * @property {String} forma (default: "rect") Indica la forma.
 * @property {int} ancho Indica el ancho.
 * @property {int} alto (default: 72) Indica el alto.
 * @property {int} x Indica la posición horizontal.
 * @property {int} y Indica la posición vertical.
 * @property {color} fondoColor (default: color(0)) Indica el color de fondo.
 * @property {color} fondoColorResaltado (default: color(fondoColor, 71)) 
 * Indica el color para el fondo resaltado.
 * @property {color} bordeColor (default: color(255)) Indica el color
 * para el borde.
 * @property {int} bordeAncho (default: 1) Indica el ancho del borde.
 * @property {boolean} btnConBorde (default: true) Indica si tiene borde.
 * @property {String} texto (default: "Botón") Indica el texto del botón.
 * @property {int} textoTamanio (default: 56) Indica el tamaño del texto.
 * @property {color} colorTexto (default: color(0, 408, 612, 816)) Indica 
 * el color del texto.
 * @property {int} textoTamanio (default: 56) Indica la posición del texto 
 * en horizontal.
 * @property {boolean} rectOver (default: false) Indica si está enfocado 
 * el botón rect.
 *
 * @property {int} btnCirculoTamanio Indica el tamaño del botón círculo.
 * @property {int} btnCirculoX Indica la posición horizontal del botón círculo.
 * @property {color} btnCirculoFondoColor Indica el color de fondo del círculo.
 * @property {color} fondoColorResaltado (default: color(fondoColor, 71)) 
 * Indica el color de fondo resaltado del botón
 * @property {boolean} CircleOver (default: false) Indica si está enfocado 
 * el botón circle.
 *
 * @property {Object} over Indica el objeto con las funciones para observar 
 * el enfoque de la usuaria.
 * @property {Object} mouse Indica el objeto con las funciones para var el 
 * click de la usuaria.
 *
 * @property {function} render Renderea todo lo que se va a dibujar.
 * @property {function} update Observa si se enfoca un botón y si lo presiona.
 */

class Button {
  // propiedades iniciales del botón
  String forma = "rect";
  String id = "btnId";
  int ancho;
  int alto = 72;  
  int x;
  int y;  
  color fondoColor = color(0);
  color fondoColorResaltado = color(fondoColor, 71);
  color bordeColor = color(255);  
  int bordeAncho = 1;
  boolean conBorde = true;
  String texto = "Botón";
  int textoTamanio = 56;
  color colorTexto = color(0, 408, 612, 816);
  int textoX = width/2;
  boolean rectOver = false;

  // btnCirculo
  int btnCirculoTamanio;
  int btnCirculoX;
  int btnCirculoY;
  color btnCirculoFondoColor;
  color btnCirculoFondoColorResaltado = color(btnCirculoFondoColor, 51);
  boolean circleOver = false;
  
  // inicia opciones para Over y Mouse
  Over over = new Over();
  Mouse mouse = new Mouse();

  Button() {
    // Constructor
  }

  /** 
   * Método donde se renderea todo lo que se va a dibujar.
   */
  void render() {
    // actualiza posición del cursor
    update();
    
    String btnId = id;
    String btnForma = forma;    
    color btnFondoColor = fondoColor;
    color btnFondoColorResaltado = fondoColorResaltado;
    color btnBordeColor = bordeColor;
    int btnBordeAncho = bordeAncho;
    String btnRectText = texto;
    int btnRectTextoTamanio = textoTamanio;
    int btnRectTextoX = textoX;
    int btnRectTextY = y + (alto/2) - (btnRectTextoTamanio/5);

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
      rect(x, y, ancho, alto);
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
        fill(btnCirculoFondoColorResaltado);
      } else {
        fill(btnCirculoFondoColor);
      }
      // dibuja la figura
      stroke(0);
      ellipse(btnCirculoX, btnCirculoY, btnCirculoTamanio, 
      btnCirculoTamanio);
      break;
    }
  }

  /** 
   * Método para observar si se enfoca un botón y si lo presiona.
   */
  void update() {
    // opera si se hace hover en el circulo o el rec y avisa
    if ( over.circle(btnCirculoX, btnCirculoY, btnCirculoTamanio) ) {
      circleOver = true;
      rectOver = false;
    } else if ( over.rect(x, y, ancho, alto) ) {
      rectOver = true;
      circleOver = false;
    } else {
      circleOver = rectOver = false;
    }
    // opera si presiona el mouse y debe avisar
    mouse.pressed(id, circleOver, rectOver);
  }
}
