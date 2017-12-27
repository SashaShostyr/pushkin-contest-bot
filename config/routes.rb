Rails.application.routes.draw do
  root 'quiz#index'
  get 'quiz/index'
  post '/quiz', to: 'quiz#new'
end
