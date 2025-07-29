#!/usr/bin/env bash

set -e

echo "▶️ Instalando dependências (com --no-build-isolation)..."
pip install --upgrade pip
pip install --no-build-isolation -r requirements.txt

echo "▶️ Iniciando Stable Diffusion WebUI no Render..."
python3 launch.py --listen --port "$PORT" --skip-torch-cuda-test --xformers
