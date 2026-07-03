#!/bin/bash
# 1エピソード分の文字起こし: 音声DL → 16kHz wav 変換 → whisper-cli → txt
# 使い方: bash transcribe-episode.sh <episode-id>   (例: 443, sp014)
# transcripts/<id>.txt が既にあれば何もせず正常終了（レジューム可能）

set -u

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP_DIR="$SCRIPT_DIR/tmp"
MODEL="$HOME/sandbox/recording_textup/models/ggml-large-v3-turbo-q5_0.bin"
LOG="$SCRIPT_DIR/progress.log"

id="${1:?usage: transcribe-episode.sh <episode-id>}"
out="$SCRIPT_DIR/$id"

[[ -s "$out.txt" ]] && exit 0

mkdir -p "$TMP_DIR"
mp3="$TMP_DIR/$id.mp3"
wav="$TMP_DIR/$id.wav"

if ! curl -sf -o "$mp3" "https://files.nantyara.com/$id.mp3"; then
    echo "$(date +%H:%M:%S) $id DOWNLOAD_FAILED" >> "$LOG"
    exit 1
fi

if ! ffmpeg -y -loglevel error -i "$mp3" -ar 16000 -ac 1 "$wav"; then
    echo "$(date +%H:%M:%S) $id FFMPEG_FAILED" >> "$LOG"
    rm -f "$mp3"
    exit 1
fi

if whisper-cli -m "$MODEL" -l ja -f "$wav" -otxt -of "$out" -np > /dev/null 2>&1 && [[ -s "$out.txt" ]]; then
    echo "$(date +%H:%M:%S) $id OK" >> "$LOG"
    rm -f "$mp3" "$wav"
else
    echo "$(date +%H:%M:%S) $id WHISPER_FAILED" >> "$LOG"
    rm -f "$out.txt" "$mp3" "$wav"
    exit 1
fi
