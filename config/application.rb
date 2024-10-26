require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Google認証による外部リダイレクトのセキュリティエラーが発生した場合のハンドリング
    config.action_controller.raise_on_open_redirects = false

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # 日本時間（東京）に設定
    config.time_zone = "Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")

    # Railsアプリケーションのデフォルトの言語設定を日本語に設定
    config.i18n.default_locale = :ja

    # RailsアプリケーションでRack::Attackをミドルウェアとして使用するための設定
    config.middleware.use Rack::Attack
  end
end
