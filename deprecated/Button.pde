color currentcolor;

RectButton rect1, rect2, rect3, rect4;

CircleButton circle1, circle2, circle3, circle4, circle5, circle6, circle7, circle8;

boolean locked = false;

class Button{
  int x, y;
  int size;
  int size2;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;
  
  void update(){
    if(over()){
      currentcolor = highlightcolor;
    } else {
      currentcolor = basecolor;
    }
  } // end update
  
  boolean pressed(){
    if(over){
      locked = true;
      return true;
    } else {
      locked = false;
      return false;
    }
  } // end pressed
  
  boolean over(){
    return true;
  } // end over
  
  boolean overRect(int x, int y, int width, int height){
    if(mouseX >= x && mouseX <= x+width &&
      mouseY >= y && mouseY <= y+height){
      return true;
    } else {
      return false;
    }
  } // end overRect 
  
  boolean overCircle(int x, int y, int diameter){
    float disX = x - mouseX;
    float disY = y - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < diameter/2 ){
      return true;
    } else {
      return false;
    }
  } // end overCircle
  
} // end Button

class RectButton extends Button{
  RectButton(int ix, int iy, int isize, int isize2, color icolor, color ihighlight){
    x = ix;
    y = iy;
    size = isize;
    size2 = isize2;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }
  
  boolean over(){
    if(overRect(x, y, size, size2)){
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  } // end over
  
  void display(){
    stroke(255);
    fill(currentcolor);
    rect(x,y,size, size2);
  } // end display
  
} // RectButton

class CircleButton extends Button{ 
  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight){
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }

  boolean over(){
    if( overCircle(x, y, size) ){
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  } // end over

  void display(){
    stroke(255);
    fill(currentcolor);
    ellipse(x, y, size, size);
  } // end display
  
} // end CircleButton
