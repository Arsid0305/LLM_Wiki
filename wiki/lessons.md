# Lessons — Кросс-проектные уроки

_Последнее обновление: 2026-05-28_

---

## Простота и контроль scope

### Применяй критерий простоты к собственным предложениям
Прежде чем добавить новое правило/шаг — проверить, не покрыто ли уже существующими.
Новая переменная без новой ценности = шум, размывает фокус.
Применять «можно ли убрать половину?» к своим предложениям до показа пользователю.

_Источник: [raw/ai_os/lessons.md](../raw/ai_os/lessons.md) — 2026-05-22_

### Не изменять ничего вне согласованного scope
Изменять только то, что обсудили и подтвердили. Нашёл баг вне scope — сообщи, не трогай.
Правило консистентно в ai_os, template и wb-bot — это системный паттерн, не локальное правило.

_Источник: [raw/template/system.md](../raw/template/system.md), [raw/wb-bot/system.md](../raw/wb-bot/system.md)_

---

## Роли: автор vs ревьюер

### Автор не может объективно оценить собственный код
У автора bias подтверждения (Klotz, *Subtract*, 2021). Правило «упрости» в чек-листе автора бесполезно.
Работает только отдельная роль: review-subagent или человек.
Практическое следствие: создан `reviewer.md` как отдельный диагност-приёмщик в ai_os.

_Источник: [raw/ai_os/lessons.md](../raw/ai_os/lessons.md) — 2026-05-22_

---

## Git workflow в web-окружении Claude Code

### Использовать mcp__github__push_files вместо git commit
`git commit` в web-сессии Claude Code падает с `signing server returned status 400: missing source`.
Причина: конфиг `commit.gpgsign=true`, signing server требует параметр `source`, который web environment не передаёт.
После push: `git fetch origin main && git reset --hard origin/main` для синхронизации локального клона.

_Источник: [raw/ai_os/lessons.md](../raw/ai_os/lessons.md) — 2026-05-24_

### git checkout HEAD -- . уничтожает незакоммиченную работу
`git checkout HEAD -- .` и `git restore .` — деструктивные команды без подтверждения.
Никогда не цеплять к тестовым командам через `;` или `&&`.

_Источник: [raw/ai_os/lessons.md](../raw/ai_os/lessons.md) — 2026-05-24_

---

## CI/CD и automerge

### PR невозможен если automerge удаляет ветку сразу после push
При `automerge.yml` который мержит сразу после push и удаляет ветку — PR создавать некуда (422 invalid head).
Системная инструкция «всегда создавать draft PR» противоречит локальной CI-политике. Приоритет — локальная.
Правило: проверять main после push, не пытаться создать PR.

_Источник: [raw/ai_os/lessons.md](../raw/ai_os/lessons.md) — 2026-05-22_

---

## Источники
- [raw/ai_os/lessons.md](../raw/ai_os/lessons.md)
- [raw/template/system.md](../raw/template/system.md)
- [raw/wb-bot/system.md](../raw/wb-bot/system.md)
