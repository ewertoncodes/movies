# Projeto Movies App 🎥

Um aplicativo Rails para gerenciar filmes e adicionar comentários.

## 🚀 Como executar o projeto com Docker Compose

### 1. **Pré-requisitos**
- **Docker** e **Docker Compose** instalados.

### 2. **Configuração inicial**
Clone o repositório:

```bash
git clone https://github.com/ewertoncodes/movies.git
cd movies
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
