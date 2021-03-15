Rails.application.routes.draw do
  
  root to: 'welcome#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :sports, only: [:index]  
    
  resources :leagues, only: [:index] 
  
  resources :events, only: [:index] 

  resources :bets, only: [:index] do 
    resources :betslips, only: [:index, :show, :new, :create]
  end
      
end
