# INDEX — Навигация по LLM_Wiki

> Обновляй этот файл при добавлении новых страниц в `wiki/`.

## wiki/ — Скомпилированные страницы

| Файл | Тема | Проекты | Дата |
|------|------|---------|------|
| _(пусто — добавь первую страницу)_ | | | |

---

## raw/ — Источники по проектам

| Проект | Путь | Кол-во файлов |
|--------|------|---------------|
| ai_os | `raw/ai_os/` | 0 |
| template | `raw/template/` | 0 |
| wb-bot | `raw/wb-bot/` | 0 |
| kino-app | `raw/kino-app/` | 0 |
| sellerbase | `raw/sellerbase/` | 0 |
| skincare-guide | `raw/skincare-guide/` | 0 |
| design-system | `raw/design-system/` | 0 |
| technical-language | `raw/technical-language/` | 0 |
| external | `raw/external/` | 0 |

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
