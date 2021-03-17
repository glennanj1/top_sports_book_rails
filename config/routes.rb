Rails.application.routes.draw do

  root to: 'welcome#home'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :sports, only: [:index] do
    resources :odds, only: [:index]
  end

  
  resources :odds, only: [:show] do 
    resources :bets, shallow: true
    # 8 routes 3 nested 5 unested
  end
      
end
