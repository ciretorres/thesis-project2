/**
 * The HeadsUpDisplay is about the part of the software 
 * which interacts directly with the users interface. 
 * It controls the dialog between the backend and frontend.
 */
int espaciado = 24;
int borderRadius = 20;
int opcionDialogAbierto = 0;

class HeadsUpDisplay {
  // dialogo de Bienvenida
  Dialog dialogBienvenido = new Dialog();  
  // dialogo de Instrucciones
  Dialog dialogInstrucciones = new Dialog();

  HeadsUpDisplay() {
    // Constructor        
    // construye dialogo de Bienvenida
    // TODO: intentar hacer función
    dialogBienvenido.id = "dialog_bienvenido";
    dialogBienvenido.textoDialog = "Bievenida";
    dialogBienvenido.conBtnCerrar = false;
    dialogBienvenido.conBtnUno = true;
    dialogBienvenido.conBtnDos = true;
    dialogBienvenido.colorPrincipal = false;
    dialogBienvenido.idBtnDos = "btn_instrucciones";
    dialogBienvenido.textoBtnDos = "Instrucciones";
    
    // construye dialogo de Instrucciones
    // TODO: intentar hacer función
    dialogInstrucciones.id = "dialog_instrucciones";
    dialogInstrucciones.textoDialog = "Instrucciones";
    dialogInstrucciones.conBtnCerrar = true;
    dialogInstrucciones.conBtnUno = false;
    dialogInstrucciones.conBtnDos = true;
    dialogInstrucciones.colorPrincipal = false;
    dialogInstrucciones.idBtnDos = "btn_listo";
    dialogInstrucciones.textoBtnDos = "Listo";
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar.
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


