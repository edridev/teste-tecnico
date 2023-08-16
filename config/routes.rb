Rails.application.routes.draw do
  namespace :v1 do
    resources :samples
    post '/vagas', to: 'v1/vagas#create'
    post '/pessoas', to: 'v1/pessoas#create'
  end
end
