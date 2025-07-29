#!/usr/bin/env bash

# Comando fixado para evitar erro ao executar como root no Render
can_run_as_root=1

# Funções internas (sem mudanças)
function is_wsl() {
    grep -qi Microsoft /proc/version &> /dev/null
}

function prepare_tcmalloc() {
    return
}

# Detecta o interpretador Python
python_cmd="python3"
LAUNCH_SCRIPT="launch.py"

printf "Launching launch.py..."

# ⚠️ ADIÇÃO para evitar erro com tokenizers e pillow-avif-plugin
pip install --upgrade pip
pip install --no-build-isolation -r requirements.txt

# Executa o script principal
"${python_cmd}" -u "${LAUNCH_SCRIPT}" "$@"
