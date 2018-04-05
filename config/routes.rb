Rails.application.routes.draw do

  get 'most_added', to: 'amounts#most_added'

  get 'portfolio', to: 'users#portfolio'

  get 'search_stocks',  to: 'stocks#search'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
    resources :watchlists
  end
  
  resources :users  do 
    resources :positions, only: [:index, :create, :destroy]
  end

  
  root 'welcome#home'

  
  
  
end
