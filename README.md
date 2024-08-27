# ■　サービス名：LearnLocator

## ■　サービスのURL

## ■　サービス概要
- 家以外で勉強できる場所(候補は「自習室」と「コワーキングスペース」)を検索できる。
- 住所や施設のタイプから、勉強場所を検索することができる。
- 現在の位置情報から、近くの勉強場所を探すことができる。

## ■　このサービスへの思い・作りたい理由
- 家では勉強に集中できない等の理由で、勉強できる場所を探すことがあるから。
- 一口に勉強場所といっても、情報がありふれていて「どんな施設があるのか」や「どんな施設が自分に合っているのか」がわかりにくいと感じるから。

## ■　ユーザー層について
- 家以外の施設で勉強をする学生や社会人
- 自分に合った勉強場所を探している人
- これから自習室やコワーキングスペースを契約しようと思っている人

## ■　サービスの利用イメージ
### ユーザー登録不要・ログイン無しでできること
- 地域や施設のタイプを指定して勉強場所を検索。或いは、現在の位置情報から近くの勉強場所を検索。
- 施設の詳細情報の取得(営業時間や電話番号など)
- 現在地から施設までの経路情報取得
- 施設に関する口コミの確認
- 勉強場所情報のXシェア
- 勉強場所(自習室とコワーキングスペース)の違い説明ページの閲覧

### ユーザー登録・ログイン後にできること
- マイページの表示
- 施設のブックマーク登録
- 口コミ投稿・編集・削除
- 口コミのXシェア
- 口コミへのいいね

## ■　ユーザーの獲得について
- Xでの告知
- 勉強場所のXシェア
- 口コミのXシェア
- 技術記事執筆

## ■　サービスの差別化ポイント・推しポイント
類似サービスとして以下のサービスが挙げられますが、コワーキングスペースのみを対象とした検索サイトであり、自習室も含めた勉強場所探しができるアプリは存在しないです。  
- [Coworking hub](https://www.coworking-hub.com/)

また、一般的には運営会社ごとの施設情報の提供にとどまっており、ユーザーが施設比較しにくい状態にあると思われます。例として、以下のサービスは一運営会社の提供するコワーキングスペースの情報検索サービスになります。  
- [いいオフィス](https://e-office.space/)

以上を踏まえて、差別化ポイントは下記内容になります。
- 施設の違いを利用者が把握した上で、自身のニーズに合った勉強場所（自習室、コワーキングスペース）を見つけることができる。
- 施設の一覧表示・口コミ機能の導入により、各施設を比較しやすくできる。
- 外部の勉強場所（自習室、コワーキングスペース）の情報を取りまとめ、場所を探す負担を軽減できる。
- 「なんとなく家以外で勉強してみたい」状態から、「勉強場所を決め、そこに行くまで」をサポートできる。

## ■　機能候補
### MVPリリース
- レスポンシブ対応
- ユーザー登録機能
- ログイン・ログアウト機能
- 周辺の勉強場所リサーチ(場所検索)
  - 現在地を取得し、現在地周辺の勉強場所を取得
  - 地図の表示
  - 検索窓設置（マップの表示位置も検索窓への入力値に対応するように遷移）
- 勉強場所詳細
  - 「勉強場所の詳細情報」の取得・表示（あらかじめDBに保存）
    - 勉強場所の「名前/画像/住所/営業時間/電話番号/公式HPリンク/Googleレビューの評価」
  - 「ここへ行く」ボタン押下でGoogle Mapに遷移し、経路情報を表示

### 本リリース
- 勉強場所一覧(一覧検索)
  - 検索機能（カテゴリー(自習室/コワーキングスペース)・地域・施設名）
- 勉強場所詳細
  - ブックマーク登録機能
  - 口コミ投稿機能（編集・削除機能は投稿主のみ許可）
  - 口コミに対する「いいね」機能
- マイページ
  - 自身の投稿した口コミ一覧
  - 「いいね」した口コミ一覧
- ブックマーク登録した勉強場所の一覧
- 勉強場所(自習室とコワーキングスペース)の違い説明ページの表示
- Googleログイン
- Xシェア
  - 勉強場所のXシェア
  - 口コミのXシェア
- 【できたら】 PWAによる擬似モバイルアプリ化
- 【できたら】 検索機能のオートコンプリート化


## ■　機能の実装方針予定

### 使用技術
| カテゴリ        | 技術スタック                                                                                                                                      | 
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | 
| フロントエンド  | HTML / CSS / JavaScript / Tailwind CSS (＋daisyUI)　                                                                                                           | 
| バックエンド    | 	Ruby 3.2.3 / Ruby on Rails 7.1.3.4                                                                                                               | 
| データベース    | PostgreSQL                                                                                                                                        | 
| 認証            | Sorcery, Omniauth                                                                                                                                  | 
| API             | Google Geolocation API / Google Geocoding API / Google Maps JavaScript API / Google Places API                                                    | 
| 環境構築        | Docker                                                                                                                                            | 
| CI/CD           | 	GitHub Actions                                                                                                                                   | 
| インフラ        | Render / Amazon S3                                                                                                                                | 
| その他(gemなど) | google_places / gon / geokit-rails / geocoder / ransack / active_hash / kaminari / carrierwave / redis-rails / puma_worker_killer / dotenv-rails  | 

### 画面遷移図
Figma：  
https://www.figma.com/design/jEObdmmCqTXRWpQH72SY9A/LearnLocator_%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=Yrjiy1yTzEVb3e65-1

### ER図
mermaidchart:  
https://www.mermaidchart.com/raw/b6d7e76d-8d55-429f-98b9-ca6ed3a8d236?theme=dark&version=v0.1&format=svg
