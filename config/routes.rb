Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :v1 do
    resources :vagas, only: %i[index create]
    resources :pessoas, only: %i[index create]
    resources :candidaturas, only: %i[index create]
    get '/vagas/:id/candidaturas/ranking', to: 'candidaturas#ranking'
  end
end
