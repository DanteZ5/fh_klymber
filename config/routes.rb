Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'requests#new'
  resources :requests, only: [:new, :create]
  get 'requests/confirmation', to: "requests#confirmation", as: :confirmation
end
