console.log('imprimiendo desde src/sketches/index.js')
import p5 from "p5";
console.log(p5) // it's found

// const canvas = document.querySelector('#e');
// console.log(canvas)

const sketch = ( s ) => {
  let x = 0;
  let y = 0;
  let z = 0;

  s.setup = function () {
    s.createCanvas(100, 100, this.WEBGL);
  };    

  s.draw = () => {
    // s.background(0);
    s.background(255);

    // Enable orbiting with the mouse.
    s.orbitControl();

    // Set the style's sphere.
    // s.noStroke();    
    s.stroke(0,255,0)
    s.fill(255);    
    s.translate(x,y,z);    

    // Draw the sphere.
    // Set its radius to 30.
    s.sphere(30);
  };
};  
// let myp5 = new p5(sketch, canvas);
new p5(sketch);