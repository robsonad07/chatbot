# Use uma imagem oficial do Rasa
FROM rasa/rasa:3.6.21

# Copie os arquivos do projeto para o container
COPY . /chatbot
COPY models /chatbot/models
WORKDIR /chatbot

# Instale as dependências (caso tenha actions)
RUN pip install --no-cache-dir -r requirements.txt

# Execute o Rasa no modo servidor
CMD ["run", "-m", "models", "--enable-api", "--cors", "*"]
