#!/bin/bash

# GLPI Advanced One-Command Deployment
# Created for Professional DevOps Portfolio

set -e

echo "🚀 Starting GLPI Advanced Deployment..."

# 1. Check Dependencies
if ! command -v docker &> /dev/null; then
    echo "❌ Docker not found. Please install Docker first."
    exit 1
fi

if ! docker compose version &> /dev/null; then
    echo "❌ Docker Compose v2 not found. Please install docker-compose-plugin."
    exit 1
fi

# 2. Generate SSL Certificates (Self-Signed)
echo "🔒 Generating SSL Certificates..."
mkdir -p nginx/certs
if [ ! -f nginx/certs/glpi.key ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout nginx/certs/glpi.key -out nginx/certs/glpi.crt \
        -subj "/C=US/ST=DevOps/L=Tech/O=IT/CN=localhost"
    echo "✅ SSL Certificates generated."
else
    echo "ℹ️ SSL Certificates already exist, skipping."
fi

# 3. Pull and Build
echo "📦 Building project containers..."
docker compose pull
docker compose build jenkins

# 4. Start Project
echo "🏗️ Starting services..."
docker compose up -d

# 5. Final Output
echo ""
echo "✨ GLPI Advanced Deployment Complete!"
echo "------------------------------------------------"
echo "🌐 GLPI Dashboard:  https://localhost"
echo "🛠️ Jenkins CI/CD:   https://localhost/jenkins"
echo "🗄️ Database:       glpi-db (internal)"
echo "🔐 Backup Path:    ./backups"
echo "------------------------------------------------"
echo "⚠️ Note: Since we use self-signed certs, your browser will show a warning."
echo "Click 'Advanced' -> 'Proceed' to access the dashboards."
