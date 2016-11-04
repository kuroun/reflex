Rails.application.routes.draw do
  get 'landing_page/index'
  get 'stories_feed', to: 'stories#stories_feed'

  resources :tags
  resources :stories, except: :index
  get 'my_stories', to: 'stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'stories#stories_feed'
end
