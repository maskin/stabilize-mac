# stabilize-mac

macOS FileProvider安定化・Claude復活スクリプト / macOS FileProvider Stabilization & Claude Recovery Script

## 概要 / Overview

[ja]
このスクリプトは、macOSのFileProviderメタデータの問題を解決し、クラウド同期ファイル（Dropbox等）との連携を安定化させます。

[en]
This script resolves FileProvider metadata issues on macOS and stabilizes integration with cloud-synced files (Dropbox, etc.).

## 機能 / Features

[ja]
- メタデータサービス（mds）の再起動
- Spotlightキャッシュのクリア
- FileProviderプロセスの安全な再起動
- Dropbox FileProviderの安定化
- Claude関連ファイルのローカル強制同期（オプション）

[en]
- Restart metadata services (mds)
- Clear Spotlight cache
- Safe restart of FileProvider processes
- Stabilize Dropbox FileProvider
- Force local sync of Claude-related files (optional)

## 使い方 / Usage

```bash
# Download / スクリプトをダウンロード
curl -O https://raw.githubusercontent.com/maskin/stabilize-mac/main/stabilize_mac.sh

# Make executable / 実行権限を付与
chmod +x stabilize_mac.sh

# Run / 実行
./stabilize_mac.sh
```

## 注意事項 / Notes

[ja]
- このスクリプトはシステムプロセスを再起動します
- 実行中は一時的にファイル同期が中断される可能性があります
- Claudeプロジェクトのパスが必要な場合は、スクリプト内の `CLAUDE_DIR` を編集してください

[en]
- This script restarts system processes
- File synchronization may be temporarily interrupted during execution
- Edit `CLAUDE_DIR` in the script if your Claude project path is different

## ライセンス / License

MIT License

## 作者 / Author

maskin
