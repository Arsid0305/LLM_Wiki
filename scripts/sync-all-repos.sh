#!/usr/bin/env bash
# sync-all-repos.sh — клонирует все репо arsid0305 если нет, пуллит если есть
# Использование: bash scripts/sync-all-repos.sh [папка]
# По умолчанию кладёт репо рядом с LLM_Wiki

set -e

ROOT="${1:-$(dirname "$(cd "$(dirname "$0")" && pwd)")}"

REPOS=(
  "ai_os"
  "template"
  "wb-bot"
  "kino-app"
  "skincare-guide"
  "design-system"
  "technical-language"
)

echo "📁 Папка: $ROOT"
echo ""

for repo in "${REPOS[@]}"; do
  dest="$ROOT/$repo"
  url="https://github.com/arsid0305/$repo.git"

  if [ -d "$dest/.git" ]; then
    echo "⬇️  $repo — pull"
    git -C "$dest" pull --ff-only origin main 2>/dev/null \
      || git -C "$dest" pull --ff-only origin master 2>/dev/null \
      || echo "   ⚠️  не удалось pull (проверь ветку вручную)"
  else
    echo "📥 $repo — clone"
    git clone "$url" "$dest" 2>/dev/null \
      || echo "   ⚠️  не удалось клонировать (приватное или нет доступа)"
  fi
done

echo ""
echo "✅ Готово. Репо в: $ROOT"
