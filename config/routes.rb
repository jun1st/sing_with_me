Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'compare' => 'home#compare'

  root 'home#index'
end
