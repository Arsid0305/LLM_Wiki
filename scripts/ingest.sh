#!/usr/bin/env bash
# ingest.sh — копирует файлы из inbox/ в нужный raw/<project>/
# Использование: ./ingest.sh <project> [file_or_dir]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
PROJECTS=(ai_os template wb-bot kino-app sellerbase skincare-guide design-system technical-language external)

PROJECT="${1:-}"
SOURCE="${2:-}"

if [[ -z "$PROJECT" ]]; then
  echo "Usage: $0 <project> [file_or_dir]"
  echo "Projects: ${PROJECTS[*]}"
  exit 1
fi

if [[ ! " ${PROJECTS[*]} " =~ " ${PROJECT} " ]]; then
  echo "Unknown project: $PROJECT. Valid: ${PROJECTS[*]}"
  exit 1
fi

DEST="$ROOT/raw/$PROJECT"
mkdir -p "$DEST"

if [[ -n "$SOURCE" ]]; then
  cp -rv "$SOURCE" "$DEST/"
  echo "[ingest] $SOURCE → $DEST/"
else
  # Переместить всё из inbox/ в raw/<project>/
  INBOX="$ROOT/inbox"
  if [[ -z "$(ls -A "$INBOX" 2>/dev/null)" ]]; then
    echo "[ingest] inbox/ пуст, нечего переносить."
    exit 0
  fi
  mv "$INBOX"/* "$DEST/"
  echo "[ingest] inbox/* → $DEST/"
fi
