# INDEX — Навигация по LLM_Wiki

> Обновляй этот файл при добавлении новых страниц в `wiki/`.

_Последнее обновление: 2026-05-28 — wiki-сессия #1_

## wiki/ — Скомпилированные страницы

| Файл | Тема | Проекты-источники | Дата |
|------|------|-------------------|------|
| [wiki/lessons.md](wiki/lessons.md) | Кросс-проектные уроки | ai_os, template, wb-bot | 2026-05-28 |
| [wiki/decisions.md](wiki/decisions.md) | Ключевые архитектурные решения | ai_os | 2026-05-28 |

---

## raw/ — Источники по проектам

| Проект | Путь | Кол-во файлов | Что есть |
|--------|------|---------------|----------|
| ai_os | `raw/ai_os/` | 3 | lessons.md, decisions.md, bugs.md |
| template | `raw/template/` | 2 | system.md, adapter_claude.md |
| wb-bot | `raw/wb-bot/` | 1 | system.md |
| kino-app | `raw/kino-app/` | 1 | system.md |
| sellerbase | `raw/sellerbase/` | 0 | _(репо недоступно)_ |
| skincare-guide | `raw/skincare-guide/` | 0 | _(git tree 404 — проверить)_ |
| design-system | `raw/design-system/` | 1 | system.md |
| technical-language | `raw/technical-language/` | 1 | system.md |
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
