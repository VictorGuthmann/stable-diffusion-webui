#!/usr/bin/env bash
set -e

echo "🔧 Iniciando configuração do ambiente Render..."

# Atualiza pip e evita compilações
pip install --upgrade pip setuptools wheel

# Instala tokenizers SEM COMPILAR
pip install tokenizers==0.13.3 --prefer-binary --no-build-isolation

# Instala o restante das dependências
pip install -r requirements.txt --prefer-binary --no-build-isolation

# Inicia a aplicação
echo "✅ Iniciando o Stable Diffusion WebUI..."
python3 launch.py --listen --port "$PORT" --skip-torch-cuda-test --xformers
