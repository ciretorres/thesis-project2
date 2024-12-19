import "./assets/main.css";

import * as dat from "dat.gui"; /**@see https://github.com/dataarts/dat.gui */
import * as THREE from "three"; /**@see https://www.npmjs.com/package/three?activeTab=versions */
import WebGL from "three/addons/capabilities/WebGL.js";

function init() {
  /**
   * Renders a view that contains your camera's "picture"
   * @use https://threejs.org/docs/api/en/renderers/WebGLRenderer.html
   */
  let alpha = true;
  const canvas = document.querySelector("#b");
  const renderer = new THREE.WebGLRenderer({
    alpha: alpha,
    antialias: true,
    canvas,
  });

  // a scene is the space in which you can places objects,cameras and lighting
  // @see https://threejs.org/docs/#api/en/scenes/Scene
  const scene = new THREE.Scene();

  /**
   * Adds a camera
   * A perspective view that simulates the behaviour of a film camera in real life
   * @property {fov}: the vertical field of view.
   * @property {aspect}: this is the aspect ratio you use to create the horizontal field of view based off the vertical.
   * @property {near}: this is the nearest plane of view (where the camera's view begins) .
   * @property {far}: this is far plane of view (where the camera's view ends).
   * new THREE.PerspectiveCamera(fov, aspect, near, far)
   * @see https://threejs.org/docs/api/en/cameras/PerspectiveCamera.html
   */
  const camera = new THREE.PerspectiveCamera(
    75,
    window.innerWidth / window.innerHeight,
    0.1,
    1000
  );
  camera.position.set(0, 0, 5);
  // camera.position.z = 100;
  // camera.lookAt( 0, 0, 0 );

  // TODO: mouse controls
  // const controls = new THREE.OrbitControls( camera );
  // controls.autoRotate = true;

  // TODO: implementar método resize
  // este resize solo lo hace una vez al actualizar el servidor
  renderer.setSize(window.innerWidth, window.innerHeight);

  // TODO: revisar esta instrucción porque si ya se logró utilizar
  // el canvas estático no tiene caso anidarlo en el main con js
  // adds the renderer element to the DOM so it is in our page
  const main = document.querySelector("main");
  main.appendChild(renderer.domElement);
  // document.body.appendChild(renderer.domElement);

  // pt.2
  // Creates a box, geometry, 3d model, cube or mesh
  // TODO: create a sphere
  // const geometry = new THREE.BoxGeometry( 1, 1, 1 );
  const geometry = new THREE.SphereGeometry(24, 32, 32);

  /**
   * Creates a material that describe the appereance of objects
   * @see https://threejs.org/docs/index.html#api/en/constants/Materials
   * @see https://threejs.org/manual/#en/materials
   */
  // use hex string
  let color = new THREE.Color("#7833aa");
  let hex = color.getHex();
  // use rgba string
  // let color = new THREE.Color("rgba(188, 141, 190, 1)");
  let wireframe = true;
  // const material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );
  // const material = new THREE.MeshBasicMaterial( { color: 0xfd59d7 } );
  // const material = new THREE.MeshNormalMaterial();
  const material = new THREE.MeshBasicMaterial({
    color: hex,
    wireframe: wireframe,
  });

  // adds the geometry to the mesh and apply the material to it
  const cube = new THREE.Mesh(geometry, material);
  scene.add(cube);
  // scene.add( mesh );

  // pt.3
  // Add lights
  const light = new THREE.PointLight(0xffff00);
  light.position.set(10, 50, 0);
  scene.add(light);

  function animate() {
    // rotate cube
    // cube.rotation.x += 0.01;
    // cube.rotation.y += 0.01;

    // render the scene
    renderer.render(scene, camera);
  }

  // a render loop
  const render = () => {
    requestAnimationFrame(render);

    // rotate cube
    cube.rotation.x += 0.0001;
    cube.rotation.y += 0.0001;

    camera.updateProjectionMatrix();
    // controls.update();
    renderer.render(scene, camera);
  };

  // renderer.setAnimationLoop( animate );
  if (WebGL.isWebGL2Available()) {
    // Initiate function or other initializations here
    // animate();
    // renderer.setAnimationLoop( animate );
    render();
    console.log("ay");
  } else {
    const warning = WebGL.getWebGL2ErrorMessage();
    document.getElementById("container").appendChild(warning);
  }

  // pt. 4
  // dat gui
  const gui = new dat.GUI();
  // iniciar la gui cerrada
  gui.close();

  const cameraPositionGui = gui.addFolder("camera position");
  cameraPositionGui.add(camera.position, "x");
  cameraPositionGui.add(camera.position, "y");
  cameraPositionGui.add(camera.position, "z");
  cameraPositionGui.open();

  const cameraProjectionGui = gui.addFolder("camera projection");
  cameraProjectionGui.add(camera, "fov");
  // cameraProjectionGui.open();

  const lightGui = gui.addFolder("light position");
  lightGui.add(light.position, "x");
  lightGui.add(light.position, "y");
  lightGui.add(light.position, "z");
  // lightGui.open();

  const cubeGui = gui.addFolder("cube position");
  cubeGui.add(cube.position, "x");
  cubeGui.add(cube.position, "y");
  cubeGui.add(cube.position, "z");
  // cubeGui.open();
}

