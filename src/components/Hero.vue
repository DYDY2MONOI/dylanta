<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useLanguage } from '../stores/language'

const isVisible = ref(false)
const { currentLanguage, isEnglish } = useLanguage()

const content = {
  en: {
    title: "Hello, I'm Dylan Ta",
    subtitle: "Student Developer passionate about creating digital experiences",
    description: "I'm a computer science student with a passion for web development, mobile apps, and exploring new technologies. Currently learning web languages like Vue.js, React, Golang.",
    viewWork: "View My Work",
    getInTouch: "Get In Touch"
  },
  fr: {
    title: "Bonjour, je suis Dylan Ta",
    subtitle: "Développeur Étudiant en informatique",
    description: "Je suis étudiant en informatique avec une passion pour le développement web, les applications mobiles et l'exploration de nouvelles technologies. J'apprends actuellement des langages web comme Vue.js, React, Golang.",
    viewWork: "Voir mes projets",
    getInTouch: "Me contacter"
  }
}

onMounted(() => {
  setTimeout(() => {
    isVisible.value = true
  }, 100)
})
</script>

<template>
  <section class="hero">
    <div class="container">
      <div class="hero__content" :class="{ 'hero__content--visible': isVisible }">
        <h1 class="hero__title">
          {{ content[currentLanguage].title }}
        </h1>
        <p class="hero__subtitle">
          {{ content[currentLanguage].subtitle }}
        </p>
        <p class="hero__description">
          {{ content[currentLanguage].description }}
        </p>
        <div class="hero__actions">
          <a href="#projects" class="btn btn--primary">{{ content[currentLanguage].viewWork }}</a>
          <a href="#contact" class="btn btn--secondary">{{ content[currentLanguage].getInTouch }}</a>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  padding-top: 80px;
  background: var(--color-background);
}

.hero__content {
  max-width: 800px;
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s ease;
}

.hero__content--visible {
  opacity: 1;
  transform: translateY(0);
}

.hero__title {
  font-size: 3.5rem;
  font-weight: 700;
  color: var(--color-heading);
  margin-bottom: 1.5rem;
  line-height: 1.1;
}

.hero__name {
  color: var(--color-accent);
  position: relative;
}

.hero__name::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 2px;
  background: var(--color-accent);
  animation: underline 2s ease-in-out;
}

@keyframes underline {
  0% { width: 0; }
  100% { width: 100%; }
}

.hero__subtitle {
  font-size: 1.5rem;
  color: var(--color-text);
  margin-bottom: 1.5rem;
  font-weight: 400;
}

.hero__description {
  font-size: 1.125rem;
  color: var(--color-text-muted);
  margin-bottom: 3rem;
  line-height: 1.6;
  max-width: 600px;
}

.hero__actions {
  display: flex;
  gap: 1.5rem;
  flex-wrap: wrap;
}

.btn {
  display: inline-block;
  padding: 0.75rem 2rem;
  border-radius: 6px;
  text-decoration: none;
  font-weight: 500;
  font-size: 0.9rem;
  transition: all 0.2s ease;
  border: 1px solid transparent;
}

.btn--primary {
  background: var(--color-accent);
  color: var(--color-background);
  border-color: var(--color-accent);
}

.btn--primary:hover {
  background: var(--color-accent-hover);
  border-color: var(--color-accent-hover);
  transform: translateY(-1px);
}

.btn--secondary {
  background: transparent;
  color: var(--color-accent);
  border-color: var(--color-border);
}

.btn--secondary:hover {
  background: var(--color-background-soft);
  border-color: var(--color-accent);
  transform: translateY(-1px);
}

@media (max-width: 768px) {
  .hero__title {
    font-size: 2.5rem;
  }
  
  .hero__subtitle {
    font-size: 1.25rem;
  }
  
  .hero__description {
    font-size: 1rem;
  }
  
  .hero__actions {
    flex-direction: column;
    align-items: flex-start;
  }
  
  .btn {
    width: 100%;
    text-align: center;
  }
}
</style>
