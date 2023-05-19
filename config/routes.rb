Rails.application.routes.draw do
  root 'homes#top'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:edit, :update]
  resources :going_outs do
    collection do
      get '/search', to: 'going_outs#search'
    end
  end
  resources :salaries, only: [:index] do
    collection do
      get '/search', to: 'salaries#search'
    end
  end
end
