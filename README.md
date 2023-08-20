# teste-tecnico-backend


Essa é uma aplicação que servirá como teste técnico com objetivo de cumprir uma das etapas do processo seletivo e onde será avaliada pela equipe de TI da Vagas.com.

## Informações técnicas

- Aplicação desenvolvida com ruby 3.1.4 e Ruby on Rails 7.0.7

- Os testes foi criados e efetuados com as gems **rspec-rails**, **faker**, **factory_bot_rails**, **database_cleaner-active_record**.

- A documentação da api foi desenvolvida com a ferramenta [Swagger](https://swagger.io/) através da gem **rswag**

- Foi utilizado o **docker** e **docker-compose** que a aplicação possa ser executada através de container.

## Executando a aplicação

No terminal de comandos digite:

```ruby
docker compose up
```

Crie as migrações:

```ruby
docker compose exec app bundle exec rake db:migrate
```

A aplicação já estará rodando na porta 9000:

```ruby
http://localhost:9000
```
