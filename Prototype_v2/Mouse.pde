/**
 * @class Mouse Control de botones para realizar funciones o asignaciones.
 *
 * property {boolean} rectClick Indica si el rectángulo fue pulsado
 * property {boolean} circleClick Indica si el círculo fue pulsado
 *
 * @property {function} pressed Observa si el mouse fue presionado con click izquierdo.
 * @param String id Indica el id del objeto presionado
 * @param boolean circleOver Indica si el círculo está enfocado
 * @param boolean rectOver Indica si el rectángulo está enfocado
 */
int abrirDialogAbierto = 0;

class Mouse {
  boolean rectClick = false;  
  boolean circleClick = false;
  Mouse() {
    // Constructor
  }
  /** @function pressed Observa si el mouse fue presionado con click izquierdo */
  void pressed(String id, boolean circleOver, boolean rectOver) {
    // Botón Izquierdo
    if (mousePressed == true && mouseButton == LEFT) {
      // Circulos
      if (circleOver) {
        circleClick = true;
        rectClick = false;

        switch(id) {
        case "idBtnCerrar":
          abrirDialogAbierto = 3;
          break;
        default: //
        }
      }
      // Rectángulos
      if (rectOver) {
        rectClick = true;
        circleClick = false;

        switch(id) {
        case "idBtnInstrucciones":
          abrirDialogAbierto = 1;
          // abrirIntrucciones = true;
          break;
        case "idBtnListo":
          abrirDialogAbierto = 4;
          // abrirDialogoListo = true;
          break;
        case "idBtnComenzar":
          abrirDialogAbierto = 2;
          // abrirDiaglogoComenzar = true;
          break;
        default: //
        }
      }
      
    } else {
      rectClick = circleClick = false;
    }
  }
}