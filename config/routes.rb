Rails.application.routes.draw do
  namespace :v1 do
    post '/vagas', to: 'v1/vagas#create'
    post '/pessoas', to: 'v1/pessoas#create'
    post '/candidaturas', to: 'v1/candidaturas#create'
  end
end
