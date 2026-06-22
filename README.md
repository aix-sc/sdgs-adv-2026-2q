# SDGs発展2［a1］ 2026年度 2Q ── 講義紹介サイト

全7回の講義紹介サイト（静的HTML）。各ページは縦スクロールのスライド形式で、
ヘッダーのプルダウンから全7回に移動できます（第3回以降はパスワードゲート）。

## 構成
- `public/index.html` … 第1回へリダイレクト
- `public/lecture1.html` 〜 `lecture7.html` … 各回のページ
- `firebase.json` / `.firebaserc` … Firebase Hosting 設定（プロジェクトID: sdgs-adv-2026-2q）

## 公開（初回）
```bash
npm install -g firebase-tools
firebase login
# プロジェクト未作成なら:
firebase projects:create sdgs-adv-2026-2q --display-name "SDGs発展2 2026 2Q"
firebase deploy --only hosting
# 公開URL: https://sdgs-adv-2026-2q.web.app
```

## GitHub（初回）
```bash
git init && git add -A && git commit -m "init: 講義紹介サイト（全7回）"
git branch -M main
gh repo create sdgs-adv-2026-2q --public --source=. --remote=origin --push
```

## 以後の更新（コミット＆デプロイ）
```bash
git add -A && git commit -m "update: 講義サイト" && git push && firebase deploy --only hosting
```

## 設定メモ
- Gemini APIキー: 各 lectureN.html 内の `GEMINI_API_KEY`（AI相談を使う場合）
- 閲覧パスワード（第3〜7回）: 各ページ内の `PAGE_PASSWORD`（既定 "sdgs2026"）
- 講師写真・書影は外部URLを参照（オフライン時はフォールバック表示）
