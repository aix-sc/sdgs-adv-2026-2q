# SDGs発展2［a1］ 2026年度 2Q ── 講義紹介サイト

全7回の講義紹介サイト（静的HTML）。各ページは縦スクロールのスライド形式で、
ヘッダーのプルダウンから全7回に移動できます（第3回以降はパスワードゲート）。

## 構成
- `public/index.html` … 第1回へリダイレクト
- `public/lecture1.html`〜`lecture7.html` … 各回のページ
- `public/config.js` … Gemini APIキー（**デプロイ時に自動生成・Git管理外**）
- `scripts/make-config.sh` … config.js を生成する predeploy スクリプト
- `firebase.json` / `.firebaserc` … Firebase Hosting 設定（プロジェクトID: sdgs-adv-2026-2q）

## デプロイ（APIキーはここで設定）
AI相談（Gemini）を有効にするには、デプロイ時に環境変数でキーを渡します。
predeploy フックが `public/config.js` を自動生成し、各ページがそこからキーを読み込みます。
HTML自体には鍵を埋め込みません。

```bash
firebase use sdgs-adv-2026-2q
GEMINI_API_KEY="AIza...あなたのキー..." firebase deploy --only hosting --project sdgs-adv-2026-2q
# 公開URL: https://sdgs-adv-2026-2q.web.app
```

- キーを渡さずに `firebase deploy` した場合：既存の config.js があればそれを使用、無ければ空キー（AI相談は無効）でデプロイします。
- 手動設定したい場合：`config.sample.js` を `public/config.js` にコピーしてキーを記入（Git管理外）。

### セキュリティ上の注意
クライアント側でキーを使う構成のため、config.js は公開URLから閲覧可能です。
**必ず Google AI Studio でHTTPリファラ制限（例: `sdgs-adv-2026-2q.web.app/*`）をかけたキー**を使ってください。

## GitHub（aix-sc 組織）
```bash
git init && git add -A && git commit -m "init: 講義紹介サイト（全7回）"
git branch -M main
gh repo create aix-sc/sdgs-adv-2026-2q --public --source=. --remote=origin --push
```
config.js は .gitignore 済みなので、キーがコミットされることはありません。

## 以後の更新
```bash
git add -A && git commit -m "update: 講義サイト" && git push
GEMINI_API_KEY="AIza..." firebase deploy --only hosting --project sdgs-adv-2026-2q
```

## その他の設定
- 閲覧パスワード（第3〜7回）: 各ページ内の `PAGE_PASSWORD`（既定 "sdgs2026"）
- 講師写真・書影は外部URLを参照（オフライン時はフォールバック表示）
