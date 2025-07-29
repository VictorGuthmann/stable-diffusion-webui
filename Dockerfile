# Etapa 1 - Imagem base
FROM python:3.10-slim

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    git curl libgl1 libglib2.0-0 build-essential \
    cmake rustc cargo ffmpeg wget && \
    apt-get clean

# Cria diretório de trabalho
WORKDIR /app

# Copia tudo do projeto
COPY . .

# Atualiza pip e instala dependências Python
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta usada (ajuste se necessário)
EXPOSE 7860

# Comando para iniciar a webui
CMD ["python", "launch.py", "--listen", "--port", "7860", "--skip-torch-cuda-test"]
