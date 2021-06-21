Rails.application.routes.draw do

  resources :articles

  
  root to: 'welcome#home'


  get '/bets/risky_bets' => 'bets#risky_bets'
  #active record method

  get '/bets/my_bets' => 'bets#my_bets'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
 

  

  resources :sports, only: [:index] do
    resources :odds, only: [:index]
  end

  
  resources :odds, only: [:show] do 
    resources :bets, shallow: true
    # 8 routes 3 nested 5 unested
  end

  #google api route 
  resources :places, only: [:show]
      
end
