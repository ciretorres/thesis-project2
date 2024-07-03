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
  // controlador de Diálogo
  ControladorDialogo controladorDialogo = new ControladorDialogo();
  // dialogo de Bienvenida
  Modal modalBienvenido = new Modal();
  // dialogo de Instrucciones
  Modal modalInstrucciones = new Modal();

  HeadsUpDisplay() {
    // Constructor

    // construye dialogo de Bienvenida
    construyeModalBienvenido();
    // construye dialogo de Instrucciones
    construyeModalIntrucciones();
    
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
    // TODO: mostrar controlador de dialogo
    controladorDialogo.mostrar();

    // abrir dialog
    switch(opcionDialogAbierto) {
    case 0:
      modalBienvenido.show();
      break;
    case 1:
      modalInstrucciones.show();
      break;
    default:
      // println("cerrados");
    }


    camera.endHUD();
  }
  
  /**
   * Método construyeDialogBienvenido
   */
  void construyeModalBienvenido() {
    // propiedades
    modalBienvenido.id = "dialog_bienvenido";
    modalBienvenido.tituloDialog = "Bievenida";
    modalBienvenido.textoDialog = "texto";
    modalBienvenido.dialogTextColor = color(0, 408, 612, 816);
    // btn cerrar
    modalBienvenido.conBtnCerrar = false;
    // btn uno
    modalBienvenido.conBtnUno = true;
    // btn dos
    modalBienvenido.conBtnDos = true;
    modalBienvenido.conColorPrincipal = false;
    modalBienvenido.idBtnDos = "btn_instrucciones";
    modalBienvenido.textoBtnDos = "Instrucciones";
  }

  /**
   * Método construyeDialogIntrucciones
   */
  void construyeModalIntrucciones() {
    // propiedades
    modalInstrucciones.id = "dialog_instrucciones";
    modalInstrucciones.tituloDialog = "Instrucciones";
    modalInstrucciones.textoDialog = "";
    modalInstrucciones.dialogTextColor = color(0, 408, 612, 816);
    // btn cerrar
    modalInstrucciones.conBtnCerrar = true;
    // btn uno
    modalInstrucciones.conBtnUno = false;
    // btn dos
    modalInstrucciones.conBtnDos = true;
    modalInstrucciones.conColorPrincipal = true;
    modalInstrucciones.idBtnDos = "btn_listo";
    modalInstrucciones.textoBtnDos = "Listo";
  }
  
  /**
   * Método update
   */
  void update() {

  }
}


