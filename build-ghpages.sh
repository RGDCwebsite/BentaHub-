#!/bin/bash
# Build script for GitHub Pages deployment
# This creates a static build of BentaHub that works on GitHub Pages

echo "Building BentaHub for GitHub Pages..."
npx vite build --config vite.config.ghpages.ts
echo "Build complete! Output in dist/public/"
