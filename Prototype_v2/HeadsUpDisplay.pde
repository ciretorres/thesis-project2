class HeadsUpDisplay {
    Button button = new Button();

    HeadsUpDisplay() {
        // Constructor
    }

    /**
     * Método donde se renderea todo lo que se va a dibujar
     */
    void show() {
        camera.beginHUD();  
        // 
        //println("hola desde HUD");
        button.show();
        camera.endHUD();
    }

    /**
     * Método update
     */
    void update() {
        
    }
}
