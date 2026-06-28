#!/bin/bash
# macOS FileProvider安定化・Claude復活スクリプト

echo "=== FileProvider/メタデータ安定化＆同期強制ツール ==="

# 0. 【追加】Claude関連ファイルのローカル強制ダウンロード
# ※もしClaudeのCLIツールやプロジェクトがDropbox内にある場合、以下のパスを書き換えてください
CLAUDE_DIR="$HOME/Dropbox/path/to/your/claude-project"
if [ -d "$CLAUDE_DIR" ]; then
    echo "[0/5] Claude関連ファイルをローカルに強制同期（実体化）..."
    # xattrコマンドで「オンラインのみ」属性を解除し、fileproviderにダウンロードを要求
    find "$CLAUDE_DIR" -type f -exec vifs {} + 2>/dev/null 
    # もしくは単純にcatやfileコマンドで触って実体化を促す
    find "$CLAUDE_DIR" -type f -exec file {} + > /dev/null 2>&1
fi

# 1. メタデータサービス再起動
echo "[1/5] メタデータサービスを再起動..."
killall mds mds_stores mdbulkimport 2>/dev/null
sleep 2 # 少し長めに待つ

# 2. Spotlightキャッシュクリア
echo "[2/5] Spotlightキャッシュをクリア..."
rm -rf ~/Library/Caches/com.apple.Spotlight/* 2>/dev/null
killall Spotlight 2>/dev/null
sleep 2

# 3. FileProvider関連リセット＆再キック
echo "[3/5] FileProviderプロセスを安全に再起動..."
# -9 で殺すだけでなく、launchctlで明示的に再起動を促す方がmacOSのシステム上安全です
launchctl kickstart -k gui/$(id -u)/com.apple.FileProviderDaemon 2>/dev/null
killall DropboxFileProvider DropboxFileProviderCH 2>/dev/null
# システムが落ち着くまで3秒待つ
sleep 3

# 4. 【追加】Dropboxアプリ自体の同期プロセスの安定化を待つ
# ※FileProviderが死ぬとDropbox自体がハングすることがあるため、必要に応じて再起動
# killall Dropbox 2>/dev/null && open -a Dropbox

# 5. 状態確認
echo "[4/5] 現在のCPU使用率（落ち着いているか確認）:"
ps aux | grep -E "(fileprovider|FileProvider|mds)" | grep -v grep | awk '{printf "  %s: %.1f%% CPU\n", $11, $3}'

echo ""
echo "✓ 安定化完了"
echo "  少し待ってからClaudeをCLIで起動してみてください。"
