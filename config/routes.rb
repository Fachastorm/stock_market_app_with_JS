Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users  do 
    resources :portfolios, only: [:show]
  end
  
  resources :stocks, only: [:show]
  
  resources :user_stocks, only: [:edit, :update]
  
  
end
