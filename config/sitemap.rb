# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.learn-locator.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # ここから記述
  # 静的ページ '/' の追加
  add root_path, priority: 1.0, changefreq: 'monthly'

  # 静的ページ '/spots/map' の追加
  add spots_map_path, priority: 0.9, changefreq: 'monthly'

  # 静的ページ '/spots' の追加
  add spots_path, priority: 0.8, changefreq: 'monthly'

  # 静的ページ '/reviews' の追加
  add reviews_path, priority: 0.8, changefreq: 'daily'

  # 動的ページ '/spots/:id' の追加
  Spot.find_each do |spot|
    add spot_path(spot), lastmod: spot.updated_at
  end

  # 動的ページ '/reviews/:id' の追加
  Review.find_each do |review|
    add review_path(review), lastmod: review.updated_at
  end
end
