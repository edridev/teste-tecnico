Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :v1 do
    resources :vagas, only: %i[index show create] do
      get '/candidaturas/ranking', to: 'candidaturas#ranking'
    end
    resources :pessoas, only: %i[index show create] do
      post '/idiomas', to: 'idiomas#add_to_pessoa'
    end
    resources :candidaturas, only: %i[index show create]
    resources :idiomas, only: %i[index show create]
  end
end
