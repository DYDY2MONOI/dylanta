<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useLanguage } from '../stores/language'

const isVisible = ref(false)
const { currentLanguage, isEnglish } = useLanguage()

const content = {
  en: {
    title: "About Me",
    subtitle: "Passionate about technology and always eager to learn new things",
    description1: "I'm a computer science student with a strong interest in web development and software engineering. I enjoy building user-friendly applications and exploring the latest technologies in the field.",
    description2: "When I'm not coding, I'm playing video games or training Brazilian Jiu-jitsu.",
    skills: "Skills",
    tools: "Tools",
    language: "Language",
    languageButton: "Tools"
  },
  fr: {
    title: "À propos de moi",
    subtitle: "Passionné par la technologie et toujours désireux d'apprendre de nouvelles choses",
    description1: "Je suis étudiant en informatique avec un fort intérêt pour le développement web et l'ingénierie logicielle. J'aime créer des sites web et explorer les dernières technologies du domaine.",
    description2: "Quand je ne code pas, je joue aux jeux vidéo ou je m'entraîne au Jiu-jitsu brésilien.",
    skills: "Compétences",
    tools: "Outils",
    language: "Langages",
    languageButton: "Outils"
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

  const element = document.getElementById('about')
  if (element) {
    observer.observe(element)
  }
})

const showSkills = ref(true)

const skills = [
  { name: 'React' },
  { name: 'JavaScript' },
  { name: 'TypeScript' },
  { name: 'Node.js' },
  { name: 'Python' },
  { name: 'Docker' },
  { name: 'HTML/CSS' },
  { name: 'PostgreSQL' },
  { name: 'MariaDB' },
  { name: 'C' },
  { name: 'C++' }
]

const technologies = [
  { name: 'GitHub', category: 'Version Control' },
  { name: 'Linux / MacOS / Fedora / Ubuntu', category: 'Operating Systems' },
  { name: 'Windows', category: 'Operating Systems' },
  { name: 'Jira', category: 'Project Management' },
  { name: 'VSCode', category: 'IDE' },
  { name: 'Shell', category: 'Terminal' },
  { name: 'CMake / Make', category: 'Build Tools' },
  { name: 'Postman', category: 'API Testing' },
  { name: 'SSH', category: 'Remote Access' },
  { name: 'Criterion', category: 'Testing Framework' },
  { name: 'GDB', category: 'Debugger' },
  { name: 'GCC', category: 'Compiler' },
  { name: 'Vite', category: 'Build Tool' },
  { name: 'DBeaver', category: 'Database Tool' }
]

const toggleView = () => {
  showSkills.value = !showSkills.value
}
</script>

<template>
  <section id="about" class="about section">
    <div class="container">
      <div class="about__content" :class="{ 'about__content--visible': isVisible }">
        <div class="about__text">
          <h2 class="heading">{{ content[currentLanguage].title }}</h2>
          <p class="subheading">
            {{ content[currentLanguage].subtitle }}
          </p>
          <div class="about__description">
            <p>
              {{ content[currentLanguage].description1 }}
            </p>
            <p>
              {{ content[currentLanguage].description2 }}
            </p>
          </div>
        </div>
        
        <div class="about__skills">
          <div class="about__skills-header">
            <h3 class="about__skills-title">
              {{ showSkills ? content[currentLanguage].language : content[currentLanguage].tools }}
            </h3>
            <button 
              @click="toggleView" 
              class="toggle-btn"
              :class="{ 'toggle-btn--active': !showSkills }"
            >
              {{ showSkills ? content[currentLanguage].languageButton : content[currentLanguage].language }}
            </button>
          </div>
          
          <!-- Skills View -->
          <div v-if="showSkills" class="technologies-grid">
            <div 
              v-for="skill in skills" 
              :key="skill.name"
              class="tech-item"
            >
              <span class="tech-name">{{ skill.name }}</span>
              <span class="tech-category">Language</span>
            </div>
          </div>
          
          <!-- Technologies View -->
          <div v-else class="technologies-grid">
            <div 
              v-for="tech in technologies" 
              :key="tech.name"
              class="tech-item"
            >
              <span class="tech-name">{{ tech.name }}</span>
              <span class="tech-category">{{ tech.category }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.about {
  background: var(--color-background-soft);
}

.about__content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: start;
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s ease;
}

.about__content--visible {
  opacity: 1;
  transform: translateY(0);
}

.about__description p {
  margin-bottom: 1.5rem;
  color: var(--color-text);
  line-height: 1.6;
}

.about__skills {
  background: var(--color-background-mute);
  padding: 2rem;
  border-radius: 8px;
  border: 1px solid var(--color-border);
}

.about__skills-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 2rem;
}

.about__skills-title {
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--color-heading);
  margin: 0;
}

.toggle-btn {
  background: var(--color-background-mute);
  border: 1px solid var(--color-border);
  color: var(--color-text);
  padding: 0.5rem 1rem;
  border-radius: 6px;
  font-size: 0.9rem;
  font-weight: 500;
  cursor: pointer;
  transition: all 0.2s ease;
}

.toggle-btn:hover {
  background: var(--color-background);
  border-color: var(--color-accent);
  color: var(--color-accent);
}

.toggle-btn--active {
  background: var(--color-accent);
  border-color: var(--color-accent);
  color: var(--color-background);
}

.skills-grid {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.skill-item {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.skill-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.skill-name {
  font-weight: 500;
  color: var(--color-text);
}

.skill-percentage {
  font-size: 0.9rem;
  color: var(--color-text-muted);
}

.skill-bar {
  height: 6px;
  background: var(--color-border);
  border-radius: 3px;
  overflow: hidden;
}

.skill-progress {
  height: 100%;
  background: var(--color-accent);
  border-radius: 3px;
  transition: width 1s ease;
}

.technologies-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
}

.tech-item {
  background: var(--color-background-mute);
  border: 1px solid var(--color-border);
  border-radius: 8px;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
  transition: all 0.2s ease;
}

.tech-item:hover {
  background: var(--color-background);
  border-color: var(--color-accent);
  transform: translateY(-2px);
}

.tech-name {
  font-weight: 600;
  color: var(--color-heading);
  font-size: 1rem;
}

.tech-category {
  font-size: 0.85rem;
  color: var(--color-text-soft);
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

@media (max-width: 768px) {
  .about__content {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .about__skills {
    padding: 1.5rem;
  }
}
</style>

