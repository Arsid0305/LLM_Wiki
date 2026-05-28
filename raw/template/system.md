# raw/template/system.md

_Источник: arsid0305/template — SYSTEM.md_
_Скопировано: 2026-05-28_

---

# SYSTEM.md — TEMPLATE

## Что такое TEMPLATE

Bootstrap-шаблон для новых проектов. Содержит CI/CD воркфлоу, адаптеры для AI-инструментов, документацию и скрипты инициализации.

Для нового проекта:
```bash
git clone https://github.com/Arsid0305/TEMPLATE /tmp/arsid-template
bash /tmp/arsid-template/init.sh /path/to/new-project claude
```

## Классификация задач

### SMALL — делать сразу
- Правка 1–3 файлов
- Баг-фикс с очевидной причиной
- Документация, переименование
- Рефакторинг без изменения контракта

### BIG — спросить перед реализацией
- Новый модуль или архитектурное изменение
- Изменение публичного интерфейса
- Удаление файлов/функций
- Задача занимает больше 10 минут или затрагивает несколько слоёв

## Принципы работы с кодом

- Не добавлять фичи без запроса
- Не рефакторить «заодно»
- Не создавать абстракции под гипотетическое будущее
- Простой код лучше «правильного»
- DRY: дублирующийся код выносить явно — три похожих строки уже сигнал
- Verification: перед «готово» прогнать тесты/CLI на golden path + edge case
- Безопасность: никакого command injection, path traversal, hardcoded secrets

## CI/CD Рабочий процесс

### Auto-merge
- Ветки `claude/...` и `cursor/...` мержатся автоматически через GitHub API
- Триггер: открытие/обновление PR в `main`
- Мерж через `github-script` (squash) — без shell-команд, без injection-рисков

### Синхронизация с AI_OS
- `.claude/`, `.cursor/`, `ADAPTERS/`, `skills_sistem/`, `CLAUDE.md` — синхронизируются из AI_OS
- НЕ синхронизируются: `SYSTEM.md`, `NEW_PROJECT.md`, `SECURITY.md`, `init.sh`, `adapters/`, `workflows/`
