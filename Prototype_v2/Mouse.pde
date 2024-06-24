/**
 * Mouse controls the pressed functionality and methods
 */
int abrirDialogAbierto = 0;

class Mouse {
  boolean rectClick = false;  
  boolean circleClick = false;

  Mouse() {
    // Constructor
  }

  /**
   * Observa si el mouse fue presionado con el botón izquierdo
   */
  void pressed(String id, boolean circleOver, boolean rectOver) {
    if (mousePressed == true && mouseButton == LEFT) {
      if (circleOver) {
        circleClick = true;
        rectClick = false;

        switch(id) {
        case "btn_cerrar":
          abrirDialogAbierto = 3;
          break;
        default: //
        }
      }

      if (rectOver) {
        rectClick = true;
        circleClick = false;

        switch(id) {
        case "btn_instrucciones":
          abrirDialogAbierto = 1;
          break;
        case "btn_listo":
          abrirDialogAbierto = 4;
          break;
        case "btn_comenzar":
          abrirDialogAbierto = 2;
          break;
        default: //
        }
      }
      
    } else {
      rectClick = circleClick = false;
    }
  }
}