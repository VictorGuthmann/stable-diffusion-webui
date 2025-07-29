#!/usr/bin/env bash
set -e

echo "▶️ Instalando dependências pré-compiladas..."

# Atualiza o pip e ferramentas essenciais
pip install --upgrade pip setuptools wheel

# Instala manualmente os pacotes problemáticos
pip install \
  tokenizers==0.13.3 \
  pillow-avif-plugin==1.4.3 \
  --prefer-binary \
  --no-build-isolation

# Instala todas as outras dependências
pip install -r requirements.txt --prefer-binary --no-build-isolation

echo "✅ Tudo instalado, iniciando WebUI..."

# Inicia o Stable Diffusion Web UI
python3 launch.py --listen --port "$PORT" --skip-torch-cuda-test --xformers
