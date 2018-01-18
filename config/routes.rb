Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'brands/:id/image', to: 'brand#image'
  resources :image, path: :images, only: [:index, :show, :create]
  resources :brand, path: :brands, only: [:index, :show, :create]
  resources :type, path: :types, only: [:index, :show, :create]
end
