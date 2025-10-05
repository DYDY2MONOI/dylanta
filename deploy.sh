#!/bin/bash

# Build the project
npm run build

# Copy assets to dist folder
cp -r assets dist/

# Copy _redirects to dist folder
cp public/_redirects dist/

echo "✅ Build complete! Ready for Netlify deployment."
echo "📁 Your dist folder contains all necessary files."
echo "🚀 You can now:"
echo "   1. Drag the 'dist' folder to Netlify"
echo "   2. Or push to GitHub for automatic deployment"
