# LearnLocator - 勉強場所検索サービス -

### サービスURL : https://www.learn-locator.com

<img src="https://i.gyazo.com/519b19ef929e67ddbfafb8e564683bd3.png" alt="Image from Gyazo"/>

## サービス概要
- 家以外で勉強できる場所(「自習室」と「コワーキングスペース」)を検索できるサービスです。
- 現在の位置情報から、近くの勉強場所を探すことができます。
- 住所や施設のタイプから、勉強場所を検索することができます。
- 施設に対する口コミから、勉強場所を検索することができます。
- ログインをすると、施設のブックマーク、口コミの投稿・いいねができるようになります。

## このサービスへの思い・作成した理由
-	開発者である私自身が、「勉強する際に家では集中できない」と思っており、自習室やコワーキングスペースをネット検索で調査していたのですが、「もう少し簡単に調べられるアプリケーションが欲しい」と感じたのがサービス作成のきっかけでした。
- また、下記のような課題を感じ、それを改善できるサービス作成をすることを決めました。
  - そもそも自習室とコワーキングスペースの違いがわからず、利用する前にハードルを感じていたこと。
  - 自習室とコワーキングスペースの情報を一元管理しているようなサービスが見当たらなかったこと。
  - 施設ごとにHPが乱立しており、各施設の情報に辿り着くまでに手間がかかること。
  - 利用者の生の声(口コミ)は、Google Mapのレビューなどを見に行かないと確認できないこと。
  - 「興味がある」と感じた施設についても、別途Google Mapなどで経路情報を調べる手間があること。

## ユーザー層
- 家以外の施設で勉強をする学生や社会人
- 自分に合った勉強場所を探している人
- これから自習室やコワーキングスペースを利用しようと思っている人

## サービスの利用イメージ
### メイン機能(ユーザー登録不要)
|                                                                                                          |                                                                                                          | 
| :------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------- | 
| (1) 場所検索                                                                                                 | (2) 一覧検索                                                                                                 | 
| <img src="https://i.gyazo.com/4164b0da4f85d187c34373b0cd1fc6a1.gif" alt="Image from Gyazo"/> | <img src="https://i.gyazo.com/82b4f5844dc1459e2756a71022cde53e.gif" alt="Image from Gyazo"/> | 
| 現在地近くの勉強場所がわかります。<br>地名などから周辺の場所を検索することもできます。                   | 口コミの一覧から条件を設定し検索できます。<br>結果の並べ替えも可能です。                                 | 

|                                                                                                          |                                                                                                          | 
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | 
| (3) 口コミ検索                                                                                               | (4) 施設情報の確認                                                                                           | 
| <img src="https://i.gyazo.com/615afa46380fc2686519ea6912ab224e.gif" alt="Image from Gyazo"/> | <img src="https://i.gyazo.com/a53b0e31de95b99e6432fb8da7dd630d.gif" alt="Image from Gyazo"/> | 
| 勉強場所の口コミを検索できます。<br>他のユーザーが投稿した口コミを閲覧できます。                         | 口コミ・施設情報の確認のほか、<br>経路情報も確認できます。                                               | 

### サブ機能(ユーザー登録必要)
|                                                                                                          |                                                                                                             | 
| -------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | 
| (5) ブックマーク<br>                                                                                     | (6) 口コミ投稿                                                                                              | 
| <img src="https://i.gyazo.com/e1f9e33e553c15b7f72eb63de2d074b3.gif" alt="Image from Gyazo"/> | <img src="https://i.gyazo.com/67b7613d3c0cc31ea93cb3c08b88df1a.gif" alt="Image from Gyazo"/>    | 
| 施設のブックマークを登録できます。                                                                       | 口コミを投稿できます。<br>投稿したことをXでシェアできます。<br>投稿した口コミはマイページから確認できます。 | 

|                                                                                                          |                                                                                                          | 
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | 
| (7) 口コミへのいいね                                                                                     | (8) マイページ                                                                                           | 
| <img src="https://i.gyazo.com/3dfe5741323094769521aa4255ac79a3.gif" alt="Image from Gyazo"/> | <img src="https://i.gyazo.com/ceb2e8c89660190242fdea4e2dd63453.gif" alt="Image from Gyazo"/> | 
| 口コミへのいいねができます。<br>いいねした口コミはマイページから確認できます。                           | マイページで「ユーザー情報の編集・退会」や「投稿・いいねした口コミ」の確認ができます。                   | 

## ユーザーの獲得について
主に下記の項目によって、ユーザーの獲得を図ります。
- Xでの告知
  - 開発者である私が、Xアカウントでの告知を行います。
- 勉強場所のXシェア・口コミのXシェア
  - 勉強場所・口コミのXシェア機能により、Xユーザーの流入を促進します。
  - OGP画像を設定することで、目に留まりやすく、リンクをクリックしてもらいやすくしています。
- 技術記事執筆
  - Qiitaでの技術記事執筆により、記事経由での利用者の流入を図ります。
- SEO対策
  - サイトマップの作成・登録により、Google検索で表示されやすくします。

