source "https://rubygems.org"

ruby "3.2.3"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.4"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
# turbo利用のため導入
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
# オートコンプリート機能の実装のため導入
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# ユーザー登録用のgem
gem 'sorcery'

# 秘匿情報保護用のgem
gem 'dotenv-rails', groups: [:development, :test]

# GooglePlacesAPIを使用、条件つき検索、店舗情報などの取得のためのgem
gem 'google_places'

# [現時点で不要だったのでアンインストール済み]GeoderdingAPIを使用、緯度経度から住所を取得、現在地を取得するためのgem
# gem 'geocoder'

# [現時点で不要だったのでアンインストール済み]Google Places APIを利用、オートコンプリート機能、インフォウィンドウの表示などのためのgem
# gem 'gmaps4rails'

# Ruby on Railsアプリケーションを多言語対応させるためのライブラリ
gem 'rails-i18n'

# ページネーション機能を実装するためのgem
gem 'kaminari'

# 検索機能を実装するためのgem
gem 'ransack'

# 画像アップロード機能を実装するためのgem
gem "carrierwave", "~> 2.0"
gem 'fog-aws'

# 画像圧縮・リサイズ機能を実装するためのgem
gem 'mini_magick'

# Railsアプリケーションで設定情報を管理する(APIキーやコールバックURLなど、環境ごとに異なる設定を行いたい場合)ためのgem
gem 'config'

# Railsアプリケーションの開発環境において、送信されるメールをブラウザで確認できるgem
gem 'letter_opener_web'

# APIへのリクエスト数を制御するために使用するgem
gem 'rack-attack'

# SEO対策の一環で、サイトマップを作成するために使用するgem
gem 'sitemap_generator'

# サイトマップの更新など、定期実行の処理を行うためのgem
gem 'whenever', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
  # デバッグ用のgem
  gem 'pry-byebug'

  # RSpecの導入
  gem 'rspec-rails' # RSpecをRailsアプリで使用するために必要
  gem 'spring-commands-rspec' # RSpecのテストを高速化するために必要
  gem "factory_bot_rails" # モデルのインスタンス（テストデータ）を生成するためのgem
  gem 'faker' # ランダムな擬似データを生成するためのgem

  # RSpecのテストカバレッジを計測するためのgem
  gem 'simplecov'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"


  # rubocopの導入
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false # railsアプリケーション特化のRuboCop
  # todo : 必要に応じて導入予定
  # gem 'rubocop-performance', require: false # パフォーマンス改善に特化したルールを追加する拡張機能
  # gem 'rubocop-rspec', require: false # rspec用のRuboCop
  # gem 'rubocop-rake', require: false # Rakeタスク用のRuboCop
  # gem 'overcommit', require: false # コミット前にRuboCopを実行するツール
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
