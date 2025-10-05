<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { useLanguage } from '../stores/language'

const isScrolled = ref(false)
const { currentLanguage, setLanguage, isEnglish } = useLanguage()

const handleScroll = () => {
  isScrolled.value = window.scrollY > 20
}

const toggleLanguage = () => {
  setLanguage(currentLanguage.value === 'en' ? 'fr' : 'en')
}

const navLinks = {
  en: {
    about: 'About',
    projects: 'Projects',
    contact: 'Contact'
  },
  fr: {
    about: 'À propos',
    projects: 'Projets',
    contact: 'Contact'
  }
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<template>
  <header class="header" :class="{ 'header--scrolled': isScrolled }">
    <div class="container">
      <nav class="nav">
        <div class="nav__brand">
          <a href="/" class="nav__logo">Dylan Ta</a>
        </div>
        
        <div class="nav__menu">
          <a href="#about" class="nav__link">{{ navLinks[currentLanguage].about }}</a>
          <a href="#projects" class="nav__link">{{ navLinks[currentLanguage].projects }}</a>
          <a href="#contact" class="nav__link">{{ navLinks[currentLanguage].contact }}</a>
          <button @click="toggleLanguage" class="nav__lang-toggle">
            {{ currentLanguage === 'en' ? 'FR' : 'EN' }}
          </button>
        </div>
      </nav>
    </div>
  </header>
</template>

<style scoped>
.header {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  z-index: 1000;
  background: transparent;
  transition: all 0.3s ease;
  border-bottom: 1px solid transparent;
}

.header--scrolled {
  background: rgba(0, 0, 0, 0.8);
  backdrop-filter: blur(10px);
  border-bottom-color: var(--color-border);
}

.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 0;
}

.nav__brand {
  font-size: 1.25rem;
  font-weight: 600;
}

.nav__logo {
  color: var(--color-heading);
  text-decoration: none;
  transition: color 0.2s ease;
}

.nav__logo:hover {
  color: var(--color-accent-hover);
}

.nav__menu {
  display: flex;
  gap: 2rem;
}

.nav__link {
  color: var(--color-text);
  text-decoration: none;
  font-size: 0.9rem;
  font-weight: 500;
  transition: color 0.2s ease;
  position: relative;
}

.nav__link:hover {
  color: var(--color-accent);
}

.nav__link::after {
  content: '';
  position: absolute;
  bottom: -4px;
  left: 0;
  width: 0;
  height: 1px;
  background: var(--color-accent);
  transition: width 0.2s ease;
}

.nav__link:hover::after {
  width: 100%;
}

.nav__lang-toggle {
  background: var(--color-background-mute);
  border: 1px solid var(--color-border);
  color: var(--color-text);
  padding: 0.4rem 0.8rem;
  border-radius: 6px;
  font-size: 0.8rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
  margin-left: 1rem;
}

.nav__lang-toggle:hover {
  background: var(--color-accent);
  border-color: var(--color-accent);
  color: var(--color-background);
}

@media (max-width: 768px) {
  .nav__menu {
    gap: 1.5rem;
  }
  
  .nav__link {
    font-size: 0.85rem;
  }
}
</style>
