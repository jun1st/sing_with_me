Rails.application.routes.draw do
  
  devise_for :users
  resources :songs do
    resources :sings
  end

  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'compare' => 'home#compare'

  root 'songs#index'
end
