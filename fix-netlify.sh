#!/bin/bash

echo "🔧 Fixing Netlify deployment..."

# Add all changes
git add .

# Commit with descriptive message
git commit -m "Fix Netlify: Update Node.js to 20.19.0 for Vite 7 compatibility"

# Push to trigger Netlify rebuild
git push origin main

echo "✅ Changes pushed to GitHub!"
echo "🚀 Netlify will now rebuild with Node.js 20.19.0"
echo "📱 Your portfolio should deploy successfully now!"
