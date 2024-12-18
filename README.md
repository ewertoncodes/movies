# Projeto Movies App 🎥



Um aplicativo Rails para gerenciar filmes e adicionar comentários.




https://github.com/user-attachments/assets/df2ec31f-a425-4b4d-9724-1b76a287a09d


## 🚀 Como executar o projeto com Docker Compose

### 1. **Pré-requisitos**
- **Docker** e **Docker Compose** instalados.

### 2. **Configuração inicial**
Clone o repositório:

```bash
git clone https://github.com/ewertoncodes/movies.git
```

Adicione sua chave da api [omdb](https://www.omdbapi.com/apikey.aspx?__EVENTTARGET=freeAcct&__EVENTARGUMENT=&__LASTFOCUS=&__VIEWSTATE=%2FwEPDwUKLTIwNDY4MTIzNQ9kFgYCAQ9kFgICBw8WAh4HVmlzaWJsZWhkAgIPFgIfAGhkAgMPFgIfAGhkGAEFHl9fQ29udHJvbHNSZXF1aXJlUG9zdEJhY2tLZXlfXxYDBQtwYXRyZW9uQWNjdAUIZnJlZUFjY3QFCGZyZWVBY2N0oCxKYG7xaZwy2ktIrVmWGdWzxj%2FDhHQaAqqFYTiRTDE%3D&__VIEWSTATEGENERATOR=5E550F58&__EVENTVALIDATION=%2FwEdAAU%2BO86JjTqdg0yhuGR2tBukmSzhXfnlWWVdWIamVouVTzfZJuQDpLVS6HZFWq5fYpioiDjxFjSdCQfbG0SWduXFd8BcWGH1ot0k0SO7CfuulHLL4j%2B3qCcW3ReXhfb4KKsSs3zlQ%2B48KY6Qzm7wzZbR&at=freeAcct&Email=) no seu

.env:

```bash
cd movies

touch .env
```

```bash
OMDB_API_KEY=valor
```

### 3. **Rodar o projeto**

Execute o projeto com Docker Compose:

```bash
docker-compose up --build
```

Acesse o projeto em:

http://localhost:3000

### 4. Executar os testes

Para rodar os testes:

```bash
docker-compose run --rm app bundle exec rspec
```

