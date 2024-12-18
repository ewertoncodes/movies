FROM ruby:3.2.2

# Instala a imagem oficial do Node.js (LTS) baseada no Alpine
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
  && apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  imagemagick \
  libvips-dev \
  libxml2-dev \
  libxslt1-dev \
  libcurl4-openssl-dev \
  git \
  curl \
  nodejs \
  npm \
  && npm install -g yarn

# Definindo o diretório de trabalho
WORKDIR /app

# Copia o Gemfile e o Gemfile.lock
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

# Instala as dependências do bundle
RUN bundle install

# Copia o restante do código para o contêiner
COPY . /app

# Expõe a porta 3000
EXPOSE 3000

# Define o comando para iniciar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
