# stabilize-mac

macOS FileProvider安定化・Claude復活スクリプト

## 概要

このスクリプトは、macOSのFileProviderメタデータの問題を解決し、クラウド同期ファイル（Dropbox等）との連携を安定化させます。

## 機能

- メタデータサービス（mds）の再起動
- Spotlightキャッシュのクリア
- FileProviderプロセスの安全な再起動
- Dropbox FileProviderの安定化
- Claude関連ファイルのローカル強制同期（オプション）

## 使い方

```bash
# スクリプトをダウンロード
curl -O https://raw.githubusercontent.com/maskin/stabilize-mac/main/stabilize_mac.sh

# 実行権限を付与
chmod +x stabilize_mac.sh

# 実行
./stabilize_mac.sh
```

## 注意事項

- このスクリプトはシステムプロセスを再起動します
- 実行中は一時的にファイル同期が中断される可能性があります
- Claudeプロジェクトのパスが必要な場合は、スクリプト内の `CLAUDE_DIR` を編集してください

## ライセンス

MIT License

## 作者

maskin
