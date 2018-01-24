Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users  do 
    resources :positions, only: [:index]
  end
  
  get 'search_stocks',  to: 'stocks#search'
    
  resources :positions
  
  
  
end
