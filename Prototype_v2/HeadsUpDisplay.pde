/**
 * The HeadsUpDisplay is about the part of the software 
 * which interacts directly with the users interface. 
 * It controls the dialog between the backend and frontend.
 */
int opcionDialogAbierto = 0;
// variables globales de estilo
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
    modalBienvenido.id = "dialogBienvenido";
    modalBienvenido.tituloModal = "Bievenida";
    modalBienvenido.textoModal = "texto";
    // btn instrucciones
    modalBienvenido.conBtnUnoInferior = true;    
    modalBienvenido.idBtnUnoInferior = "idBtnInstrucciones";
    modalBienvenido.colorFondoBtnUnoInferior = color(255, 255, 255, 0);
    modalBienvenido.colorFondoPrincipalBtnUnoInferior = false;
    modalBienvenido.tamanioTextoBtnUnoInferior = 24;
    modalBienvenido.textoBtnUnoInferior = "Instrucciones";
    // btn comenzar
    modalBienvenido.conBtnDosInferior = false;
    modalBienvenido.idBtnDosInferior = "idBtnComenzar";
    modalBienvenido.colorFondoBtnDosInferior = color(0);
    modalBienvenido.colorFondoPrincipalBtnDosInferior = true;
    modalBienvenido.tamanioTextoBtnDosInferior = 56;
    modalBienvenido.textoBtnDosInferior = "Comenzar";
  }
  /**
   * Método construyeDialogIntrucciones
   */
  void construyeModalIntrucciones() {
    // propiedades
    modalInstrucciones.id = "dialogInstrucciones";
    modalInstrucciones.tituloModal = "Instrucciones";
    modalInstrucciones.textoModal = "";
    // btn cerrar
    modalInstrucciones.conBtnCerrar = false;
    modalInstrucciones.idBtnCerrar = "idBtnCerrar";
    modalInstrucciones.formaBtn = "circle";
    modalInstrucciones.colorFondoBtnCerrar = color(255);
    modalInstrucciones.tamanioBtnCerrar = 88;
    modalInstrucciones.textoBtnCerrar = "C";
    // btn instrucciones
    modalInstrucciones.conBtnUnoInferior = true;    
    modalInstrucciones.idBtnUnoInferior = "idBtnListo";
    modalInstrucciones.colorFondoBtnUnoInferior = color(0);
    modalBienvenido.colorFondoPrincipalBtnUnoInferior = true;
    modalInstrucciones.tamanioTextoBtnUnoInferior = 56;
    modalInstrucciones.textoBtnUnoInferior = "Listo";
  }
  
  /**
   * Método update
   */
  void update() {

  }
}


