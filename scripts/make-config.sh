#!/usr/bin/env bash
# デプロイ直前に public/config.js を生成する（Firebase の predeploy フックから呼ばれる）
# 使い方:  GEMINI_API_KEY="AIza..." firebase deploy --only hosting --project sdgs-adv-2026-2q
set -euo pipefail
OUT="public/config.js"
if [ -n "${GEMINI_API_KEY:-}" ]; then
  {
    echo "// 自動生成: $(date '+%Y-%m-%d %H:%M:%S')  ※このファイルはGit管理外"
    echo "window.GEMINI_API_KEY = \"${GEMINI_API_KEY}\";"
    [ -n "${GEMINI_MODEL:-}" ] && echo "window.GEMINI_MODEL = \"${GEMINI_MODEL}\";"
  } > "$OUT"
  echo "make-config: $OUT を生成しました（key length: ${#GEMINI_API_KEY}）"
elif [ -f "$OUT" ]; then
  echo "make-config: GEMINI_API_KEY 未指定。既存の $OUT をそのまま使用します。"
else
  echo "window.GEMINI_API_KEY = \"\";" > "$OUT"
  echo "make-config: 警告 — GEMINI_API_KEY 未設定のためAI相談は無効でデプロイします（$OUT は空キー）。"
fi
