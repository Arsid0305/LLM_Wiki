# INDEX — Навигация по LLM_Wiki

> Обновляй этот файл при добавлении новых страниц в `wiki/`.

_Последнее обновление: 2026-05-29 — переименование raw/ файлов с проектным префиксом_

## wiki/ — Скомпилированные страницы

| Файл | Тема | Проекты-источники | Дата |
|------|------|-------------------|------|
| [wiki/lessons.md](wiki/lessons.md) | Кросс-проектные уроки | ai_os, template, wb-bot | 2026-05-28 |
| [wiki/decisions.md](wiki/decisions.md) | Ключевые архитектурные решения | ai_os | 2026-05-28 |

---

## raw/ — Источники по проектам

| Проект | Путь | Кол-во файлов | Что есть |
|--------|------|---------------|----------|
| ai_os | `raw/ai_os/` | 3 | ai-os_lessons.md, ai-os_decisions.md, ai-os_bugs.md |
| template | `raw/template/` | 2 | template_system.md, template_adapter-claude.md |
| wb-bot | `raw/wb-bot/` | 1 | wb-bot_system.md |
| kino-app | `raw/kino-app/` | 1 | kino-app_system.md |
| sellerbase | `raw/sellerbase/` | 0 | _(репо недоступно)_ |
| skincare-guide | `raw/skincare-guide/` | 0 | _(git tree 404 — проверить)_ |
| design-system | `raw/design-system/` | 1 | design-system_system.md |
| technical-language | `raw/technical-language/` | 1 | technical-language_system.md |
| external | `raw/external/` | 0 | |

---

## conflicts/

- [`conflicts/wiki_conflicts.md`](conflicts/wiki_conflicts.md) — открытые конфликты

---

## Быстрый старт

```bash
# Инициализировать структуру локально
bash scripts/bootstrap.sh

# Переместить файлы из inbox в проект
bash scripts/ingest.sh ai_os

# Переместить конкретный файл
bash scripts/ingest.sh external /path/to/paper.pdf
```
