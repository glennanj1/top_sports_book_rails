Rails.application.routes.draw do
  resources :betslips
  resources :betts
  resources :events
  resources :leagues
  resources :sports
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
