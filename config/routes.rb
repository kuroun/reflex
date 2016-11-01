Rails.application.routes.draw do
  get 'landing_page/index'

  resources :tags
  resources :stories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'stories#index'
end
