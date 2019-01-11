Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'freelancers#new'
  resources :freelancers, only: [:new, :create]
end
