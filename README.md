# teste-tecnico-backend


Essa é uma aplicação que servirá como teste técnico com objetivo de cumprir uma das etapas do processo seletivo e onde será avaliada pela equipe de TI da Vagas.com.

## Executando a aplicação

Crie e execute:

```ruby
gem 'simple_form'
```


```bash
# Construindo e rodando através do docker compose
docker compose up

# instrucoes.md
docker run -v $PWD:/opt/docs auchida/markdown-pdf markdown-pdf -o instrucoes.pdf instrucoes.md
```






# teste-tecnico-backend

Repositório com todos os arquivos necessários para implementação do teste técnico da VAGAS.com.

Por enquanto, estamos apenas revisando o teste técnico de Backend, mas esperamos que o teste técnico de Frontend venha pra cá em breve.

[Engenheiro de Software](instrucoes.md)

[Desafio Técnico](desafio-tecnico.md)

## Gerando arquivos em PDF

Para gerar os arquivos rode:

```bash
# desafio-tecnico.md
docker run -v $PWD:/opt/docs auchida/markdown-pdf markdown-pdf -o desafio-tecnico.pdf desafio-tecnico.md

# instrucoes.md
docker run -v $PWD:/opt/docs auchida/markdown-pdf markdown-pdf -o instrucoes.pdf instrucoes.md
```




OBRIGATÓRIO RUBY 2.7

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...








docker compose exec app bundle exec rake db:migrate
docker compose up


docker-compose exec app bundle exec rake db:migrate





