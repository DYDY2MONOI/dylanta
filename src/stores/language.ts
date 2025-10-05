import { ref } from 'vue'

// Global reactive state
const currentLanguage = ref<'en' | 'fr'>('en')

export const useLanguage = () => {
  const setLanguage = (lang: 'en' | 'fr') => {
    currentLanguage.value = lang
  }

  const isEnglish = () => currentLanguage.value === 'en'
  const isFrench = () => currentLanguage.value === 'fr'

  return {
    currentLanguage,
    setLanguage,
    isEnglish,
    isFrench
  }
}
