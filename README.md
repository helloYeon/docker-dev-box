# docker-dev-box

RedHat系（Rocky Linux）および Debian系（Ubuntu）ベースの開発環境を迅速に構築しさまざまな環境・ツールの検証やテストを行うため

## 構成

```
docker-dev-box/
├── rocky/
│   └── Dockerfile       # Rocky Linux 用 Dockerfile
├── ubuntu/
│   └── Dockerfile       # Ubuntu 用 Dockerfile（※今後追加予定）
├── Makefile             # コンテナ操作用コマンド群
└── README.md
```


## 今後の予定

- Ubuntu/Debian 対応イメージの追加
- 共通の.env設定ファイル対応
- VisualStudio Code用devcontainer設定の追加

## ライセンス

MIT