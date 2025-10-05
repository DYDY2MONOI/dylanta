<script setup lang="ts">
import { ref, onMounted } from 'vue'
import Carousel3D from './Carousel3D.vue'
import SimpleCarousel from './SimpleCarousel.vue'
import { useLanguage } from '../stores/language'

const isVisible = ref(false)
const { currentLanguage, isEnglish } = useLanguage()

const content = {
  en: {
    title: "My Projects",
    subtitle: "A collection of projects that showcase my skills and passion for development"
  },
  fr: {
    title: "Mes Projets",
    subtitle: "Une collection de projets qui mettent en valeur mes compétences et ma passion pour le développement"
  }
}

onMounted(() => {
  const observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          isVisible.value = true
        }
      })
    },
    { threshold: 0.1 }
  )

  const element = document.getElementById('projects')
  if (element) {
    observer.observe(element)
  }
})

const projects = [
  {
    id: 1,
    title: '42SH',
    description: 'Reproduction of a Linux terminal (shell) in C.',
    technologies: ['C', 'Linux', 'System Programming'],
    image: '/assets/42sh.png',
    github: 'https://github.com/dylanta/42sh',
    live: undefined,
    details: {
      duration: '3 weeks',
      features: [
        'Complete command interpreter',
        'Internal builtins: cd, echo, export, unset, exit',
        'Input/output redirection handling (<, >, >>, >&)',
        'Advanced shell functionality'
      ]
    }
  },
  {
    id: 2,
    title: 'Arcade',
    description: 'Cross-platform modular game platform.',
    technologies: ['C++', 'OOP', 'SFML', 'Ncurses'],
    image: '/assets/arcade.avif',
    github: 'https://github.com/dylanta/arcade',
    live: undefined,
    details: {
      duration: '4 weeks',
      features: [
        'Object-Oriented Programming design',
        'Class design, inheritance, and polymorphism',
        'Recreated classic games: Jetpack and Snake',
        'Cross-platform compatibility',
        'Multiple graphical libraries support'
      ]
    }
  },
  {
    id: 3,
    title: 'Raytracer',
    description: 'A project aimed at generating realistic digital images by simulating the reverse trajectory of light.',
    technologies: ['C++', 'SFML', 'Computer Graphics', 'Mathematics'],
    image: '/assets/raytracer.jpg',
    github: 'https://github.com/dylanta/raytracer',
    live: undefined,
    details: {
      duration: '5 weeks',
      features: [
        'Realistic digital image generation',
        'Light trajectory simulation',
        'Scene description from file input',
        'Advanced computer graphics algorithms',
        'SFML integration for rendering'
      ]
    }
  },
  {
    id: 4,
    title: 'Area',
    description: 'Epitech\'s Area project aims to create an application from scratch, a website and a mobile application with backend server integration.',
    technologies: ['Vue.js', 'PostgreSQL', 'Golang', 'Swift'],
    image: '/assets/area.webp',
    github: 'https://github.com/dylanta/area',
    live: undefined,
    details: {
      duration: '8 weeks',
      features: [
        'Full-stack application development',
        'Web application with Vue.js',
        'iOS mobile application with Swift',
        'Backend server with Golang',
        'PostgreSQL database integration',
        'Third-party service integration (Zapier, IFTTT)',
        'Action-reaction automation system'
      ]
    }
  },
  {
    id: 5,
    title: 'Image Compressor',
    description: 'The goal of the project is to create a program that compresses images in Haskell.',
    technologies: ['Haskell', 'Unix'],
    image: '/assets/imagecompressor.png',
    github: 'https://github.com/dylanta/image-compressor',
    live: undefined,
    details: {
      duration: '4 weeks',
      features: [
        'Functional programming with Haskell',
        'Image compression algorithms',
        'Unix system integration',
        'Pure functional approach',
        'Immutable data structures',
        'Pattern matching and recursion',
        'High-performance image processing'
      ]
    }
  },
  {
    id: 6,
    title: 'ASM MiniLibc',
    description: 'The goal of the project is to create a dynamic library in assembly language.',
    technologies: ['Assembly', 'x86-64', 'System Programming', 'Unix'],
    image: '/assets/asm%20minilibc.png',
    github: 'https://github.com/dylanta/asm-minilibc',
    live: undefined,
    details: {
      duration: '5 weeks',
      features: [
        'Assembly language programming',
        'Dynamic library creation',
        'x86-64 architecture',
        'System-level programming',
        'Memory management',
        'Low-level optimizations',
        'Unix system calls',
        'Library linking and loading'
      ]
    }
  },
  {
    id: 7,
    title: 'My RPG',
    description: 'The goal of the project is to create an RPG game.',
    technologies: ['Graphical', 'CSFML', 'C'],
    image: '/assets/myrpg.jpg',
    github: 'https://github.com/dylanta/my-rpg',
    live: undefined,
    details: {
      duration: '6 weeks',
      features: [
        'Role-playing game development',
        'CSFML graphical rendering',
        'C programming language',
        'Game mechanics implementation',
        'Character system design',
        'Interactive gameplay',
        'Cross-platform compatibility',
        'Real-time graphics rendering'
      ]
    }
  }
]

