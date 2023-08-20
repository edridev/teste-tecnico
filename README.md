# teste-tecnico-backend

Essa é uma aplicação que servirá como teste técnico com objetivo de cumprir uma das etapas do processo seletivo e onde será avaliada pela equipe de TI da Vagas.com.



## Informações técnicas

- Aplicação desenvolvida com ruby 3.1.4 e Ruby on Rails 7.0.7

- Os testes foi criados e efetuados com as gems **rspec-rails**, **faker**, **factory_bot_rails**, **database_cleaner-active_record**.

- Foi utilizado o **docker** e **docker-compose** que a aplicação possa ser executada através de container.



## Executando a aplicação

Crie um arquivo **.env** na pasta raíz da aplicação. Segue abaixo o conteúdo do arquivo:

```hs
POSTGRES_HOST=db
POSTGRES_DB=vagasdb
POSTGRES_USER=<INFORME SEU USUÁRIO>
POSTGRES_PASSWORD=<INFORME SUA SENHA>
```

No terminal de comandos digite:

```docker
docker compose up
```

Crie as migrações:

```docker
docker compose exec app bundle exec rake db:migrate
```

A aplicação já estará rodando na porta 9000:

```ruby
http://localhost:9000
```



# Cálculo do Score


### Configurando as variáveis de ambiente ###

Para o cálculo do foi utilizado as os passos abaixo:

##### 1. Testar se a título da vaga

  * É verificado se o título da vaga está contido no campo experiência(texto) do usúario. Caso não encontre é o Score é zerado e os próximos passos não serão executados.

##### 2. Compara idioma solicitado pela vaga

  * Caso a vaga solicicite um idioma, será verificado se o mesmo existe na lista de idiomas do candidato. Caso não exista o Score é zerado e os próximos passos não serão executados. Essa verificação só será realizada caso na vaga seja específicado.
  
##### 3. Cálculo de distância

  * Será calculado a distância entre a localização do candidato e a vaga através do Algorítimo de Dijkstra. Essa resultado será localizado na tabela informada na documentação do teste e a menor distância. Ao final desse processo a função retornará o percurso, no formato ('A --> B --> D --> F') e menor distãncia.

##### 4. Verifica a distância

  * Se a distância encontrada no passo anterior for maior que a distância máxima do usuário o Score será zerado e os próximos passos não serão executados.

##### 5. Diferença dos níveis

  * Após o calculo da diferença entre os níveis da vaga e do candidado, será feito a verificação conforme solicitado da documentação do teste.


##### 6. Resultado

  * Conforme instruções contidas na documentação o resultado será obtido dividindo por dois a soma da distância e a diferença de nível. Ambos serão obtidos nas tabelas após o seus respectivos cálculs.



