#!/usr/bin/env bash
set -e

echo "🔧 Corrigindo ambiente para Render..."

pip install --upgrade pip setuptools wheel

# Evita compilação do tokenizers (usa wheel oficial)
pip install tokenizers==0.13.3 --prefer-binary --no-build-isolation

# Agora instala o resto
pip install -r requirements.txt --prefer-binary --no-build-isolation

echo "✅ Tudo instalado, iniciando WebUI..."
python3 launch.py --listen --port "$PORT" --skip-torch-cuda-test --xformers
