/**
 * The HeadsUpDisplay is about the part of the software which interacts directly
 * with the users interface. It controls the dialog between the backend and frontend.
 */
class HeadsUpDisplay {
    Dialog dialog = new Dialog();

    HeadsUpDisplay() {
        // Constructor
    }

    /**
     * Método donde se renderea todo lo que se va a dibujar
     */
    void display() {
        // Utility methods to permit the use of a Heads-Up Display
        // Begin and end screen-aligned 2D-drawing.
        // https://mrfeinberg.com/peasycam/reference/index.html
        camera.beginHUD();  
        // 
        //println("hola desde HUD");
        dialog.show();

        
        camera.endHUD();
    }

    /**
     * Método update
     */
    void update() {
        
    }
}
