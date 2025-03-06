# Use uma imagem oficial do Ubuntu
FROM ubuntu:22.04

# Instale dependências necessárias
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Defina o diretório de trabalho
WORKDIR /chatbot

# Copie os arquivos do projeto para o container
COPY . /chatbot
COPY models /chatbot/models

# Instale as dependências do projeto
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install rasa

# Exponha a porta usada pelo Rasa
EXPOSE 5005

# Execute o Rasa no modo servidor
CMD ["rasa", "run", "-m", "models", "--enable-api", "--cors", "*"]
