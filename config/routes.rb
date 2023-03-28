Rails.application.routes.draw do
  #This reroutes the main page from rails to our 
  root "games#index"
  resources :games
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
