# タスク管理App with Ruby on Rails on Docker


## Versions
- Ruby on Rails [![Gem Version](https://badge.fury.io/rb/rails.svg)](https://badge.fury.io/rb/rails)

- rubocop [![Gem Version](https://badge.fury.io/rb/rubocop.svg)](https://badge.fury.io/rb/rubocop)


## Installation

[Docker for Mac, Docker for Windows](https://www.docker.com/products/docker-desktop)

dockerコマンド、docker-machineコマンド、docker-composeコマンド全部入り

In case of Mac, You can also use Homebrew
```bash
$ brew install docker
$ brew cask install docker
```


## Initial Setting

[環境構築の参考](./README_origin.md)

### 起動
```bash
$ docker-compose build
$ docker-compose up -d    # -d:バックグラウンド起動
```
> `app`, `node`, `db`, `selenium_chrome` のコンテナが起動
> M1 Macの場合、node設定内に `platform: linux/amd64` の追記が必要

起動したら[こちら](localhost/login)からローカルアクセスできる。

### 接続
```bash
$ docker exec -it app bash    # -it:いつものコンソールとしてアクセスするためのオプション

# railsコンテナアクセス後、初期データを導入
app% rails db:seed
```

## 機能

### ユーザー管理

- 名前
- メールアドレス
- パスワード

ユーザーを新規に作成した場合は一般ユーザー権限なので、管理ユーザーから権限付与してください。
> 最悪`rails console`から直接ユーザーデータを`update_attribute(:admin, true)`で更新してもいい

ログイン状態はブラウザ終了までCookieに保存される仕様です。許可してください。

### タスク管理

- タイトル
- 詳細
- 進捗
- 〆切日時
- 優先度
- ラベル

> ラベルはタスク編集画面から新規登録や一覧画面に移動できる。