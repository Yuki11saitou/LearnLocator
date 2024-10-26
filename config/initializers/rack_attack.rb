class Rack::Attack
  # 同一IPアドレスからのリクエストを1分間に60リクエストまでに制限
  throttle('req/ip', limit: 60, period: 1.minute) do |req|
    req.ip
  end

  # 制限を超えたリクエストに対するレスポンスをカスタマイズ
  self.throttled_response = lambda do |env|
    # カスタムHTMLレスポンス
    [
      429,
      { 'Content-Type' => 'text/html' },
      [ApplicationController.render(
        template: 'errors/too_many_requests',
        layout: false
      )]
    ]
  end
end