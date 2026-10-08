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

* `_posts/YYYY-MM-DD-<id>.md` をコミットすると pre-commit hook が `transcripts/<id>.txt` を ElevenLabs Scribe v2 で自動生成して同じコミットに含める（2026-10-09 に whisper から移行。whisper は繰り返し幻覚が多かったため）
  * hook の有効化（clone 後に1回）: `git config core.hooksPath .githooks`
  * 音声が files.nantyara.com に未アップロード等で生成に失敗した場合は警告のみでコミットは通る。あとで `bash transcripts/transcribe-episode.sh <id>` を実行する
* 全エピソード一括: `bash transcripts/transcribe-all.sh [並列数]`（生成済みはスキップ）
* 要 環境変数 `ELEVENLABS_API_KEY`。本体は `scripts/eleven_transcribe.rb`（テスト: `ruby spec/scripts/eleven_transcribe_spec.rb`）
* 固有名詞の辞書は `transcripts/terms.yml`。`keyterms` は API に渡して聞き取りを寄せる語、`replace` は書き起こし後の表記置換（keyterms を渡しても結果は毎回ブレるので、よく出る誤変換は replace で拾う）
* 2026-10-09 以前の transcript は whisper 生成。作り直すなら該当 txt を消して `transcribe-episode.sh` を再実行（1本 ≒ 350 クレジット）
