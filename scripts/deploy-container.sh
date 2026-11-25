#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$PROJECT_DIR"

echo "==> Mengambil versi terbaru dari GitHub"
git pull --ff-only origin main

echo "==> Build dan jalankan stack Docker Compose"
sudo docker compose up -d --build --remove-orphans

echo "==> Memeriksa status container"
sudo docker compose ps

echo "==> Memeriksa respons website"
curl --fail --silent --show-error http://127.0.0.1:8081/ > /dev/null

echo "==> Deployment container selesai"
