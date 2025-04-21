#!/bin/bash
set -e

cd ~/obsidian-site

echo "🔄 Pulling latest changes..."
git pull origin v4

echo "🧱 Building Quartz site..."
npm run build

echo "🚚 Deploying to NGINX blog directory..."
rm -rf ~/docker/appdata/web/blog/*
cp -r public/* ~/docker/appdata/web/blog/

echo "🔁 Restarting web container..."
docker restart web

echo "✅ Deployment complete: https://scott.worleys.us/blog"
