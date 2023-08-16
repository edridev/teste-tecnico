Rails.application.routes.draw do
  post '/v1/vagas', to: 'vagas#create'
  post '/v1/pessoas', to: 'pessoas#create'
end
