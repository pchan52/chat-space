# chat-space DB

## table list

- users
- messages
- groups
- group_users

### Users

column

name :string
email :string(devise)
password :string (devise)

association

has_many :group_users
has_many :groups, through: :group_users
has_many :messages


### Messages

column

body :text null: false
image :string
group_id :integer null: false
user_id :integer null: false

association

belongs_to :user
belongs_to :group

index

group_id
user_id

### Groups

column

group_name :string, null: false

association

has_many :users, through :group_users
has_many :group_users
has_many :messages

### Group_users

column

group_id :integer, null: false
user_id :integer, null: false

index

group_id
user_id

association

belongs_to :group
belongs_to :user


# Function list of ChatSpace

新規登録機能
1対1のチャット機能
複数人によるグループチャット機能
チャット相手の検索機能
チャットグループへのユーザー招待機能
チャットの履歴表示機能
画像送信機能
チャットの自動更新


# Step

## `step/01-markup`

- スタイル追加
- `Message` モデル, `messages` テーブル追加
- `/messages` にアクセスできる


## `step/02-messages`

- メッセージ投稿
- `Message`モデルにバリデーション設定
- Rspecインストール
  - `bundle exec rails g rspec:install`
  - `bundle exec rspec`
- locale設定によるエラーメッセージの日本語化


## `step/03-devise`

- `Devise`, `User` モデル導入
    - `bundle exec rails g devise:install`
- RspecにDevise用マクロ追加


## `step/04-chat_group`

- `ChatGroup`, `ChatGroupUser` モデル追加
- チャットグループの追加・更新
- `side_menu`の共通化


## `step/05-incremental_search`

- jQuery導入
- チャットグループ設定時にインクリメンタルサーチ


## `step/06-async_messages`

- メッセージ投稿の非同期化


## `step/07-image_upload`

- 画像投稿
  - `carrierwave`導入


## `step/08-auto_reload`

- 自動再読み込み
