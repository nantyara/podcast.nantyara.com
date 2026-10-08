#!/bin/bash
# 1エピソード分の文字起こし: 音声DL → ElevenLabs Scribe v2 → txt
# 使い方: bash transcribe-episode.sh <episode-id>   (例: 443, sp014)
# transcripts/<id>.txt が既にあれば何もせず正常終了（レジューム可能）
# 要 ELEVENLABS_API_KEY（環境変数）

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP_DIR="$SCRIPT_DIR/tmp"
LOG="$SCRIPT_DIR/progress.log"

id="${1:?usage: transcribe-episode.sh <episode-id>}"
out="$SCRIPT_DIR/$id.txt"

[[ -s "$out" ]] && exit 0

mkdir -p "$TMP_DIR"
mp3="$TMP_DIR/$id.mp3"

if ! curl -sf -o "$mp3" "https://files.nantyara.com/$id.mp3"; then
    echo "$(date +%H:%M:%S) $id DOWNLOAD_FAILED" >> "$LOG"
    exit 1
fi

if ruby "$SCRIPT_DIR/../scripts/eleven_transcribe.rb" "$mp3" "$out" && [[ -s "$out" ]]; then
    echo "$(date +%H:%M:%S) $id OK" >> "$LOG"
    rm -f "$mp3"
else
    echo "$(date +%H:%M:%S) $id ELEVENLABS_FAILED" >> "$LOG"
    rm -f "$mp3"
    exit 1
fi
