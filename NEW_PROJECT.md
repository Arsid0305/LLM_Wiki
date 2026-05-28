# Project Context — LLM_Wiki

---

## 1. Tech Stack
- Frontend: none
- Backend: none
- DB & Auth: none
- Storage: GitHub (Markdown files)

---

## 2. Infrastructure & CI/CD
- Repo: github.com/Arsid0305/LLM_Wiki
- `automerge.yml` — feature branch → main auto-merge [✅]
- `promote.yml` [❌]
- `deploy.yml` [❌]

---

## 3. AI Environment

| Tool | Status | Note |
|------|--------|------|
| Python 3 | ✅ | scripts/ingest.sh и bootstrap.sh |
| Node.js / npm | ❌ | не нужен |
| Supabase CLI | ❌ | не нужен |
| .env (real keys) | ❌ | не нужен |

---

## 4. Project Structure

```
.github/workflows/
  automerge.yml       — auto-merge claude/** → main
inbox/                — ручное наполнение без сортировки
raw/
  ai_os/              — источники AI OS
  template/           — источники Template
  wb-bot/             — источники WB Bot
  kino-app/           — источники Kino App
  sellerbase/         — источники Sellerbase
  skincare-guide/     — источники Skincare Guide
  design-system/      — источники Design System
  technical-language/ — источники Technical Language
  external/           — papers, books, articles
wiki/                 — скомпилированные страницы по тематикам
conflicts/
  wiki_conflicts.md   — конфликты между источниками
scripts/
  bootstrap.sh        — инициализация локальной структуры
  ingest.sh           — inbox → raw/<project>
tasks/
  todo.md             — текущие задачи
  lessons.md          — паттерны из ошибок
docs/
  AUDIT_PROMPT.md     — промпт для аудита
CLAUDE.md             — адаптер Claude Code
WIKI.md               — схема и правила вики
INDEX.md              — навигационный индекс
NEW_PROJECT.md        — этот файл
```

---

## 5. Open Bugs

_(empty)_
