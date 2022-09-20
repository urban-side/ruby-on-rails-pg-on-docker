Rails.application.routes.draw do
  root "tasks#index"

  resources :tasks do
    collection do
      get  "search"
    end
  end

  resources :users

  # resourcesを使うフルセットルーティングはいらないので個別指定
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
