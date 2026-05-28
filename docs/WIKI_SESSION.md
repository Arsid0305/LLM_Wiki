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
Прочитай INDEX.md и tasks/todo.md в репо LLM_Wiki.
Что не доделано с прошлой сессии?
```

---

## Шаг 1 — Обход репо (основной блок)

Для каждого репо ниже — проверить конкретные файлы на новый материал.
Новое = появилось или изменилось с прошлой сессии.

---

### 1.1 ai_os

**Что читать:**

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `MEMORY/lessons/lessons.md` | Накопленные уроки из реальной работы | `raw/ai_os/lessons.md` |
| `MEMORY/tasks/decisions.md` | Архитектурные решения с обоснованием | `raw/ai_os/decisions.md` |
| `MEMORY/tasks/bugs.md` | Закрытые баги — паттерны ошибок | `raw/ai_os/bugs.md` |
| `docs/ARCHITECTURE.md` | Архитектура системы | `raw/ai_os/architecture.md` |
| `docs/ai_benchmark.md` | Результаты тестов моделей | `raw/ai_os/benchmarks.md` |
| `runtime/core/config.py` | Актуальные версии моделей, пути | `raw/ai_os/config_snapshot.md` |

**Запрос к Claude:**
```
Прочитай в репо arsid0305/ai_os (ветка main):
- MEMORY/lessons/lessons.md
- MEMORY/tasks/decisions.md
- MEMORY/tasks/bugs.md

Что добавилось нового? Скопируй весь новый контент в raw/ai_os/ в LLM_Wiki.
```

---

### 1.2 template

**Что читать:**

| Файл | Что там | Куда класть |
|------|---------|-------------|
| `SYSTEM.md` | Правила для всех проектов | `raw/template/system.md` |
| `adapters/CLAUDE.md` | Правила для Claude Code | `raw/template/adapter_claude.md` |
| `tasks/lessons.md` | Уроки из template-сессий | `raw/template/lessons.md` |
| `QUICKSTART.md` | Как запускать новый проект | `raw/template/quickstart.md` |

**Запрос к Claude:**
```
Прочитай SYSTEM.md и tasks/lessons.md в репо arsid0305/template.
Есть ли изменения в правилах или новые уроки? Обнови raw/template/ в LLM_Wiki.
```

---

### 1.3 wb-bot, kino-app, sellerbase, skincare-guide, design-system, technical-language

Для каждого — одинаковый паттерн (адаптируй под реальную структуру репо):

**Что искать в каждом репо:**

```
1. SYSTEM.md или README.md      — контекст проекта
2. tasks/lessons.md             — уроки
   или MEMORY/lessons/lessons.md
3. tasks/todo.md                — что в работе
4. CHANGELOG.md или git log     — что изменилось
```

**Куда класть:** `raw/<project>/lessons.md`, `raw/<project>/decisions.md`

**Запрос к Claude:**
```
Прочитай SYSTEM.md, tasks/lessons.md и README.md в репо arsid0305/<project>.
Есть ли что-то стоящее записать в вики? Скопируй в raw/<project>/ в LLM_Wiki.
```

---

### 1.4 inbox/

Проверить папку `inbox/` в LLM_Wiki — туда можно бросать что угодно между сессиями:
скриншоты, заметки, ссылки, куски кода.

**Запрос к Claude:**
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

**Приоритетные страницы для старта:**

| Страница | Источники | Что должно быть |
|----------|-----------|----------------|
| `wiki/lessons.md` | `raw/*/lessons.md` | Кросс-проектные уроки, сгруппированные по теме |
| `wiki/decisions.md` | `raw/ai_os/decisions.md`, другие | Ключевые архитектурные решения с обоснованием |
| `wiki/ai_providers.md` | `raw/ai_os/benchmarks.md`, `raw/ai_os/decisions.md` | Что работает в OpenAI/Anthropic/Gemini/DeepSeek |
| `wiki/workflow.md` | `raw/ai_os/system.md`, `raw/template/system.md` | Как работать: SMALL/BIG, git flow, сессия |
| `wiki/skills.md` | `raw/ai_os/` | 8 скиллов — когда какой использовать |
| `wiki/projects.md` | `raw/*/system.md` | Статус и стек каждого проекта |

**Запрос к Claude:**
```
Прочитай raw/ai_os/lessons.md и raw/template/lessons.md в LLM_Wiki.
Скомпилируй wiki/lessons.md — сгруппируй уроки по теме, убери дубли.
Добавь в конец каждого урока ссылку на источник: raw/<project>/lessons.md
```

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

---

## Шаг 3 — Обновить INDEX.md (5 мин)

После добавления новых wiki-страниц — обновить таблицу в `INDEX.md`.

**Запрос к Claude:**
```
Посмотри что сейчас в wiki/ и raw/ репо LLM_Wiki.
Обнови INDEX.md — добавь новые страницы в таблицу.
```

---

## Шаг 4 — Зафиксировать конфликты

Если в разных raw-источниках нашлись противоречия — записать в `conflicts/wiki_conflicts.md`.

**Когда фиксировать:**
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

## Быстрый старт сессии — один запрос

Если не хочешь делать по шагам — один запрос покрывает всё:

```
Запусти еженедельную wiki-сессию по плану docs/WIKI_SESSION.md в репо LLM_Wiki.

Пройдись по репо:
- arsid0305/ai_os: MEMORY/lessons/lessons.md, MEMORY/tasks/decisions.md, MEMORY/tasks/bugs.md
- arsid0305/template: SYSTEM.md, tasks/lessons.md

Собери новый материал в raw/, скомпилируй или обнови wiki/lessons.md и wiki/decisions.md,
обнови INDEX.md, запиши итог в tasks/todo.md.
```

---

## Чего НЕ делать

- Не копировать код в wiki — только решения и уроки
- Не переписывать README проектов — wiki про WHY, не WHAT
- Не удалять из raw/ — только добавлять и обновлять
- Не создавать wiki-страницу пока в raw/ меньше 2 источников
