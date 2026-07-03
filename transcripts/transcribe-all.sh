#!/bin/bash
# なんちゃラジオ全エピソードの文字起こしバッチ
# - transcripts/NNN.txt が既にあればスキップ（レジューム可能）
# - 音声DL → 16kHz wav 変換 → whisper-cli → txt
# 使い方: bash transcribe-all.sh [並列数(デフォルト2)]

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
POSTS_DIR="$SCRIPT_DIR/../_posts"
TMP_DIR="$SCRIPT_DIR/tmp"
MODEL="$HOME/sandbox/recording_textup/models/ggml-large-v3-turbo-q5_0.bin"
PARALLEL="${1:-2}"
LOG="$SCRIPT_DIR/progress.log"

mkdir -p "$TMP_DIR"

transcribe_one() {
    local id="$1"
    local out="$SCRIPT_DIR/$id"

    if [[ -s "$out.txt" ]]; then
        return 0
    fi

    local mp3="$TMP_DIR/$id.mp3"
    local wav="$TMP_DIR/$id.wav"

    if ! curl -sf -o "$mp3" "https://files.nantyara.com/$id.mp3"; then
        echo "$(date +%H:%M:%S) $id DOWNLOAD_FAILED" >> "$LOG"
        return 1
    fi

    if ! ffmpeg -y -loglevel error -i "$mp3" -ar 16000 -ac 1 "$wav"; then
        echo "$(date +%H:%M:%S) $id FFMPEG_FAILED" >> "$LOG"
        rm -f "$mp3"
        return 1
    fi

    if whisper-cli -m "$MODEL" -l ja -f "$wav" -otxt -of "$out" -np > /dev/null 2>&1 && [[ -s "$out.txt" ]]; then
        echo "$(date +%H:%M:%S) $id OK" >> "$LOG"
    else
        echo "$(date +%H:%M:%S) $id WHISPER_FAILED" >> "$LOG"
        rm -f "$out.txt"
    fi

    rm -f "$mp3" "$wav"
}

export -f transcribe_one
export SCRIPT_DIR TMP_DIR MODEL LOG

# _posts のファイル名（YYYY-MM-DD-NNN.md）からエピソードIDを抽出
ls "$POSTS_DIR" | sed -E 's/^[0-9-]{11}([0-9]+)\.md$/\1/' | sort | \
    xargs -P "$PARALLEL" -I {} bash -c 'transcribe_one "$@"' _ {}

echo "$(date +%H:%M:%S) ALL_DONE ($(ls "$SCRIPT_DIR"/*.txt 2>/dev/null | wc -l | tr -d ' ') files)" >> "$LOG"
