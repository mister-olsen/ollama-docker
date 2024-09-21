FROM python:3.9-slim

# Instale dependências necessárias
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev

# Configure o diretório de trabalho
WORKDIR /app

# Copie os arquivos do Ollama
COPY . /app

# Instale o Ollama e suas dependências
RUN pip install --no-cache-dir -r requirements.txt

# Exponha a porta em que o Ollama opera (se aplicável)
EXPOSE 8000

# Comando para iniciar o Ollama
CMD ["python", "app.py"]
