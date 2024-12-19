Creo que de las desventajas que le veo a p5js con el navegador es:

- el número de advertencias en la consola del browser.
- el uso del ´this.WEBGL´para crear el canvas.
- tienes que regresar una función objeto con dos métodos por instancia de parámetro para el ´setup´y el ´draw´
- no he descubierto cómo colocar un canvas estático en el body y dentro del main para que lo utilice en lugar de crear uno por defecto.
- tampoco he descubierto cómo hacer el ancho del fondo responsivo a la pantalla y que se actualice la visualización
- estar actualizando las dependencias de vue

Ventajas:

- es el uso de eslint y prettier para colocarle punto y coma al final y convesiones para ES6.
- utilizas scripts y estilos desde otra carpeta o ubicación.
- instalar dependencias por npm en lugar de cdn o subir las librerías al repo.
- la construcción de un build de despliegue para el ambiente.
- el canvas lo coloca dentro del main en auto porque la jerarquía de vue me permite colocar el main y luego mandar un componente o archivo vue anidado.
- jugar con los ciclos de vue hooks onMounted y las propiedades reactivas ref.
- las extensiones y settings del .vscode

https://stackblitz.com/edit/angular-zkpdzeso-having-a-problem-loading-setti-sl2qiekl?file=src%2Fapp%2Fhello.component.ts

https://stackoverflow.com/questions/59295824/having-a-problem-loading-setting-webgl-to-the-createcanvas-method-in-p5-js

https://threejs.org/docs/index.html#manual/en/introduction/Installation

https://threejs.org/docs/#manual/en/introduction/WebGL-compatibility-check

https://stackoverflow.com/questions/59111286/uncaught-referenceerror-webgl-is-not-defined

https://github.com/processing/p5.js/blob/main/src/core/main.js#L39

https://github.com/processing/p5.js/wiki/Global-and-instance-mode

https://github.com/Kinrany/vue-p5/blob/main/src/p5.vue

https://medium.com/@mhiratsuka/explore-p5-js-with-webgl-755a019be2b4

https://github.com/Nico-Mayer/p5-vue/blob/main/src/App.vue

https://medium.com/@mariorobertofortunato/integrate-p5-js-sketches-in-vue-f5f4e2c48c25

https://medium.com/js-dojo/experiment-with-p5-js-on-vue-7ebc05030d33

https://github.com/processing/p5.js

https://www.npmjs.com/package/p5?activeTab=code

https://cdn.jsdelivr.net/npm/p5@1.11.2/

https://github.com/antiboredom/p5.vscode

https://github.com/antiboredom/p5.js/tree/master

https://p5js.org/libraries/

https://p5js.org/sketches/

https://p5js.org/examples/

https://p5js.org/tutorials/

https://p5js.org/reference/p5/sphere/

# p5vue

This template should help get you started developing with Vue 3 in Vite.

## Recommended IDE Setup

[VSCode](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur).

## Customize configuration

See [Vite Configuration Reference](https://vite.dev/config/).

## Project Setup

```sh
npm install
```

### Compile and Hot-Reload for Development

```sh
npm run dev
```

### Compile and Minify for Production

```sh
npm run build
```

### Lint with [ESLint](https://eslint.org/)

```sh
npm run lint
```
