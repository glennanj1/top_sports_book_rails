Rails.application.routes.draw do
  
  root to: 'welcome#home'

  
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :bets, only: [:index, :show] do 
    resources :betslips, only: [:index, :show, :new, :create]
  end
  resources :events, only: [:index, :show]
  resources :leagues, only: [:index, :show]
  resources :sports, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
