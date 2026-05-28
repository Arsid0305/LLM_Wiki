# Wiki Session — Еженедельный прогон

> Читай этот файл в начале каждой wiki-сессии.
> Цель: обойти все репо, собрать новое знание, скомпилировать wiki-страницы.
> Время: ~30–60 мин раз в неделю.

---

## Шаг 0 — Ориентация (2 мин)

Прочитать перед стартом:

```
INDEX.md          — что уже есть в wiki/, сколько файлов в raw/
tasks/todo.md     — что не доделано с прошлой сессии
```

Запрос к Claude:
```
Прочитай INDEX.md и tasks/todo.md в репо LLM_Wiki (arsid0305/llm_wiki, ветка main).
Что не доделано с прошлой сессии?
```

---

## Шаг 1 — Обход всех репо

Для каждого репо — проверить конкретные файлы на новый материал.
Новое = появилось или изменилось с прошлой сессии.

---

### 1.1 ai_os

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `MEMORY/lessons/lessons.md` | Накопленные уроки из реальной работы | `raw/ai_os/lessons.md` |
| `MEMORY/tasks/decisions.md` | Архитектурные решения с обоснованием | `raw/ai_os/decisions.md` |
| `MEMORY/tasks/bugs.md` | Закрытые баги — паттерны ошибок | `raw/ai_os/bugs.md` |
| `docs/ARCHITECTURE.md` | Архитектура системы | `raw/ai_os/architecture.md` |
| `docs/ai_benchmark.md` | Результаты тестов моделей | `raw/ai_os/benchmarks.md` |
| `runtime/core/config.py` | Актуальные версии моделей, пути | `raw/ai_os/config_snapshot.md` |

---

### 1.2 template

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` | Правила для всех проектов | `raw/template/system.md` |
| `adapters/CLAUDE.md` | Правила для Claude Code | `raw/template/adapter_claude.md` |
| `tasks/lessons.md` | Уроки из template-сессий | `raw/template/lessons.md` |
| `QUICKSTART.md` | Как запускать новый проект | `raw/template/quickstart.md` |

---

### 1.3 wb-bot

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` или `README.md` | Контекст проекта, стек | `raw/wb-bot/system.md` |
| `tasks/lessons.md` или `MEMORY/lessons/lessons.md` | Уроки | `raw/wb-bot/lessons.md` |
| `tasks/todo.md` | Что в работе | `raw/wb-bot/todo_snapshot.md` |

---

### 1.4 kino-app

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` или `README.md` | Контекст проекта, стек | `raw/kino-app/system.md` |
| `tasks/lessons.md` или `MEMORY/lessons/lessons.md` | Уроки | `raw/kino-app/lessons.md` |
| `tasks/todo.md` | Что в работе | `raw/kino-app/todo_snapshot.md` |

---

### 1.5 sellerbase

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` или `README.md` | Контекст проекта, стек | `raw/sellerbase/system.md` |
| `tasks/lessons.md` или `MEMORY/lessons/lessons.md` | Уроки | `raw/sellerbase/lessons.md` |
| `tasks/todo.md` | Что в работе | `raw/sellerbase/todo_snapshot.md` |

---

### 1.6 skincare-guide

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` или `README.md` | Контекст проекта, стек | `raw/skincare-guide/system.md` |
| `tasks/lessons.md` или `MEMORY/lessons/lessons.md` | Уроки | `raw/skincare-guide/lessons.md` |
| `tasks/todo.md` | Что в работе | `raw/skincare-guide/todo_snapshot.md` |

---

### 1.7 design-system

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` или `README.md` | Контекст проекта, стек | `raw/design-system/system.md` |
| `tasks/lessons.md` или `MEMORY/lessons/lessons.md` | Уроки | `raw/design-system/lessons.md` |
| `tasks/todo.md` | Что в работе | `raw/design-system/todo_snapshot.md` |

---

