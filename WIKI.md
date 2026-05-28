# LLM_Wiki — Глобальная вики по всем проектам

## Назначение

Центральное хранилище знаний, решений и контекста по всем проектам экосистемы.
Используется как источник правды для AI OS и ручного чтения.

---

## Структура репозитория

```
llm_wiki/
├── inbox/                      # Ручное наполнение (любые файлы без сортировки)
├── raw/
│   ├── ai_os/                  # Источники по проекту AI OS
│   ├── template/               # Источники по шаблонному проекту
│   ├── wb-bot/                 # Источники по WB Bot
│   ├── kino-app/               # Источники по Kino App
│   ├── sellerbase/             # Источники по Sellerbase
│   ├── skincare-guide/         # Источники по Skincare Guide
│   ├── design-system/          # Источники по Design System
│   ├── technical-language/     # Источники по Technical Language
│   └── external/               # Внешние материалы (papers, books, articles)
├── wiki/                       # Скомпилированные страницы по тематикам
├── conflicts/
│   └── wiki_conflicts.md       # Конфликты между источниками
├── scripts/
│   ├── bootstrap.sh            # Инициализация локальной структуры
│   └── ingest.sh               # Перемещение файлов из inbox в raw/<project>
├── WIKI.md                     # Этот файл — схема и правила
└── INDEX.md                    # Навигационный индекс всех wiki-страниц
```

---

## Правила наполнения

### inbox/
- Бросай сюда любые файлы без сортировки
- Потом запускай `scripts/ingest.sh <project>` для разноски

### raw/<project>/
- Только исходники: заметки, чаты, code snippets, export'ы
- Без редактирования — сырые данные как есть
- Именование: `YYYY-MM-DD_<тема>.md` или `<тема>.pdf`

### raw/external/
- Papers (ArXiv, ACL, ...)
- Книги и статьи
- Именование: `<author>_<year>_<short-title>.pdf`

### wiki/
- Скомпилированные страницы: итог анализа raw-источников
- Именование: `<topic>.md` (например `architecture.md`, `auth_patterns.md`)
- Каждая страница содержит раздел `## Источники` со ссылками на raw/

### conflicts/wiki_conflicts.md
- Фиксируй противоречия между источниками
- Формат описан внутри файла

---

## Подключение к AI OS

Переменные окружения для `wiki_engine.py`:

```bash
export WIKI_REPO_PATH=/path/to/llm_wiki
```

Then `RAW_DIR` и `WIKI_DIR` подхватываются автоматически:
- `RAW_DIR  = $WIKI_REPO_PATH/raw`
- `WIKI_DIR = $WIKI_REPO_PATH/wiki`

---

## Проекты

| Слаг | Полное название |
|------|----------------|
| `ai_os` | AI Operating System |
| `template` | Project Template |
| `wb-bot` | Wildberries Bot |
| `kino-app` | Kino App |
| `sellerbase` | Sellerbase |
| `skincare-guide` | Skincare Guide |
| `design-system` | Design System |
| `technical-language` | Technical Language |
