Rails.application.routes.draw do

  # パスワードリセット：Railsアプリケーションにおいて、開発環境で LetterOpenerWeb エンジンを /letter_opener というパスにマウントする設定
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  # Google認証用のルーティング
  # ここで認証結果を処理し、例えばユーザーをアプリケーションにログインさせるなどの処理を実行
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # 一部のOAuthプロバイダーや設定では、コールバックに対してGETリクエストを使用する場合もある
  # OAuth認証の最初のステップとして、ユーザーを外部サービスの認証ページにリダイレクト
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "static_pages#top"

  # 利用規約とプライバシーポリシーのルーティング
  get 'terms_of_use', to: 'static_pages#terms_of_use'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

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
    # 口コミ用のルーティング
    resources :reviews, only: %i[new create show edit update destroy], shallow: true
    collection do
      # ブックマーク一覧表示用のルーティング
      get :bookmarks
      # オートコンプリート用のルーティング
      get :auto_search
    end
  end

  # 口コミ検索ページのルーティング
  resources :reviews, only: %i[index] do
    collection do
      # オートコンプリート用のルーティング
      get :auto_search
    end
  end

  # いいね機能用のルーティング
  resources :likes, only: %i[create destroy]

  # ブックマーク機能用のルーティング
  resources :bookmarks, only: %i[create destroy]

  # マイページ用のルーティング
  resource :profile, only: [:show, :edit, :update, :destroy]
  get 'profiles/my_reviews', to: 'profiles#my_reviews', as: :my_reviews
  get 'profiles/my_likes', to: 'profiles#my_likes', as: :my_likes

  # パスワードリセット用のルーティング
  resources :password_resets, only: %i[new create edit update]
end
