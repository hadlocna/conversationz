Conversationz::Application.routes.draw do

  resources :users
  resources :projects
  resources :words

  get '/login' => 'users#login'
  post '/login' => 'users#create_login'
  post '/logout' => 'users#logout'

  get '/my_projects' => 'my_projects#index'



  root to: 'users#index'


end
