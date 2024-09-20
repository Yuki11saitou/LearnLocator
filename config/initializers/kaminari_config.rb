# frozen_string_literal: true

Kaminari.configure do |config|
  config.default_per_page = 5 # 1ページあたりの表示件数
  # config.max_per_page = nil
  config.window = 2 # 現在のページの前後に表示するページ数
  # config.outer_window = 0 # 最初と最後に表示するページ数
  # config.left = 0
  # config.right = 0
  # config.page_method_name = :page
  # config.param_name = :page
  # config.max_pages = nil
  # config.params_on_first_page = false
end
