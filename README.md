# Dylan Ta - Portfolio

A modern, responsive portfolio website built with Vue.js and TypeScript, featuring a dark theme inspired by Vercel.

## Features

- **Modern Design**: Clean, minimal design with a dark theme using black and white colors
- **Responsive**: Fully responsive design that works on all devices
- **Smooth Animations**: Subtle animations and transitions for better user experience
- **TypeScript**: Full TypeScript support for better development experience
- **Vue 3**: Built with the latest Vue.js framework using Composition API
- **Vite**: Fast development and build tooling

## Sections

- **Hero**: Introduction and call-to-action
- **About**: Personal information and skills showcase
- **Projects**: Portfolio of selected projects
- **Contact**: Contact form and social links

## Tech Stack

- Vue.js 3
- TypeScript
- Vite
- Vue Router
- Pinia (State Management)
- CSS3 with CSS Variables
- ESLint + Prettier

## Getting Started

### Prerequisites

- Node.js (v20.19.0 or higher)
- npm or yarn

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd dylan-ta-portfolio

# Install dependencies
npm install
```

### Development

```bash
# Start development server
npm run dev
```

The application will be available at `http://localhost:5173`

### Building for Production

```bash
# Build for production
npm run build
```

### Testing

```bash
# Run unit tests
npm run test:unit

# Run e2e tests
npm run test:e2e
```

### Linting

```bash
# Run ESLint
npm run lint

# Format code with Prettier
npm run format
```

## Customization

### Colors

The color scheme is defined in `src/assets/base.css` using CSS variables:

```css
:root {
  --color-background: #000000;
  --color-background-soft: #111111;
  --color-background-mute: #1a1a1a;
  --color-border: #333333;
  --color-heading: #ffffff;
  --color-text: #a3a3a3;
  --color-accent: #ffffff;
}
```

### Content

Update the following files to customize your content:

- `src/components/Hero.vue` - Hero section content
- `src/components/About.vue` - About section and skills
- `src/components/Projects.vue` - Project showcase
- `src/components/Contact.vue` - Contact information

## Deployment

The project can be deployed to any static hosting service:

- Vercel
- Netlify
- GitHub Pages
- AWS S3 + CloudFront

### Vercel Deployment

1. Connect your repository to Vercel
2. Set build command: `npm run build`
3. Set output directory: `dist`
4. Deploy!

## License

This project is open source and available under the [MIT License](LICENSE).