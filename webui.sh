#!/usr/bin/env bash
set -e

echo "🔧 Corrigindo ambiente para Render..."

pip install --upgrade pip setuptools wheel

# Instala dependências problemáticas por wheels pré-compilados
pip install \
    tokenizers==0.13.3 \
    pillow-avif-plugin==1.4.3 \
    --prefer-binary \
    --no-build-isolation

# Instala o restante
pip install -r requirements.txt --prefer-binary --no-build-isolation

echo "✅ Tudo instalado, iniciando WebUI..."
python3 launch.py --listen --port "$PORT" --skip-torch-cuda-test --xformers
