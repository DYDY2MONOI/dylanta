#!/bin/bash

echo "🚀 Deploying to Netlify..."

# Clean previous build
rm -rf dist

# Build the project
echo "📦 Building project..."
npm run build

# Verify assets are in dist
echo "📁 Checking assets..."
if [ -d "dist/assets" ]; then
    echo "✅ Assets found in dist/assets/"
    ls -la dist/assets/
else
    echo "❌ Assets not found in dist/assets/"
    exit 1
fi

# Copy _redirects to dist
echo "📄 Copying _redirects..."
cp public/_redirects dist/

echo "✅ Build complete! Ready for Netlify deployment."
echo "📁 Your dist folder contains:"
ls -la dist/

echo ""
echo "🚀 Next steps:"
echo "1. Commit and push to GitHub for automatic deployment:"
echo "   git add ."
echo "   git commit -m 'Fix assets: Move images to public folder'"
echo "   git push origin main"
echo ""
echo "2. Or drag the 'dist' folder to Netlify dashboard"
