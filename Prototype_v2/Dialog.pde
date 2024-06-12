class Dialog {
  int espaciado = 24;

  // inicializa botón
  Button buttonRect;
  Button buttonRect2;
  Button buttonCircle;

  // propiedades Dialogo
  color dialogBackgroundColor = color(102, 102, 102, 191);
  color dialogTextColor;
  int dialogWidth = width - (width/2);                              
  int dialogHeight = height - (height/3);                           
  int dialogX = width/2 - (dialogWidth/2);                       
  int dialogY = height/2 - (dialogHeight/2);                       
  // propiedades botón rectángulo
  int rectWidth = dialogWidth - (espaciado * 2);                 
  int rectHeight = 72;                                           
  int rectX = width/2 - (rectWidth/2);
  int rectY = height/2 + (dialogHeight/2) - (rectHeight);
  // propiedades botón circulo
  int circleSize = 88;                                             
  int circleX = dialogX + dialogWidth - (circleSize/2) - espaciado;
  int circleY = dialogY + (circleSize/2) + espaciado;        

  Dialog() {
    // Constructor
    buttonRect = new Button(
      rectWidth, 
      rectHeight, 
      rectX, 
      rectY, 
      color(255,255,255,0), 
      "Instrucciones", 32
    );
    buttonRect2 = new Button(
      rectWidth, 
      rectHeight, 
      rectX, 
      rectY - rectHeight-espaciado, 
      color(0), 
      "Comenzar", 64
    );

    buttonCircle = new Button(circleSize, circleX, circleY);
  }

  /**
   * Método donde se renderea todo lo que se va a dibujar
   */
  void show() {
    // Dibuja dialogo
    fill(dialogBackgroundColor);
    rect(dialogX, dialogY, dialogWidth, dialogHeight);

    buttonRect.render();
    buttonRect2.render();
    buttonCircle.render();

    textSize(72);
    textAlign(LEFT, TOP);
    fill(0, 408, 612, 816);
    text("Bienvenido", dialogX+espaciado, dialogY);
  }
}
