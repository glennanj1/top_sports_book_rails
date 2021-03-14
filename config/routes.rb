Rails.application.routes.draw do
  resources :bets, only: [:index, :show] do 
    resources :betslips, only: [:index, :show, :create]
  end
  resources :events, only: [:index, :show]
  resources :leagues, only: [:index, :show]
  resources :sports, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
