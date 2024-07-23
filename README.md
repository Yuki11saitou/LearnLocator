# ■　サービス名：LearnLocator

## ■　サービスのURL

## ■　サービス概要
- 家以外で勉強できる場所を検索できる。
- 勉強場所の候補は(1)カフェ、(2)自習室、(3)コワーキングスペースが対象で、診断機能によって利用者が(1)~(3)の中から自分に合った場所を検索できる。
- 地域や施設のタイプを選択して、勉強場所を検索することができる。
- 現在の位置情報から、近くの勉強場所の一覧を見ることができる。

## ■　このサービスへの思い・作りたい理由
- 家では勉強に集中できない等の理由で、勉強できる場所を探すことがあるから。
- 一口に勉強場所といっても、情報がありふれていて「どんな施設があるのか」や「どんな施設が自分に合っているのか」がわかりにくいと感じるから。

## ■　ユーザー層について
- 家以外の施設で勉強をする学生や社会人
- 自分に合った勉強場所を探している人
- これから自習室やコワーキングスペースを契約しようと思っている人

## ■　サービスの利用イメージ
### ユーザー登録不要・ログイン無しでできること
- 地域や施設のタイプでフィルタリングして勉強場所を検索。或いは、現在の位置情報から近くの勉強場所を検索。
- 勉強場所情報のXシェア
- 学習スタイルに関する診断を受けることで、勉強場所の提案を受けることが可能。(カフェ、自習室、コワーキングスペース　のどれを探すべきか)

#### 診断内容について
<details><summary>質問内容</summary>
診断は、ステップ入力形式で5問回答していただく想定です。  

| 質問No | 質問                            | 回答の選択肢  | 
| ------ | ------------------------------- | ------------- | 
| 1      | 広い作業スペースが欲しい        | はい / いいえ | 
| 2      | 発話・会話する                  | はい / いいえ | 
| 3      | PC作業を伴う                    | はい / いいえ | 
| 4      | 長時間勉強したい（目安：2時間） | はい / いいえ | 
| 5      | 一定期間通いたい（例：1ヶ月間） | はい / いいえ | 
</details>
<details><summary>診断の方法</summary>
下記のように質問の回答ごとに点数化し、合計点数が最大のものを提案します。  
２問目のみ、回答の重要度が高いため点数の重み付けをしています。　　

| 質問No | 質問                            | 回答の選択肢 | カフェ | 自習室 | コワーキング | 
| ------ | ------------------------------- | ------------ | ------ | ------ | ------------ | 
| 1      | 広い作業スペースが欲しい        | はい         | 0      | 1      | 1            | 
|        |                                 | いいえ       | 1      | 0      | 0            | 
| 2      | 発話・会話する                  | はい         | 5      | 0      | 5            | 
|        |                                 | いいえ       | 0      | 1      | 0            | 
| 3      | PC作業を伴う                    | はい         | 1      | 0      | 1            | 
|        |                                 | いいえ       | 1      | 1      | 0            | 
| 4      | 長時間勉強したい(目安：2時間)   | はい         | 0      | 1      | 1            | 
|        |                                 | いいえ       | 1      | 0      | 0            | 
| 5      | 1ヶ月間など、まとまって通いたい | はい         | 0      | 1      | 1            | 
|        |                                 | いいえ       | 1      | 0      | 0            | 
</details>
<details><summary>診断結果(全パターン)</summary>

```
パターン 1: はい, はい, はい, はい, はい => 提案施設: コワーキングスペース
パターン 2: はい, はい, はい, はい, いいえ => 提案施設: コワーキングスペース
パターン 3: はい, はい, はい, いいえ, はい => 提案施設: コワーキングスペース
パターン 4: はい, はい, はい, いいえ, いいえ => 提案施設: カフェ
パターン 5: はい, はい, いいえ, はい, はい => 提案施設: コワーキングスペース
パターン 6: はい, はい, いいえ, はい, いいえ => 提案施設: カフェ / コワーキングスペース
パターン 7: はい, はい, いいえ, いいえ, はい => 提案施設: カフェ / コワーキングスペース
パターン 8: はい, はい, いいえ, いいえ, いいえ => 提案施設: カフェ
パターン 9: はい, いいえ, はい, はい, はい => 提案施設: 自習室 / コワーキングスペース
パターン 10: はい, いいえ, はい, はい, いいえ => 提案施設: 自習室 / コワーキングスペース
パターン 11: はい, いいえ, はい, いいえ, はい => 提案施設: 自習室 / コワーキングスペース
パターン 12: はい, いいえ, はい, いいえ, いいえ => 提案施設: カフェ
パターン 13: はい, いいえ, いいえ, はい, はい => 提案施設: 自習室
パターン 14: はい, いいえ, いいえ, はい, いいえ => 提案施設: 自習室
パターン 15: はい, いいえ, いいえ, いいえ, はい => 提案施設: 自習室
パターン 16: はい, いいえ, いいえ, いいえ, いいえ => 提案施設: カフェ / 自習室
パターン 17: いいえ, はい, はい, はい, はい => 提案施設: コワーキングスペース
パターン 18: いいえ, はい, はい, はい, いいえ => 提案施設: カフェ
パターン 19: いいえ, はい, はい, いいえ, はい => 提案施設: カフェ
パターン 20: いいえ, はい, はい, いいえ, いいえ => 提案施設: カフェ
パターン 21: いいえ, はい, いいえ, はい, はい => 提案施設: カフェ / コワーキングスペース
パターン 22: いいえ, はい, いいえ, はい, いいえ => 提案施設: カフェ
パターン 23: いいえ, はい, いいえ, いいえ, はい => 提案施設: カフェ
パターン 24: いいえ, はい, いいえ, いいえ, いいえ => 提案施設: カフェ
パターン 25: いいえ, いいえ, はい, はい, はい => 提案施設: 自習室 / コワーキングスペース
パターン 26: いいえ, いいえ, はい, はい, いいえ => 提案施設: カフェ
パターン 27: いいえ, いいえ, はい, いいえ, はい => 提案施設: カフェ
パターン 28: いいえ, いいえ, はい, いいえ, いいえ => 提案施設: カフェ
パターン 29: いいえ, いいえ, いいえ, はい, はい => 提案施設: 自習室
パターン 30: いいえ, いいえ, いいえ, はい, いいえ => 提案施設: カフェ / 自習室
パターン 31: いいえ, いいえ, いいえ, いいえ, はい => 提案施設: カフェ / 自習室
パターン 32: いいえ, いいえ, いいえ, いいえ, いいえ => 提案施設: カフェ
```
</details>

