# なんちゃラジオ

https://podcast.nantyara.com

# mp3 アップロード (files.nantyara.com = Cloudflare R2)

* `./sync.sh` — `~/Music/なんちゃラジオ/up/` の未アップロード分を R2 バケット `nantyara-files` に `rclone copy --ignore-existing` する
  * 認証は `~/.secrets/rclone-r2-nantyara.env`（nantyara サーバの `~/.config/rclone-r2.env` と同内容）
  * 2026-07-06 に配信が nantyara サーバ (nginx) から Cloudflare R2 カスタムドメインに移行。旧 `rsync.sh` は廃止

# post 自動生成

* `bundle exec ruby scripts/create_post.rb ~/Music/なんちゃラジオ/up/001.mp3 2018-09-28`
  * post 生成後、その mp3 を自動で R2 にアップロードする（`sync.sh <file>` 相当）

# 文字起こし (transcripts/)

* `_posts/YYYY-MM-DD-<id>.md` をコミットすると pre-commit hook が `transcripts/<id>.txt` を whisper で自動生成して同じコミットに含める
  * hook の有効化（clone 後に1回）: `git config core.hooksPath .githooks`
  * 音声が files.nantyara.com に未アップロード等で生成に失敗した場合は警告のみでコミットは通る。あとで `bash transcripts/transcribe-episode.sh <id>` を実行する
* 全エピソード一括: `bash transcripts/transcribe-all.sh [並列数]`（生成済みはスキップ）
* 要 `whisper-cli` / `ffmpeg` とモデル `~/sandbox/recording_textup/models/ggml-large-v3-turbo-q5_0.bin`
