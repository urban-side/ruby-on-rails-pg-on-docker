Rails.application.routes.draw do
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "tasks#index"
  resources :tasks do
    collection do
      get  "search"
    end
  end

  # resourcesを使うフルセットルーティングはいらないので個別指定
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
