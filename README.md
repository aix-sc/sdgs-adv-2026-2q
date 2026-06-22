# SDGs発展2［a1］ 2026年度 2Q ── 講義紹介サイト（全7回・静的HTML）

ヘッダーのプルダウンで全7回に移動（第3回以降はパスワードゲート）。AI相談はGemini APIを利用。

## 構成
- public/index.html … 第1回へリダイレクト
- public/lecture1.html〜lecture7.html … 各回ページ
- public/config.js … Gemini APIキー（デプロイ時に自動生成・Git管理外）
- scripts/make-config.sh … config.js を生成する predeploy スクリプト
- firebase.json / .firebaserc … Firebase Hosting 設定（プロジェクトID: sdgs-adv-2026-2q）

## AI相談の認証方式
Gemini API はヘッダー `x-goog-api-key` で認証します（クエリ `?key=` は使いません）。
そのため新形式キー（AQ.…）も旧形式（AIzaSy…）もそのまま利用できます。

## デプロイ（APIキーはここで設定）
```bash
firebase use sdgs-adv-2026-2q
GEMINI_API_KEY="（あなたのキー）" firebase deploy --only hosting --project sdgs-adv-2026-2q
# 公開URL: https://sdgs-adv-2026-2q.web.app
```
- ~/.zshrc に export GEMINI_API_KEY="..." しておけば、以後はキー指定なしで deploy 可。
- 反映確認: https://sdgs-adv-2026-2q.web.app/config.js にキーが出ているか。lecture1.html は ⌘+Shift+R で再読込。

## GitHub（aix-sc）
```bash
git add -A && git commit -m "update: 講義サイト" && git push
```
config.js は .gitignore 済みのためキーはコミットされません。

## 推奨設定
- Google Cloud Console でキーにHTTPリファラ制限（https://sdgs-adv-2026-2q.web.app/* など）
- 閲覧パスワード（第3〜7回）: 各ページ内の PAGE_PASSWORD（既定 "sdgs2026"）
