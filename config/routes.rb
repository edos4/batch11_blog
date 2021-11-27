Rails.application.routes.draw do
  resources :games
  resources :products

  resources :articles do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