### 1.8 technical-language

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` или `README.md` | Контекст проекта, стек | `raw/technical-language/system.md` |
| `tasks/lessons.md` или `MEMORY/lessons/lessons.md` | Уроки | `raw/technical-language/lessons.md` |
| `tasks/todo.md` | Что в работе | `raw/technical-language/todo_snapshot.md` |

---

### 1.9 inbox/

Проверить папку `inbox/` в LLM_Wiki — туда можно бросать что угодно между сессиями:
скриншоты, заметки, ссылки, куски кода.

Запрос к Claude:
```
Что есть в inbox/ репо LLM_Wiki? Разбери по проектам и перемести в raw/<project>/.
```

Или вручную:
```bash
bash scripts/ingest.sh ai_os          # переместит всё из inbox/ в raw/ai_os/
bash scripts/ingest.sh external paper.pdf  # конкретный файл в raw/external/
```

---

## Шаг 2 — Компиляция wiki-страниц

После сбора raw/ — скомпилировать или обновить wiki-страницы.
Wiki-страница = синтез нескольких raw-источников, не копипаст.

| Страница | Источники | Что должно быть |
|----------|-----------|------------------|
| `wiki/lessons.md` | `raw/*/lessons.md` | Кросс-проектные уроки, сгруппированные по теме |
| `wiki/decisions.md` | `raw/*/decisions.md` | Ключевые архитектурные решения с обоснованием |
| `wiki/ai_providers.md` | `raw/ai_os/benchmarks.md`, `raw/ai_os/decisions.md` | Что работает в OpenAI/Anthropic/Gemini/DeepSeek |
| `wiki/workflow.md` | `raw/ai_os/system.md`, `raw/template/system.md` | Как работать: SMALL/BIG, git flow, сессия |
| `wiki/skills.md` | `raw/ai_os/` | 8 скиллов — когда какой использовать |
| `wiki/projects.md` | `raw/*/system.md` | Статус и стек каждого проекта |

**Формат каждой wiki-страницы:**
```markdown
# Название темы

_Последнее обновление: YYYY-MM-DD_

## Суть
...

## Ключевые решения / уроки
...

## Источники
- [raw/ai_os/decisions.md](../raw/ai_os/decisions.md)
- [raw/template/lessons.md](../raw/template/lessons.md)
```

Запрос к Claude:
```
Прочитай raw/ai_os/lessons.md и raw/template/lessons.md в репо LLM_Wiki.
Скомпилируй wiki/lessons.md — сгруппируй уроки по теме, убери дубли.
Добавь в конец каждого урока ссылку на источник.
```

---

## Шаг 3 — Обновить INDEX.md (5 мин)

Запрос к Claude:
```
Посмотри что сейчас в wiki/ и raw/ репо LLM_Wiki.
Обнови INDEX.md — добавь новые страницы в таблицу, обнови счётчики файлов в raw/.
```

---

## Шаг 4 — Зафиксировать конфликты

Если в разных raw-источниках нашлись противоречия — записать в `conflicts/wiki_conflicts.md`.

Когда фиксировать:
- Два репо описывают одну практику по-разному
- В decisions.md есть решение которое противоречит текущему коду
- Lesson в одном проекте противоречит правилу в другом

---

## Шаг 5 — Закрытие сессии (3 мин)

1. Обновить `tasks/todo.md` в LLM_Wiki:
   - Отметить что сделано
   - Добавить что не успела — чтобы не забыть на следующей неделе

2. Закоммитить всё на ветке `claude/wiki-YYYY-MM-DD`:
   ```
   claude/wiki-2026-06-02
   ```
   automerge подхватит и смержит в main автоматически.

---

## Быстрый старт — один запрос на всё

Если не хочется делать по шагам — скопируй этот запрос целиком:

```
Запусти еженедельную wiki-сессию по плану docs/WIKI_SESSION.md в репо LLM_Wiki.

Обойди все репо arsid0305 и прочитай:

ai_os (main):
- MEMORY/lessons/lessons.md
- MEMORY/tasks/decisions.md
- MEMORY/tasks/bugs.md

template (main):
- SYSTEM.md
- tasks/lessons.md

wb-bot (main):
- SYSTEM.md или README.md
- tasks/lessons.md или MEMORY/lessons/lessons.md

kino-app (main):
- SYSTEM.md или README.md
- tasks/lessons.md или MEMORY/lessons/lessons.md

sellerbase (main):
- SYSTEM.md или README.md
- tasks/lessons.md или MEMORY/lessons/lessons.md

skincare-guide (main):
- SYSTEM.md или README.md
- tasks/lessons.md или MEMORY/lessons/lessons.md

design-system (main):
- SYSTEM.md или README.md
- tasks/lessons.md или MEMORY/lessons/lessons.md

technical-language (main):
- SYSTEM.md или README.md
- tasks/lessons.md или MEMORY/lessons/lessons.md

Для каждого репо: есть ли что-то новое с прошлой сессии?
Скопируй новый материал в raw/<project>/ в LLM_Wiki.
Обнови или создай wiki/lessons.md и wiki/decisions.md.
Обнови INDEX.md.
Запиши итог в tasks/todo.md.
```

---

## Чего НЕ делать

- Не копировать код в wiki — только решения и уроки
- Не пересказывать README проектов — wiki про WHY, не WHAT
- Не удалять из raw/ — только добавлять и обновлять
- Не создавать wiki-страницу пока в raw/ меньше 2 источников
