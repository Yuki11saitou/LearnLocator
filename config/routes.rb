Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "static_pages#top"

  # 施設の違い説明ページのルーティング
  get 'difference', to:'static_pages#difference'

  # ユーザー登録用のルーティング
  resources :users, only: %i[new create]

  # ログイン・ログアウト用のルーティング
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # 場所検索ページのルーティング
  get 'spots/map'

  # 一覧検索ページのルーティング
  resources :spots, only: %i[index show] do
    # 口コミ投稿用のルーティング
    resources :reviews, only: %i[new create edit destroy], shallow: true
  end

end
