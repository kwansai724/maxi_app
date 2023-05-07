# MaxiApp

## 環境（バージョン）
- Ruby：3.1.4
- Rails：7.0.4
- mysql：8.0

## テーブル定義書
https://docs.google.com/spreadsheets/d/13E79jGzrbywxQ0rPntmiNWIKiUAm9rp2F1KJPe4HlCQ/edit#gid=763515332

### ログ出力
```
# railsが動いてるコンテナのIDを確認
docker ps
docker attach コンテナのID
```

### お出かけ情報取り込み
```
dce api rake import:going_outs
```