// Extract images for the carousel
const projectImages = projects.map(project => project.image)
</script>

<template>
  <section id="projects" class="projects section">
    <div class="container">
      <div class="projects__header text-center">
        <h2 class="heading">{{ content[currentLanguage].title }}</h2>
        <p class="subheading">
          {{ content[currentLanguage].subtitle }}
        </p>
      </div>
      
      <!-- 3D Carousel Section -->
      <div class="projects__carousel" :class="{ 'projects__carousel--visible': isVisible }">
        <div class="projects__carousel-wrapper">
          <!-- 3D Carousel -->
          <Carousel3D 
            :items="projectImages"
            container-class="projects__carousel-container"
            class="projects__carousel-interactive"
            :width="350"
            :height="450"
          />
        </div>
      </div>
      
      <!-- Traditional Grid (Hidden on desktop, shown on mobile) -->
      <div class="projects__grid projects__grid--mobile" :class="{ 'projects__grid--visible': isVisible }">
        <div 
          v-for="project in projects" 
          :key="project.id"
          class="project-card"
        >
          <div class="project-card__image">
            <img :src="project.image" :alt="project.title" class="project-card__img">
          </div>
          
          <div class="project-card__content">
            <h3 class="project-card__title">{{ project.title }}</h3>
            <p class="project-card__description">{{ project.description }}</p>
            
            <div class="project-card__technologies">
              <span 
                v-for="tech in project.technologies" 
                :key="tech"
                class="tech-tag"
              >
                {{ tech }}
              </span>
            </div>
            
            <div class="project-card__actions">
              <a 
                :href="project.github" 
                target="_blank" 
                rel="noopener noreferrer"
                class="btn btn--secondary btn--small"
              >
                GitHub
              </a>
              <a 
                :href="project.live" 
                target="_blank" 
                rel="noopener noreferrer"
                class="btn btn--primary btn--small"
              >
                Live Demo
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.projects {
  background: var(--color-background);
}

.projects__header {
  margin-bottom: 4rem;
}

/* 3D Carousel Styles */
.projects__carousel {
  margin-bottom: 4rem;
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s ease;
}

.projects__carousel--visible {
  opacity: 1;
  transform: translateY(0);
}

.projects__carousel-wrapper {
  display: flex;
  justify-content: center;
  margin-bottom: 2rem;
  background: transparent;
}

.projects__carousel-container {
  background: transparent;
  border: none;
  border-radius: 0;
  overflow: visible;
  box-shadow: none;
  transition: none;
  min-height: 400px;
  position: relative;
}

.projects__carousel-interactive {
  cursor: grab;
  user-select: none;
}

.projects__carousel-interactive:active {
  cursor: grabbing;
}

.projects__carousel-info {
  text-align: center;
  margin-top: 1rem;
}

.projects__carousel-text {
  color: var(--color-text-muted);
  font-size: 0.9rem;
  font-weight: 500;
  letter-spacing: 0.5px;
}

/* Traditional Grid (Hidden on desktop) */
.projects__grid--mobile {
  display: none;
}

.projects__grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s ease;
}

.projects__grid--visible {
  opacity: 1;
  transform: translateY(0);
}

.project-card {
  background: var(--color-background-soft);
  border: 1px solid var(--color-border);
  border-radius: 8px;
  overflow: hidden;
  transition: all 0.3s ease;
}

.project-card:hover {
  transform: translateY(-4px);
  border-color: var(--color-accent);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
}

.project-card__image {
  height: 200px;
  background: var(--color-background-mute);
  display: flex;
  align-items: center;
  justify-content: center;
  border-bottom: 1px solid var(--color-border);
  overflow: hidden;
}

.project-card__img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.project-card__content {
  padding: 1.5rem;
}

.project-card__title {
  font-size: 1.25rem;
  font-weight: 600;
  color: var(--color-heading);
  margin-bottom: 0.75rem;
}

.project-card__description {
  color: var(--color-text);
  line-height: 1.5;
  margin-bottom: 1.5rem;
}

.project-card__technologies {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-bottom: 1.5rem;
}

.tech-tag {
  background: var(--color-background-mute);
  color: var(--color-text);
  padding: 0.25rem 0.75rem;
  border-radius: 4px;
  font-size: 0.8rem;
  font-weight: 500;
  border: 1px solid var(--color-border);
}

.project-card__actions {
  display: flex;
  gap: 1rem;
}

.btn--small {
  padding: 0.5rem 1rem;
  font-size: 0.85rem;
}

/* Mobile Styles */
@media (max-width: 768px) {
  .projects__carousel {
    display: none;
  }
  
  .projects__grid--mobile {
    display: grid;
    grid-template-columns: 1fr;
  }
  
  .project-card__actions {
    flex-direction: column;
  }
  
  .btn--small {
    width: 100%;
    text-align: center;
  }
}

/* Tablet Styles */
@media (max-width: 1024px) and (min-width: 769px) {
  .projects__carousel-container {
    height: 50vh;
  }
}
</style>
