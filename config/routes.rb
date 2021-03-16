Rails.application.routes.draw do

  root to: 'welcome#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :sports, only: [:index]  

  resources :odds, only: [:index] do 
    resources :bets
  end
      
end
