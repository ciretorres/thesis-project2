import peasy.*;
/**
 * Prototype_v2
 * Interfaz-interactiva para la visualización de un fenómeno
 * astronómico. En este caso el módulo distancia que relaciona
 * la distancia con el brillo de una estrella.
 * @since 07/2024
 *
 * @property {Object} camera Indica el objecto de la cámara Peasycam
 * @property {int} distanciaCamera Indica la distancia de la cámara en pixeles desde el origen (0,0,0)
 * @property {Object} HUD Indica el objecto del HeadsUpDisplay
 *
 * @property {color} baseColor (default: color(0)) Indica el color base
 * @property {color} backgroundColor (default: baseColor) Indica el color del fondo
 * @property {int} espaciado (default: 24) Indica el tamaño del espaciado
 * @property {int} borderRadius (default: 20) Indica el tamaño del radio del borde
 * @property {int} tituloTamanio (default: 24) Indica el tamaño del titulo
 * @property {int} textoTamanio (default: 24) Indica el tamaño del texto
 * @property {int} opcionDialogAbierto (default: 0) Indica la opción de diálogo seleccionada
 */
PeasyCam camera;
int distanciaCamera = 80;

HeadsUpDisplay HUD;

// Estilos generales
color baseColor = color(0);
// color currentColor = baseColor;
color backgroundColor = baseColor;
// variables globales de estilo
int espaciado = 24;
int borderRadius = 20;
int tituloTamanio = 56;
int textoTamanio = 24;
// variables globales
int opcionDialogAbierto = 0;

/** Método para configurar el entorno */
void setup() {
  // Tamaño de la pantalla
  // size(1366, 768, P3D);
  size(1024, 640, P3D);
  // fullScreen(P3D);

  orientation(LANDSCAPE); // orientación de la pantalla
  frameRate(60); // rango de cuadros por segundos
  smooth();

  // TODO: Cargar tipografía
  // TODO: Cargar iconos
  // TODO: Cargar estrellas

  // iniciando cámara
  camera = new PeasyCam(this, distanciaCamera);
  // iniciando interfaz gráfica
  HUD = new HeadsUpDisplay();
}
/** Método para dibujar mientras se ejecuta el entorno */
void draw() {
  // Color de fondo
  background(backgroundColor);
  lights(); // Luz del ambiente predeterminada

  /**
   * Push-Pop the current transformation matrix onto the matrix stack.
   * @see https://processing.org/reference/pushMatrix_.html
   * @see https://processing.org/reference/popMatrix_.html
   */
  pushMatrix();
  // TODO: muestrar las estrellas

  // muestra la HeadsUpDisplay
  HUD.display();


  popMatrix();
}
/** Método para enterarse cuando se dió click */
void mouseClicked() {
  println("click");
  println(opcionDialogAbierto);
  opcionDialogAbierto = abrirDialogAbierto;
}
