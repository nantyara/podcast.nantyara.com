#!/bin/bash
# 新エピソード mp3 を Cloudflare R2 (files.nantyara.com) にアップロードする
# 旧 rsync.sh (nantyara サーバへの rsync) の後継。2026-07-06 の R2 移行に伴い変更
# 認証: ~/.secrets/rclone-r2-nantyara.env (nantyara の ~/.config/rclone-r2.env と同内容)
# 使い方: ./sync.sh          → up/ 全体の未アップロード分を転送
#         ./sync.sh <file>   → 指定ファイルだけ転送
set -euo pipefail
eval "$(cat ~/.secrets/rclone-r2-nantyara.env)"
exec rclone copy --ignore-existing --exclude .DS_Store -v \
  "${1:-$HOME/Music/なんちゃラジオ/up/}" r2:nantyara-files
