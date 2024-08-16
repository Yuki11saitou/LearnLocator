require 'csv' # CSVファイルを操作するためのライブラリを読み込む
require 'open-uri' # 外部のURLからデータを取得するためのライブラリを読み込む
require 'json' # JSONデータを扱うためのライブラリを読み込む
API_KEY = ENV['GOOGLE_MAPS_API_KEY'] # 環境変数からAPIキーを取得

namespace :Spot do
  desc 'Fetch and save spot details'
  task :get_and_save_details => :environment do
    #スポット名からplace_idを取得するメソッドを定義
    def get_place_id(name)
      client = GooglePlaces::Client.new(API_KEY)
      # 「spot」にAPIを利用して得たスポット情報が入る
      spot = client.spots_by_query(name).first
      spot.place_id if spot
    end

    #place_idから詳細情報を取得するメソッドを定義
    def get_detail_data(spot)
      place_id = get_place_id(spot['スポット名'])

      if place_id
        # DB内を探し、既に保存されている場合はスキップ
        existing_spot = Spot.find_by(place_id: place_id)
        if existing_spot
          puts "既に保存済みです: #{spot['スポット名']}"
          return nil
        end

        # クエリパラメータの作成
        place_detail_query = URI.encode_www_form(
          place_id: place_id,
          language: 'ja',
          key: API_KEY
        )
        # リクエストURLの作成
        place_detail_url = "https://maps.googleapis.com/maps/api/place/details/json?#{place_detail_query}"
        # リクエストを送信してレスポンスを取得 (JSON形式)
        place_detail_page = URI.open(place_detail_url).read
        # JSONデータをパースしてRubyオブジェクトに変換
        place_detail_data = JSON.parse(place_detail_page)

        #取得したデータを保存するカラム名と同じキー名で、ハッシュ（result）に保存
        result = {}
        # 読み込むcsvファイルからスポット名を取得
        result[:name] = spot['スポット名']
        # place_detail_dataから取得したデータをresultに保存
        result[:postal_code] = place_detail_data['result']['address_components'].find { |c| c['types'].include?('postal_code') }&.fetch('long_name', nil)

        full_address = place_detail_data['result']['formatted_address'] # 住所を取得
        result[:address] = full_address.sub(/\A[^ ]+/, '') # 住所の先頭にある「国名」を削除

        result[:phone_number] = place_detail_data['result']['formatted_phone_number']
        result[:opening_hours] = place_detail_data['result']['opening_hours']['weekday_text'].join("\n") if place_detail_data['result']['opening_hours'].present?
        result[:web_site] = place_detail_data['result']['website']
        result[:rating] = place_detail_data['result']['rating']
        result[:latitude] = place_detail_data['result']['geometry']['location']['lat']
        result[:longitude] = place_detail_data['result']['geometry']['location']['lng']
        result[:place_id] = place_id
        result[:photo_reference] = place_detail_data['result']['photos'].first['photo_reference'] if place_detail_data['result']['photos'].present?

        result
      else
        puts "詳細情報が見つかりませんでした。"
        nil
      end
    end

    # csvファイルを読み込み、APIを利用して得たspotの詳細データをDBに保存
    csv_file = 'lib/spot.csv' # 読み込むcsvファイルのパス
    CSV.foreach(csv_file, headers: true) do |row| # csvファイルを1行ずつ読み込む
      spot_data = get_detail_data(row)
      if spot_data
          # カテゴリIDを取得してデータハッシュに追加
          spot_data.merge!(
            category_id: row['カテゴリID'].to_i
          )

        # スポットデータをDBに保存
        spot = Spot.create!(spot_data)
        puts "Spotを保存しました: #{row['スポット名']}"
        puts "----------"
      else
        puts "Spotの保存に失敗しました: #{row['スポット名']}"
      end
    end

  end
end