### ユーザー登録・ログイン後にできること
- マイページの表示
- 施設のお気に入り登録
- レビュー投稿・編集・削除
- レビューのXシェア
- レビューへのいいね、コメント

## ■　ユーザーの獲得について
- Xでの告知（できれば専用アカウントを作成して告知）
- 勉強場所のXシェア
- レビューのXシェア
- Qiitaで技術記事執筆

## ■　サービスの差別化ポイント・推しポイント
類似サービスとして以下のサービスが挙げられますが、コワーキングスペースのみを対象とした検索サイトであり、「様々な学習スタイルに合った勉強場所探し」ができるアプリは存在しないです。  
- [Coworking hub](https://www.coworking-hub.com/)

また、一般的には運営会社ごとの施設情報の提供にとどまっており、ユーザーが施設比較しにくい状態にあると思われます。例として、以下のサービスは一運営会社の提供するコワーキングスペースの情報検索サービスになります。  　　
- [いいオフィス](https://e-office.space/)

以上を踏まえて、差別化ポイントは下記内容になります。
- 利用者のニーズに合った勉強場所（カフェ、自習室、コワーキングスペース）を診断・提案することが可能。
- 施設の一覧表示・レビュー機能の導入により、各施設を比較しやすくできる。
- 外部の勉強場所（カフェ、自習室、コワーキングスペース）の情報を取りまとめ、場所を探す負担を軽減できる。
- 「なんとなく家以外で勉強してみたい」状態から、「勉強場所を決め、そこに行くまで」をサポートできる。

## ■　機能候補
### MVPリリース
- レスポンシブ対応
- ユーザー登録機能
- ログイン・ログアウト機能
- 周辺の勉強場所リサーチ
  - Google Geolocation APIで現在地取得し、現在地から10km圏内の勉強場所を取得
  - Google Maps JavaScript APIで地図表示
- 勉強場所一覧
  - 検索機能（　カテゴリー[カフェ/自習室/コワーキングスペース]・地域・フリーワード　）
- 勉強場所詳細
  - Google Places APIで「勉強場所の詳細情報」の取得・表示（あらかじめDBに保存）　[**＊1**]
    - 勉強場所の　名前/住所/営業時間/電話番号/公式HPリンク　
  - Google Maps JavaScript APIで地図表示
  - 「ここへ行く」ボタン押下でGoogleMapに遷移し、ナビゲーションまたは乗換案内ページを表示
  - ブックマーク登録機能
  - レビュー投稿機能（編集・削除機能は投稿主のみ許可）
  - レビューに対する「いいね」と「コメント」機能
- マイページ
  - ブックマーク登録した勉強場所の一覧
  - 自身の投稿したレビュー一覧
  - 「いいね」したレビュー一覧

### 本リリース
- 勉強場所の診断機能
- Googleログイン
- 検索機能
  - オートコンプリート
- Xシェア
  - 勉強場所のXシェア
  - レビューのXシェア
- 【できたら】 PWAによる擬似モバイルアプリ化
- 【できたら】 「周辺の勉強場所リサーチ」ページに検索窓設置（マップの表示位置も検索窓への入力値に対応するように遷移）

### 懸念点
＊1 : seeds.rbに登録するデータに関して、勉強場所が「カフェ」の場合は店舗数が膨大になるため、チェーン店のみの登録になる可能性がある。

## ■　機能の実装方針予定

### 使用技術
| カテゴリ        | 技術スタック                                                                                                                                      | 
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- | 
| フロントエンド  | HTML / CSS / JavaScript / Tailwind CSS                                                                                                            | 
| バックエンド    | 	Ruby 3.2.3 / Ruby on Rails 7.1.3.4                                                                                                               | 
| データベース    | PostgreSQL                                                                                                                                        | 
| 認証            | Devise, Omniauth                                                                                                                                  | 
| API             | Google Geolocation API / Google Geocoding API / Google Maps JavaScript API / Google Places API                                                    | 
| 環境構築        | Docker                                                                                                                                            | 
| CI/CD           | 	GitHub Actions                                                                                                                                   | 
| インフラ        | Render / Amazon S3                                                                                                                                | 
| その他(gemなど) | google_places / gon / geokit-rails / geocoder / ransack / active_hash / kaminari / carrierwave / redis-rails / puma_worker_killer / dotenv-rails  | 

### 画面遷移図
Figma：
https://www.figma.com/design/jEObdmmCqTXRWpQH72SY9A/LearnLocator_%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=Yrjiy1yTzEVb3e65-1

### ER図
