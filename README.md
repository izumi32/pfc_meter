caching_sha2_passwordをmysql_native_passwordに書き換え
コンテナ再起動
コンテナ再構築
practice_dir_testをcreate

$ docker-compose run --rm web rake db:create    
$ docker-compose run web bin/rails db:migrate RAILS_ENV=test 
