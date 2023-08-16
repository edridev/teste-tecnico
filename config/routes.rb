Rails.application.routes.draw do
  namespace :v1 do
    post '/vagas', to: 'vagas#create'
    post '/pessoas', to: 'pessoas#create'
    post '/candidaturas', to: 'candidaturas#create'
    get '/vagas/:id/candidaturas/ranking', to: 'candidaturas#ranking'
  end
end
