class HeadsUpDisplay {
    Dialog instructions = new Dialog();

    HeadsUpDisplay() {
        // Constructor
    }

    /**
     * Método donde se renderea todo lo que se va a dibujar
     */
    void display() {
        camera.beginHUD();  
        // 
        //println("hola desde HUD");
        instructions.show();

        
        camera.endHUD();
    }

    /**
     * Método update
     */
    void update() {
        
    }
}