function main() {
  // const canvas = document.querySelector( '#c' );
  let alpha = false;
  const renderer = new THREE.WebGLRenderer({ alpha: alpha });

  // creates the frustrum
  const fov = 75; // degrees
  const aspect = 2; // the canvas default
  const near = 0.1;
  const far = 5;
  const camera = new THREE.PerspectiveCamera(fov, aspect, near, far);
  camera.position.z = 5;

  const scene = new THREE.Scene();

  // módulo de luces
  {
    const color = 0xffffff;
    const intensity = 3;
    const light = new THREE.DirectionalLight(color, intensity);
    light.position.set(-1, 2, 4);
    scene.add(light);
  }

  const boxWidth = 1;
  const boxHeight = 1;
  const boxDepth = 1;
  const geometry = new THREE.BoxGeometry(boxWidth, boxHeight, boxDepth);

  function makeInstance(geometry, color, x) {
    const material = new THREE.MeshPhongMaterial({ color });

    const cube = new THREE.Mesh(geometry, material);
    scene.add(cube);

    cube.position.x = x;

    return cube;
  }

  const cubes = [
    makeInstance(geometry, 0x44aa88, 0),
    makeInstance(geometry, 0x8844aa, -2),
    makeInstance(geometry, 0xaa8844, 2),
  ];

  // // const material = new THREE.MeshBasicMaterial({color: 0x44aa88});  // greenish blue
  // const material = new THREE.MeshPhongMaterial({color: 0x44aa88});  // greenish blue
  // const cube = new THREE.Mesh(geometry, material);
  // scene.add(cube);

  // utilidad
  function resizeRendererToDisplaySize(renderer) {
    const canvas = renderer.domElement;
    const width = canvas.clientWidth;
    const height = canvas.clientHeight;
    const needResize = canvas.width !== width || canvas.height !== height;
    if (needResize) {
      renderer.setSize(width, height, false);
    }
    return needResize;
  }

  function render(time) {
    time *= 0.001; // convert time to seconds

    if (resizeRendererToDisplaySize(renderer)) {
      const canvas = renderer.domElement;
      camera.aspect = canvas.clientWidth / canvas.clientHeight;
      camera.updateProjectionMatrix();
    }

    cubes.forEach((cube, ndx) => {
      const speed = 1 + ndx * 0.1;
      const rot = time * speed;
      cube.rotation.x = rot;
      cube.rotation.y = rot;
    });
    // cube.rotation.x = time;
    // cube.rotation.y = time;

    renderer.render(scene, camera);

    requestAnimationFrame(render);
  }

  // adds the renderer element to the DOM so it is in our page
  const main = document.querySelector("main");
  main.appendChild(renderer.domElement);

  requestAnimationFrame(render);
}

main();

init();
