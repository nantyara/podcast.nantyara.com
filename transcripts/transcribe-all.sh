#!/bin/bash
# なんちゃラジオ全エピソードの文字起こしバッチ
# - transcripts/<id>.txt が既にあればスキップ（レジューム可能）
# - 実処理は transcribe-episode.sh に委譲
# 使い方: bash transcribe-all.sh [並列数(デフォルト2)]

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POSTS_DIR="$SCRIPT_DIR/../_posts"
PARALLEL="${1:-2}"
LOG="$SCRIPT_DIR/progress.log"

# _posts のファイル名（YYYY-MM-DD-<id>.md、id は 443 や sp014）からエピソードIDを抽出
ls "$POSTS_DIR" | sed -nE 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}-((sp)?[0-9]+)\.md$/\1/p' | sort | \
    xargs -P "$PARALLEL" -I {} bash "$SCRIPT_DIR/transcribe-episode.sh" {}

echo "$(date +%H:%M:%S) ALL_DONE ($(ls "$SCRIPT_DIR"/*.txt 2>/dev/null | wc -l | tr -d ' ') files)" >> "$LOG"
