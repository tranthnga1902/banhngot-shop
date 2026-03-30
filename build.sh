#!/bin/bash
# Build script for Render.com
# This script is used by Render's build process

set -e

echo "Starting build process..."

# Check if Maven wrapper exists, if not download it
if [ ! -f "./mvnw" ]; then
    echo "Downloading Maven wrapper..."
    curl -sL https://raw.githubusercontent.com/takari/maven-wrapper/master/mvnw -o mvnw
    chmod +x mvnw
fi

# Build the project
echo "Building application..."
./mvnw clean package -DskipTests

echo "Build completed successfully!"
