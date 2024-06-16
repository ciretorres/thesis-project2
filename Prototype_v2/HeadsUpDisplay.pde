/**
 * The HeadsUpDisplay is about the part of the software which interacts directly
 * with the users interface. It controls the dialog between the backend and frontend.
 */
int espaciado = 24;
int borderRadius = 20;
int opcionDialogAbierto = 0;

class HeadsUpDisplay {
  // dialogo 1
  Dialog dialogBienvenido = new Dialog(
    "dialog_bienvenido",  // id
    "Bievenida",          // textoDialog
    false,                // conBtnCerrar
    true,                 // conBtnUno
    true,                 // conBtnDos
    false,                // colorPrincipal
    "btn_instrucciones",  // idBtnDos
    "Instrucciones"       // textoBtnDos
  );
  
  // dialogo 2
  Dialog dialogInstrucciones = new Dialog(
    "dialog_instrucciones",  // id
    "Instrucciones",         // textoDialog
    true,                    // conBtnCerrar
    false,                   // conBtnUno
    true,                    // conBtnDos
    true,                    // colorPrincipal
    "btn_listo",             // idBtnDos
    "Listo"                  // textoBtnDos
  );

  HeadsUpDisplay() {
    // Constructor
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void display() {
    update();
    // Utility methods to permit the use of a Heads-Up Display
    // Begin and end screen-aligned 2D-drawing.
    // https://mrfeinberg.com/peasycam/reference/index.html
    camera.beginHUD();
    //
    // abrir dialog
    switch(opcionDialogAbierto) {
    case 0:
      dialogBienvenido.show();
      break;
    case 1:
      dialogInstrucciones.show();
      break;
    default:
      // println("cerrados");
    }


    camera.endHUD();
  }

  /**
   * Método update
   */
  void update() {
  }
}