## サービスの差別化ポイント・推しポイント
【比較したサービス(1)】コワーキングスペースの検索サイト : [Coworking hub](https://www.coworking-hub.com/)  

<差別化ポイント>
- コワーキングスペースに加え、自習室も含めた勉強場所探しができる点
- 施設の口コミによる検索ができる点(口コミの数、口コミへのいいね数などでの絞り込みも可能)
- 施設の公式HPへのリンクも掲載している点(定期契約などで、一次情報を確認する際などに必要)
- ユーザー登録の際、Googleアカウント認証で簡単に登録できる点
- 施設のブックマーク機能も備えている点
- PWA(プログレッシブウェブアプリ)対応しており、ユーザーがホーム画面に追加してネイティブアプリのように利用できる点

【比較したサービス(2)】一運営会社の提供するコワーキングスペースの情報検索サービス : [いいオフィス](https://e-office.space/)  

<差別化ポイント>
- コワーキングスペースに加え、自習室も含めた勉強場所探しができる点
- 運営会社ごとの施設情報の提供にとどまらず、様々な施設を掲載している点(ユーザーが施設比較しやすくなる)
- 施設の口コミによる検索ができる点(口コミの数、口コミへのいいね数などでの絞り込みも可能)
- ユーザー登録の際、Googleアカウント認証で簡単に登録できる点
- ログインの際、Googleアカウント認証で簡単にログインできる点

## 機能一覧
【ユーザー登録・ログイン関係】
- メールアドレスとパスワードによるユーザー登録機能
- パスワードによるログイン機能(オートログイン)
- Google認証によるユーザー登録・ログイン機能
- パスワードリセット機能
- ログアウト機能

【メイン機能(ユーザー登録不要)】
- (1) 場所検索
  - 現在地を取得し、周辺施設をマップ表示
  - 検索欄設置（マップの表示位置も入力値に対応して移動）
  - マーカーのクリックで施設情報をモーダル表示
- (2) 一覧検索
  - 「施設名」「地域」「施設の種類」での施設情報の絞り込み
    - 「施設名」のオートコンプリート
  - 「口コミ数」「googleレビュー」でのソート
- (3) 口コミ検索
  - 「施設名」「ユーザー名」「投稿内容」で口コミ検索
    - 「施設名」のオートコンプリート
  - 「投稿日」「いいね数」でのソート
  - ユーザーアイコンをクリックで、「投稿数」や「いいねした数」を表示
- (4) 施設情報表示(上記(1),(2),(3)から遷移)
  - 詳細情報(営業時間、公式HPリンク、位置情報など)表示
    - 「ここへ行く」でGoogle Mapの経路情報画面に遷移
    - 施設情報のXシェア
  - 口コミ表示
    - ユーザーアイコンをクリックで、「投稿数」や「いいねした数」を表示

【サブ機能(ユーザー登録必要)】
- (5) ブックマーク
  - ブックマーク登録・削除(上記(1),(2),(4)の画面)
  - 「ブックマーク一覧画面」の表示
- (6) 口コミ投稿
  - 口コミ投稿・編集・削除(上記(4)の画面)
  - 入力文字数のリアルタイム表示
  - 口コミのXシェア
- (7) 口コミへのいいね
  - 口コミへの「いいね」の登録・削除(上記(3),(4)の画面)
- (8) マイページ
  - プロフィール編集
    - 「名前」「メールアドレス」「アイコン」の変更
  - 退会機能
  - 「投稿した口コミ」「いいねした口コミ」の表示

【その他】
- お問い合わせフォーム
- 利用規約
- プライバシーポリシー
- トップページに使用方法や「自習室」「コワーキングスペース」の違いなどを表示
- ヘッダーにQRコード表示でスマホからの利用を誘導
- 未ログイン者がログイン必要な機能に触れると「ログイン誘導モーダル」表示
- 存在しないURLに対するエラーハンドリング(idを含むもの・その他)
- PWA対応
- SEO対策

## 技術スタック

| カテゴリ       | 技術スタック                                                              | 
| -------------- | ------------------------------------------------------------------------- | 
| フロントエンド | Rails 7.1.3.4 (Hotwire/Turbo/Stimulus), JavaScript, Tailwind CSS, daisyUI | 
| バックエンド   | Rails 7.1.3.4 (Ruby 3.2.3)                                                | 
| データベース   | PostgreSQL                                                                | 
| インフラ       | Render.com, Amazon S3                                                     | 
| 開発環境       | Docker                                                                    | 
| 認証           | Sorcery, Googleログイン                                                   | 
| API            | Google Maps API, Google Places API                                        | 

### 画面遷移図
Figma：  
https://www.figma.com/design/jEObdmmCqTXRWpQH72SY9A/LearnLocator_%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0-1&t=Yrjiy1yTzEVb3e65-1

### ER図
mermaidchart:  
https://www.mermaidchart.com/raw/b6d7e76d-8d55-429f-98b9-ca6ed3a8d236?theme=dark&version=v0.1&format=svg


