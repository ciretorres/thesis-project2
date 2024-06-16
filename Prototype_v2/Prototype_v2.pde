/**
 * Prototype_v2
 *
 * Interfaz-interactiva para la visualización de un fenómeno
 * astronómico. En este caso el módulo distancia que relaciona
 * la distancia con el brillo de una estrella.
 */
// importando peasy
import peasy.*;
PeasyCam camera; // declarando Peasycam
int distanciaCamera = 80; // distancia en pixeles desde el origen

HeadsUpDisplay HUD; // importando HeadsUpDisplay

Button btn;

// Estilos
color  baseColor = color(0);
//color currentColor = baseColor;
color backgroundColor = baseColor;

/**
 * Método para configurar el entorno
 */
void setup() {
  // tamaño de la pantalla
  //size(1366, 768, P3D);
  size(1024, 640, P3D);
  //fullScreen(P3D);

  orientation(LANDSCAPE); // orientación de la pantalla
  frameRate(60);
  smooth();

  // TODO: Cargar tipografía
  // TODO: Cargar iconos
  // TODO: Cargar estrellas

  // iniciando cámara
  camera = new PeasyCam(this, distanciaCamera);
  // iniciando interfaz gráfica
  HUD = new HeadsUpDisplay();
  btn = new Button();
}
/**
 * Método para dibujar mientras se ejecuta el entorno
 */
void draw() {
  // Color de fondo
  background(backgroundColor);
  // Luz del ambiente predeterminada
  lights();

  // PushPop the current transformation matrix onto the matrix stack.
  // https://processing.org/reference/pushMatrix_.html
  // https://processing.org/reference/popMatrix_.html
  pushMatrix();
  //
  HUD.display();


  popMatrix();
}

void mouseClicked() {
  println("click");
  println(opcionDialogAbierto);
  abrirDialogAbierto = opcionDialogAbierto;
}
