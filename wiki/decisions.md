# Decisions — Ключевые архитектурные решения

_Последнее обновление: 2026-05-28_

---

## Системные файлы и AI-agnostic архитектура

### SYSTEM.md как универсальное ядро + тонкие адаптеры
**Контекст:** CLAUDE.md смешивал CORE логику и Claude-specific адаптер — не работал с другими AI инструментами.
**Решение:** SYSTEM.md (универсальный, AI-agnostic) + тонкий адаптер под каждый инструмент в корне репо.
**Почему:** Переход к AI-agnostic orchestration — масштабируется на Cursor, ChatGPT, Gemini без переписывания ядра.
**Отклонено:** Оставить CLAUDE.md как есть — система не масштабируется.

_Источник: [raw/ai_os/decisions.md](../raw/ai_os/decisions.md) — 2026-05-13_

### Каждое репо владеет своим SYSTEM.md
**Контекст:** sync-to-template.yml копировал SYSTEM.md из AI_OS в TEMPLATE — но содержимое описывало runtime/, MEMORY/, которых в TEMPLATE нет.
**Решение:** Убрать копирование SYSTEM.md из sync workflow. Синхронизировать только инфраструктуру: `.claude/`, `.cursor/`, `ADAPTERS/`, `CLAUDE.md`.
**Почему:** Автосинк инфраструктуры не должен перезаписывать контекстно-специфичную документацию.
**Отклонено:** Общий SYSTEM.md с условными секциями — усложняет оба контекста.

_Источник: [raw/ai_os/decisions.md](../raw/ai_os/decisions.md) — 2026-05-24_

---

## Memory и Knowledge Management

### MEMORY с 4 файлами разного lifecycle
**Контекст:** tasks/lessons.md и tasks/todo.md с единым lifecycle — memory decay.
**Решение:** MEMORY/ с 4 файлами:
- `todo.md` — ephemeral, удаляется после завершения
- `bugs.md` — удалять после фикса
- `decisions.md` — накапливать, не удалять
- `lessons.md` — reusable patterns, накапливать
**Почему:** Разные lifecycle при смешивании создают разный тип шума.
**Отклонено:** Один файл — lifecycle смешивается, мусор накапливается.

_Источник: [raw/ai_os/decisions.md](../raw/ai_os/decisions.md) — 2026-05-13_

---

## Анализ и review

### Depth escalation вместо mode switching
**Контекст:** Конфликт между «отвечай кратко» и «проводи глубокий review».
**Решение:** Depth escalation — градиентное расширение анализа по триггерам, не бинарное переключение режимов.
**Почему:** Operationalizable, deterministic, не требует явного запроса от пользователя.
**Отклонено:** Binary mode switch — граница задач размыта в реальном использовании.

_Источник: [raw/ai_os/decisions.md](../raw/ai_os/decisions.md) — 2026-05-13_

---

## Стандартизация репо

### Эталон структуры для каждого репо
**Контекст:** Планируется аудит 6+ репо — нужен единый стандарт.
**Решение:** Эталон из TEMPLATE: `.claude/` (agents: reviewer, repo-auditor), `CLAUDE.md`, `automerge.yml` (SHA-pinned), `SYSTEM.md` под структуру репо.
**Почему:** Единообразие — быстрый старт, AI-агенты доступны сразу, нет memory decay между сессиями.
**Отклонено:** Каждое репо по своим правилам — memory decay неизбежен.

_Источник: [raw/ai_os/decisions.md](../raw/ai_os/decisions.md) — 2026-05-24_

### Архитектурные ограничения AI_OS — ждать до параллельного бота
**Контекст:** 4 ограничения (state.json без блокировок, weak exception handling, нет cancellation, coupling orchestrator/Anthropic). Риск актуален только при параллельных записях в state.json.
**Решение:** Отложить PRIORITY 2 до выяснения природы интеграции WB-Bot с AI_OS. Если CLI — PRIORITY 2. Если HTTP с параллельными запросами — PRIORITY 1 немедленно.
**Почему:** Не делать превентивную оптимизацию без подтверждённого риска.
**Отклонено:** Сделать сейчас — преждевременная оптимизация.

_Источник: [raw/ai_os/decisions.md](../raw/ai_os/decisions.md) — 2026-05-24_

---

## Источники
- [raw/ai_os/decisions.md](../raw/ai_os/decisions.md)
