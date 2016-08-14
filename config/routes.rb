Rails.application.routes.draw do
  
  root to: 'visitors#index'
  
  devise_for :users

  get '/report/subjects', to: 'reports#subjects'

  resources :teachers do
  	get :subjects
  end

  resources :students do
    get :subjects
  end
end
