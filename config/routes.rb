Rails.application.routes.draw do
  resources :vacancies
  post '/v1/vacancies', to: 'vacancies#create'
end
