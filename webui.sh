#!/usr/bin/env bash
set -e

echo "🔧 Iniciando instalação..."

# Evita compilação
pip install --upgrade pip setuptools wheel

# Instala `tokenizers` como binário, evitando cargo
pip install tokenizers==0.13.3 --prefer-binary --no-build-isolation

# Instala o restante
pip install -r requirements.txt --prefer-binary --no-build-isolation

echo "🚀 Iniciando o WebUI..."
python3 launch.py --listen --port "$PORT" --skip-torch-cuda-test --xformers
