#!/usr/bin/env bash
# bootstrap.sh — инициализация структуры LLM_Wiki локально
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."

mkdir -p \
  "$ROOT/inbox" \
  "$ROOT/raw/ai_os" \
  "$ROOT/raw/template" \
  "$ROOT/raw/wb-bot" \
  "$ROOT/raw/kino-app" \
  "$ROOT/raw/sellerbase" \
  "$ROOT/raw/skincare-guide" \
  "$ROOT/raw/design-system" \
  "$ROOT/raw/technical-language" \
  "$ROOT/raw/external" \
  "$ROOT/wiki" \
  "$ROOT/conflicts"

echo "[bootstrap] LLM_Wiki structure ready at $ROOT"
