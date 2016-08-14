Rails.application.routes.draw do
  
  root to: 'visitors#index'
  
  devise_for :users

  resources :teachers do
  	get :subjects
  end

  resources :students do
    get :subjects
  end
end
