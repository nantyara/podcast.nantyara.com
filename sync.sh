#!/bin/bash
# 新エピソード mp3 を Cloudflare R2 (files.nantyara.com) にアップロードする
# 旧 rsync.sh (nantyara サーバへの rsync) の後継。2026-07-06 の R2 移行に伴い変更
# 認証: ~/.secrets/rclone-r2-nantyara.env (nantyara の ~/.config/rclone-r2.env と同内容)
# 使い方: ./sync.sh             → up/ 全体の未アップロード分を転送
#         ./sync.sh <file>      → 指定ファイルだけ転送
#         ./sync.sh -f [<file>] → R2 に既にあっても上書き（ID3 タグ修正後の再アップ等）
set -euo pipefail

ignore_existing=(--ignore-existing)
if [[ "${1:-}" == "-f" || "${1:-}" == "--force" ]]; then
  ignore_existing=()
  shift
fi

eval "$(cat ~/.secrets/rclone-r2-nantyara.env)"
exec rclone copy ${ignore_existing[@]+"${ignore_existing[@]}"} --exclude .DS_Store --s3-no-check-bucket -v \
  "${1:-$HOME/Music/なんちゃラジオ/up/}" r2:nantyara-files
