<script setup>
import { ref, onMounted } from "vue"
import p5 from "p5"

// const canvas = ref()
const sketch = ref()
// const { skt } = defineProps(["sketch"])

const id = Date.now().toString()

onMounted(() => {
    //   const newP5 = new p5(sketch, canvas.value)
    console.log(p5) // it's found
    sketch.value = ( s ) => {
    let x = 100;
    let y = 100;
  
    s.setup = () => {
    //   s.createCanvas(canvas.value);
      s.createCanvas(200, 200);
      // sketch.createCanvas(100, 100, WEBGL);
    };
  
    s.draw = () => {
      s.background(0);
      s.fill(255);
      s.rect(x,y,50,50);
    };
  };  
//   let myp5 = new p5(sketch.value, canvas.value);
let myp5 = new p5(sketch.value);
  console.log(myp5)
})

</script>

<template>
  <div ref="canvas" :id="id"></div>
</template>