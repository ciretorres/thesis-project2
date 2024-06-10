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
  println("hola");
  
  // tamaño de la pantalla
  //size(1366, 768, P3D);
  size(1024, 640, P3D);
  //fullScreen(P3D);
  // orientación
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
  ellipseMode(CENTER);
}
/**
 * Método para dibujar mientras se ejecuta el entorno
 */
void draw() {
    // Color de fondo
    background(currentColor);

    lights();  

    pushMatrix();
    // 
    HUD.display(); 
    popMatrix();  
}
