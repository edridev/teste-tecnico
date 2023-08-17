Rails.application.routes.draw do
  namespace :v1 do
    mount Rswag::Api::Engine => '/api-docs'
    resources :vagas, only: %i[index create]
    resources :pessoas, only: %i[index create]
    resources :candidaturas, only: %i[index create]
    get '/vagas/:id/candidaturas/ranking', to: 'candidaturas#ranking'
    # post '/vagas', to: 'vagas#create'
    # post '/pessoas', to: 'pessoas#create'
    # post '/candidaturas', to: 'candidaturas#create'
  end
end
