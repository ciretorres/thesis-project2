console.log('imprimiendo desde src/sketches/index.js');
import p5 from 'p5';
console.log(p5); // it's found

// const canvas = document.querySelector('#e');
// console.log(canvas)

// forma 1 crear un objeto sketch de p5
new p5((sketch) => {
  let x = 0;
  let y = 0;
  let z = 0;
  sketch.setup = function () {
    sketch.createCanvas(100, 100, this.WEBGL);
  };
  sketch.draw = () => {
    // s.background(0);
    sketch.background(255);
    // Enable orbiting with the mouse.
    sketch.orbitControl();
    // Set the style's sphere.
    // s.noStroke();
    sketch.stroke(255, 0, 255);
    sketch.fill(255);
    sketch.translate(x, y, z);
    // Draw the sphere.
    // Set its radius to 30.
    sketch.sphere(30);
  };
});

// forma 2 crear un objeto sketch de p5
const sketch = (s) => {
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
    s.stroke(255, 0, 255);
    s.fill(255);
    s.translate(x, y, z);
    // Draw the sphere.
    // Set its radius to 30.
    s.sphere(30);
  };
};
// let myp5 = new p5(sketch, canvas);
new p5(sketch);
