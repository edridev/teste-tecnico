Rails.application.routes.draw do
  post '/v1/vacancies', to: 'vacancies#create'
  post '/v1/people', to: 'people#create'
end
