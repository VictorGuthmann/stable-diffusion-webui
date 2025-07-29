#!/usr/bin/env bash
set -e

echo "▶️ Instalando dependências pré-compiladas..."

# Atualiza ferramentas de build
pip install --upgrade pip setuptools wheel

# Instala os pacotes problemáticos diretamente
pip install \
  tokenizers==0.13.3 \
  pillow-avif-plugin==1.4.3 \
  --prefer-binary \
  --no-build-isolation

# Instala o restante normalmente
pip install -r requirements.txt --prefer-binary --no-build-isolation

echo "✅ Tudo pronto, iniciando WebUI..."
python3 launch.py --listen --port "$PORT" --skip-torch-cuda-test --xformers
