Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get('/questions', { :to => 'questions#index'})
  get '/questions/:id', to: 'questions#show'
  post '/questions', to: 'questions#create'
  delete '/questions/:id', to: 'questions#delete'
  put '/questions/:id', to: 'questions#update'
end
