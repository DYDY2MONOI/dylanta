<template>
  <div class="simple-carousel" ref="carouselRef">
    <div class="carousel-track" :style="{ transform: `translateX(${translateX}px)` }">
      <div 
        v-for="(item, index) in items" 
        :key="index"
        class="carousel-item"
        :style="{ 
          backgroundImage: `url(${item})`
        }"
      >
        <div class="carousel-item-content">
          <div class="carousel-item-image" :style="{ backgroundImage: `url(${item})` }"></div>
        </div>
      </div>
    </div>
    <div class="carousel-controls">
      <button @click="prev" class="carousel-btn">‹</button>
      <button @click="next" class="carousel-btn">›</button>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'

interface Props {
  items?: string[]
  autoplay?: boolean
  interval?: number
}

const props = withDefaults(defineProps<Props>(), {
  items: () => [],
  autoplay: true,
  interval: 3000
})

const carouselRef = ref<HTMLDivElement>()
const translateX = ref(0)
const currentIndex = ref(0)
let autoplayInterval: number | null = null

const next = () => {
  currentIndex.value = (currentIndex.value + 1) % props.items.length
  translateX.value = -currentIndex.value * 100
}

const prev = () => {
  currentIndex.value = currentIndex.value === 0 ? props.items.length - 1 : currentIndex.value - 1
  translateX.value = -currentIndex.value * 100
}

onMounted(() => {
  if (props.autoplay) {
    autoplayInterval = setInterval(next, props.interval)
  }
})

onUnmounted(() => {
  if (autoplayInterval) {
    clearInterval(autoplayInterval)
  }
})
</script>

<style scoped>
.simple-carousel {
  position: relative;
  width: 100%;
  height: 400px;
  perspective: 1000px;
  overflow: hidden;
  border-radius: 16px;
  background: var(--color-background-soft);
  border: 1px solid var(--color-border);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
}

.carousel-track {
  display: flex;
  height: 100%;
  transition: transform 0.5s ease;
  transform-style: preserve-3d;
}

.carousel-item {
  flex: 0 0 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  transform-style: preserve-3d;
  transition: transform 0.5s ease;
}

.carousel-item-content {
  width: 300px;
  height: 350px;
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
  border: 2px solid var(--color-border);
}

.carousel-item-image {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.carousel-controls {
  position: absolute;
  top: 50%;
  left: 0;
  right: 0;
  display: flex;
  justify-content: space-between;
  padding: 0 20px;
  transform: translateY(-50%);
  pointer-events: none;
}

.carousel-btn {
  background: rgba(0, 0, 0, 0.7);
  color: white;
  border: none;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  font-size: 24px;
  cursor: pointer;
  pointer-events: all;
  transition: all 0.3s ease;
  display: flex;
  align-items: center;
  justify-content: center;
}

.carousel-btn:hover {
  background: rgba(0, 0, 0, 0.9);
  transform: scale(1.1);
}
</style>

