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

/**
 * Método para configurar el entorno
 */
void setup() {
  println("hola");
  
  // tamaño de la pantalla
  size(1366, 768, P3D);
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

}
/**
 * Método para dibujar mientras se ejecuta el entorno
 */
void draw() {
    // Color del fondo
    background(0);  

    lights();  

    pushMatrix();
    // 
    HUD.show(); 
    popMatrix();  
}
