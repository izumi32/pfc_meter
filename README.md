# PFC Meter
URL: http://35.75.29.135/

食事のカロリー管理ツールです。  
1日の目標カロリーを設定し、食べた食事を記録していきます。  
食材のカロリーを手入力、もしくはデータベースから検索して登録することができます。  

## 使い方

1.  ユーザー登録後、「食材登録」をクリック  
![readme1](https://user-images.githubusercontent.com/74642678/124723783-56afd200-df46-11eb-851f-714d88bb9198.png)

    - データベースから登録する場合  
        - 食材名を入力し「検索」をクリック  
        ![readme2](https://user-images.githubusercontent.com/74642678/124723904-7515cd80-df46-11eb-9f8c-061b79298812.png)

        - 「登録」をクリック  
        ![readme3](https://user-images.githubusercontent.com/74642678/124741637-e2315f00-df56-11eb-9259-516161e1626c.png)

    - 手入力の場合  
       - 食材の情報を入力し「登録」をクリック  
       ![readme6](https://user-images.githubusercontent.com/74642678/124737286-c4fa9180-df52-11eb-88f7-36001a351326.png)

2. 「目標カロリー設定」をクリック  
    目標値を入力し「登録」をクリック  
    ![readme4](https://user-images.githubusercontent.com/74642678/124724265-d3db4700-df46-11eb-8649-83b2c4ddbc1d.png)

## 使用技術

![インフラ](https://user-images.githubusercontent.com/74642678/126076565-271a0a50-513a-4934-80e5-a65602697a54.jpg)

- Ruby 2.6.6
- Ruby on Rails 6.1.3
- MySQL 8.0.23
- AWS
  - VPC
  - EC2
- Docker/Docker-compose
- CircleCi CI/CD
- RSpec
- Oracle APEX API

## 機能一覧

- ユーザー登録、ログイン機能(devise)
- 登録機能
- 検索機能(Oracle APEX API)

## テスト

- RSpec
  - 単体テスト(model)
  - 機能テスト(request)
  - 統合テスト(feature)
