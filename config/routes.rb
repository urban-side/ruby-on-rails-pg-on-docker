Rails.application.routes.draw do
  resources :labels
  root "tasks#index"

  resources :tasks do
    collection do
      get  "search"
    end
  end

  scope '/admin' do
    resources :users
    patch '/users/:id/chrole', to: 'users#chrole', as: 'chrole_user'
  end

  # resourcesを使うフルセットルーティングはいらないので個別指定
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
