function setup() {
  createCanvas(100, 100, WEBGL);
  describe("A white sphere on a gray background.");
}
function draw() {
  // background(200);
  background(0);
  // Enable orbiting with the mouse.
  orbitControl();
  // Set the style's sphere.
  // noStroke();
  stroke(255, 0, 0);
  fill(255);
  // translate(0,0, 0);
  // Draw the sphere.
  // Set its radius to 30.
  sphere(30);
}
