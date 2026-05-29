# raw/ai_os/ai-os_decisions.md

_Источник: arsid0305/ai_os — MEMORY/tasks/decisions.md_
_Скопировано: 2026-05-28_

---

# Decisions

_(архитектурные решения — не удалять)_

## [2026-05-13] SYSTEM.md как универсальное ядро
**Контекст:** CLAUDE.md содержал смешение CORE логики и Claude-specific адаптера. Не работал с другими AI инструментами.
**Решение:** Разделить на SYSTEM.md (универсальный) + `CLAUDE.md` (тонкий адаптер, в корне репо).
**Причина:** Переход от Claude OS к AI-agnostic orchestration layer.
**Альтернативы:** Оставить CLAUDE.md как есть — отклонено, система не масштабируется на Cursor/ChatGPT.

## [2026-05-13] Depth escalation вместо mode switching
**Контекст:** Конфликт между «отвечай кратко» и «проводи глубокий review».
**Решение:** Depth escalation — градиентное расширение анализа по триггерам, не бинарное переключение.
**Причина:** Operationalizable, deterministic, не требует explicit request от пользователя.
**Альтернативы:** Binary mode switch — отклонено, граница задач размыта в реальном use.

## [2026-05-13] MEMORY структура с 4 файлами
**Контекст:** tasks/lessons.md и tasks/todo.md пустые — memory decay.
**Решение:** MEMORY/ с todo.md, bugs.md, decisions.md, lessons.md — разные lifecycle.
**Причина:** Bugs удаляются после фикса. Decisions накапливаются. Lessons — reusable patterns. Todo — ephemeral.
**Альтернативы:** Один файл — отклонено, разные lifecycle создают мусор.

## [2026-05-24] TEMPLATE.SYSTEM.md независим от AI_OS
**Контекст:** sync-to-template.yml копировал SYSTEM.md из AI_OS в TEMPLATE. AI_OS SYSTEM.md описывал runtime/, MEMORY/, projects/ — ничего из этого нет в TEMPLATE.
**Решение:** Убрать копирование SYSTEM.md из sync workflow. TEMPLATE владеет своим SYSTEM.md, описывающим реальную структуру TEMPLATE.
**Причина:** Разные репо — разные контексты. Автосинк инфраструктуры не должен перезаписывать документацию другого репо.
**Альтернативы:** Общий SYSTEM.md с условными секциями — отклонено, усложняет оба контекста.

## [2026-05-24] Эталон «что должно быть в каждом репо»
**Контекст:** Планируется аудит 6 других репо (WB-promotions, Skincare-Guide, Technical-language, design-system, Kino-app, WB-Bot).
**Решение:** Эталон из TEMPLATE: `.claude/` (agents: reviewer, repo-auditor), `CLAUDE.md`, `automerge.yml` (SHA-pinned), `SYSTEM.md` под структуру репо. Применять через `bash init.sh claude` при создании или доустанавливать вручную.
**Причина:** Единообразие — быстрый старт любого репо, AI-агенты сразу доступны.
**Альтернативы:** Каждое репо по своим правилам — отклонено, memory decay между сессиями.

## [2026-05-24] PRIORITY 2 архитектурные ограничения AI_OS — ждать до параллельного бота
**Контекст:** 4 ограничения (state.json без блокировок, слабая модель исключений, нет cancellation, coupling orchestrator/Anthropic). WB-Bot используется, но природа его интеграции с AI_OS неизвестна.
**Решение:** Отложить до выяснения: если WB-Bot вызывает AI_OS как HTTP-сервер с параллельными запросами — PRIORITY 1 немедленно. Если CLI-вызов или HTML-адаптер без Python — оставить PRIORITY 2.
**Причина:** Риск реален только при параллельных записях в state.json.
**Альтернативы:** Сделать сейчас превентивно — отклонено, преждевременная оптимизация если WB-Bot не создаёт параллелизм.
