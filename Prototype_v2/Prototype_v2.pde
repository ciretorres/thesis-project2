import peasy.*;
/**
 * Prototype_v2
 *
 * Interfaz-interactiva para la visualización de un fenómeno
 * astronómico. En este caso el módulo distancia que relaciona
 * la distancia con el brillo de una estrella.
 */

// importando Peasycam
PeasyCam camera;
// distancia de la cámara desde el centro en pixeles
int distanciaCamera = 80;
// importando HeadsUpDisplay
HeadsUpDisplay HUD;

// Colores
color  baseColor = color(0);
color currentColor = baseColor;

/**
 * Método para configurar el entorno
 */
void setup() {
  // tamaño de la pantalla
  //size(1366, 768, P3D);
  size(1024, 640, P3D);
  //fullScreen(P3D);
  // orientación de la pantalla
  orientation(LANDSCAPE);

  frameRate(60);
  smooth();

  // TODO: Cargar tipografía
  // TODO: Cargar iconos
  // TODO: Cargar estrellas

  // iniciando cámara
  camera = new PeasyCam(this, distanciaCamera);
  // iniciando interfaz gráfica
  HUD = new HeadsUpDisplay();
  // set ellipse location draw reference
  ellipseMode(CENTER);
}
/**
 * Método para dibujar mientras se ejecuta el entorno
 */
void draw() {
  // Color de fondo
  background(currentColor);
  // Luz del ambiente predeterminada
  lights();

  // Pushes and Pop the current transformation matrix onto the matrix stack.
  // https://processing.org/reference/pushMatrix_.html
  // https://processing.org/reference/popMatrix_.html
  pushMatrix();
  //
  HUD.display();


  popMatrix();
}
