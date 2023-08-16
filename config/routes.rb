Rails.application.routes.draw do
  namespace :v1 do
    resources :samples
    post '/vagas', to: 'vagas#create'
    post '/pessoas', to: 'pessoas#create'
    post '/candidaturas', to: 'candidaturas#create'
  end
end
