Rails.application.routes.draw do

  root to: 'welcome#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :sports, only: [:index]  

  resources :bets 

  resources :odds, only: [:index] 
    #do 
    #resources :bets, shallow: true
    # 8 routes 3 nested 5 unested
    #end
      
end
