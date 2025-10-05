<script setup lang="ts">
import { RouterView } from 'vue-router'
import Header from './components/Header.vue'
import AnimatedBackground from './components/AnimatedBackground.vue'
</script>

<template>
  <div id="app">
    <AnimatedBackground 
      :hue="200" 
      :saturation="0.6" 
      :chroma="0.4"
      class="fixed inset-0 w-full h-full"
    />
    <div class="relative z-10 min-h-screen">
      <Header />
      <RouterView />
    </div>
  </div>
</template>

<style>
#app {
  min-height: 100vh;
  position: relative;
  overflow-x: hidden;
}

/* Ensure the background covers the entire viewport */
.fixed {
  position: fixed;
}

.inset-0 {
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
}

.w-full {
  width: 100%;
}

.h-full {
  height: 100%;
}
</style>
