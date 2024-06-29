/**
 * The HeadsUpDisplay is about the part of the software 
 * which interacts directly with the users interface. 
 * It controls the dialog between the backend and frontend.
 */
int opcionDialogAbierto = 0;

int espaciado = 24;
int borderRadius = 20;
int tituloSize = 56;
int textoSize = 24;

class HeadsUpDisplay {
  // dialogo de Bienvenida
  Dialog dialogBienvenido = new Dialog();  
  // dialogo de Instrucciones
  Dialog dialogInstrucciones = new Dialog();

  HeadsUpDisplay() {
    // Constructor        
    // construye dialogo de Bienvenida
    construyeDialogBienvenido(); // TODO: intentar hacer función    
    
    // construye dialogo de Instrucciones
    construyeDialogIntrucciones(); // TODO: intentar hacer función
    
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
   * Método construyeDialogBienvenido
   */
  void construyeDialogBienvenido() {
    dialogBienvenido.id = "dialog_bienvenido";
    dialogBienvenido.tituloDialog = "Bievenida";
    dialogBienvenido.textoDialog = "texto";
    dialogBienvenido.dialogTextColor = color(0, 408, 612, 816);

    dialogBienvenido.conBtnCerrar = false;

    dialogBienvenido.conBtnUno = true;

    dialogBienvenido.conBtnDos = true;
    dialogBienvenido.conColorPrincipal = false;
    dialogBienvenido.idBtnDos = "btn_instrucciones";
    dialogBienvenido.textoBtnDos = "Instrucciones";
  }

  /**
   * Método construyeDialogIntrucciones
   */
  void construyeDialogIntrucciones() {
    dialogInstrucciones.id = "dialog_instrucciones";
    dialogInstrucciones.tituloDialog = "Instrucciones";
    dialogInstrucciones.textoDialog = "";
    dialogInstrucciones.dialogTextColor = color(0, 408, 612, 816);

    dialogInstrucciones.conBtnCerrar = true;

    dialogInstrucciones.conBtnUno = false;
    
    dialogInstrucciones.conBtnDos = true;
    dialogInstrucciones.conColorPrincipal = true;
    dialogInstrucciones.idBtnDos = "btn_listo";
    dialogInstrucciones.textoBtnDos = "Listo";
  }
  
  /**
   * Método update
   */
  void update() {

  }
}


