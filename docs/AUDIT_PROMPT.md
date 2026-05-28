# Repository Audit — Reference Prompt

Вставить этот файл целиком в начало аудита любому AI.  
Перед запуском — адаптировать блок «Контекст проекта» под реальный стек.

---

## Перед началом — синхронизация

Аудит на устаревшем snapshot бесполезен. До чтения кода:
1. Прочитать последние 10 коммитов: `git log --oneline -10 main`
2. Зафиксировать HEAD: `git rev-parse main` — указать SHA в начале отчёта
3. Пробежать по `tasks/lessons.md` и `git log --grep=fix` за последний месяц — не повторять уже починенное

Если найден баг — убедиться что он **есть в текущем HEAD**, а не в кеше.

---

## Контекст проекта

```
Тип проекта: глобальная wiki по всем проектам экосистемы
Стек: Markdown, Bash (scripts/)
Главный язык: Markdown
Внешние API: нет

Проекты: ai_os, template, wb-bot, kino-app, sellerbase, skincare-guide, design-system, technical-language

CI/CD: automerge.yml (claude/** и cursor/** → main)

Структура:
  raw/<project>/    — источники по проекту (сырые заметки, дампы, code snippets)
  raw/external/     — papers, books, articles
  wiki/             — скомпилированные страницы по тематикам
  inbox/            — ручное наполнение без сортировки
  conflicts/        — конфликты между источниками
  scripts/          — bootstrap.sh, ingest.sh
```
