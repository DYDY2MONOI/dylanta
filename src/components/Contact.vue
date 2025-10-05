<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useLanguage } from '../stores/language'

const isVisible = ref(false)
const { currentLanguage, isEnglish } = useLanguage()

const content = {
  en: {
    title: "Get In Touch",
    subtitle: "I'm always interested in new opportunities and collaborations",
    description: "Whether you have a project in mind, want to collaborate, or just want to say hello, I'd love to hear from you!",
    findMe: "Find me on",
    emailTitle: "Ready to work together?",
    emailDescription: "Let's discuss your project and see how we can bring your ideas to life.",
    sendEmail: "Send Email"
  },
  fr: {
    title: "Me contacter",
    subtitle: "Je suis toujours intéressé par de nouvelles opportunités et collaborations",
    description: "Que vous ayez un projet en tête, que vous souhaitiez collaborer, ou que vous vouliez simplement dire bonjour, j'aimerais avoir de vos nouvelles !",
    findMe: "Trouvez-moi sur",
    emailTitle: "Prêt à travailler ensemble ?",
    emailDescription: "Discutons de votre projet et voyons comment nous pouvons donner vie à vos idées.",
    sendEmail: "Envoyer un email"
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

  const element = document.getElementById('contact')
  if (element) {
    observer.observe(element)
  }
})


const socialLinks = [
  {
    name: 'GitHub',
    url: 'https://github.com/DYDY2MONOI'
  },
  {
    name: 'LinkedIn',
    url: 'https://www.linkedin.com/in/dylan-ta-261727254/'
  },
  {
    name: 'Malt',
    url: 'https://www.malt.fr/profile/dylanta'
  }
]
</script>

<template>
  <section id="contact" class="contact section">
    <div class="container">
      <div class="contact__content" :class="{ 'contact__content--visible': isVisible }">
          <div class="contact__header text-center">
            <h2 class="heading">{{ content[currentLanguage].title }}</h2>
            <p class="subheading">
              {{ content[currentLanguage].subtitle }}
            </p>
          </div>
        
        <div class="contact__main">
          <div class="contact__info">
            <div class="contact__card">
              <h3 class="contact__info-title">Let's Connect</h3>
              <p class="contact__info-description">
                {{ content[currentLanguage].description }}
              </p>
              
              <div class="contact__social">
                <h4 class="contact__social-title">{{ content[currentLanguage].findMe }}</h4>
                <div class="social-links">
                  <a 
                    v-for="(link, index) in socialLinks" 
                    :key="`${link.name}-${index}`"
                    :href="link.url"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="social-link"
                  >
                    <span class="social-link__name">{{ link.name }}</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="contact__form-wrapper">
            <div class="contact__email-section">
              <h3 class="contact__email-title">{{ content[currentLanguage].emailTitle }}</h3>
              <p class="contact__email-description">
                {{ content[currentLanguage].emailDescription }}
              </p>
              <a 
                href="mailto:dylan.ta@epitech.eu" 
                class="btn btn--primary btn--large"
              >
                {{ content[currentLanguage].sendEmail }}
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.contact {
  background: transparent;
}

.contact__content {
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.8s ease;
}

.contact__content--visible {
  opacity: 1;
  transform: translateY(0);
}

.contact__header {
  margin-bottom: 4rem;
}

.contact__main {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: start;
}

.contact__card {
  background: var(--color-background-soft);
  padding: 2.5rem;
  border-radius: 12px;
  border: 1px solid var(--color-border);
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
}

.contact__card:hover {
  border-color: var(--color-accent);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.contact__info-title {
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--color-heading);
  margin-bottom: 1rem;
}

.contact__info-description {
  color: var(--color-text);
  line-height: 1.6;
  margin-bottom: 2rem;
}

.contact__social-title {
  font-size: 1.1rem;
  font-weight: 500;
  color: var(--color-heading);
  margin-bottom: 1rem;
}

.social-links {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: 1rem;
  width: 100%;
  max-width: 100%;
}

.social-link {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 1rem 1.5rem;
  background: var(--color-background-mute);
  border: 1px solid var(--color-border);
  border-radius: 8px;
  text-decoration: none;
  color: var(--color-text);
  transition: all 0.2s ease;
  text-align: center;
  justify-content: center;
  flex: 1;
  max-width: 200px;
  box-sizing: border-box;
}

.social-link:hover {
  background: var(--color-background);
  border-color: var(--color-accent);
  color: var(--color-accent);
  transform: translateY(-2px);
}


.social-link__name {
  font-weight: 500;
}

.contact__form-wrapper {
  background: var(--color-background-soft);
  padding: 2.5rem;
  border-radius: 12px;
  border: 1px solid var(--color-border);
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
}

.contact__form-wrapper:hover {
  border-color: var(--color-accent);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
}

.contact__form {
  background: transparent;
  padding: 0;
  border: none;
}

.form-row {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1rem;
  margin-bottom: 1.5rem;
}

.form-group {
  margin-bottom: 1.5rem;
}

.form-label {
  display: block;
  font-weight: 500;
  color: var(--color-heading);
  margin-bottom: 0.5rem;
  font-size: 0.9rem;
}

.form-input,
.form-textarea {
  width: 100%;
  padding: 1rem;
  border: 1px solid var(--color-border);
  border-radius: 8px;
  background: var(--color-background-mute);
  color: var(--color-text);
  font-size: 0.9rem;
  transition: all 0.2s ease;
}

.form-input:focus,
.form-textarea:focus {
  outline: none;
  border-color: var(--color-accent);
  background: var(--color-background);
  box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.1);
}

.form-input::placeholder,
.form-textarea::placeholder {
  color: var(--color-text-muted);
}

.form-textarea {
  resize: vertical;
  min-height: 120px;
}

.btn--full {
  width: 100%;
  justify-content: center;
  padding: 1rem 2rem;
  font-size: 1rem;
  font-weight: 600;
}

.contact__email-section {
  text-align: center;
  max-width: 400px;
}

.contact__email-title {
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--color-heading);
  margin-bottom: 1rem;
}

.contact__email-description {
  color: var(--color-text-soft);
  margin-bottom: 2rem;
  line-height: 1.6;
}

.btn--large {
  padding: 1rem 2rem;
  font-size: 1.1rem;
  font-weight: 600;
}

@media (max-width: 768px) {
  .contact__main {
    grid-template-columns: 1fr;
    gap: 2rem;
  }
  
  .contact__card,
  .contact__form-wrapper {
    padding: 1.5rem;
  }
  
  .form-row {
    grid-template-columns: 1fr;
    gap: 0;
  }
  
  .social-links {
    grid-template-columns: 1fr;
  }
}
</style>

