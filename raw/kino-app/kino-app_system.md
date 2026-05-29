# raw/kino-app/kino-app_system.md

_Источник: arsid0305/kino-app — README.md_
_Скопировано: 2026-05-28_

---

# Kino App — Screen Suggestion Star

Приложение для персонального подбора фильмов и сериалов с двумя режимами:
- Без подключения: встроенная база фильмов
- Глобальный AI-подбор по всему пространству фильмов через OpenAI

**Главная идея:** пользователь импортирует свою историю и watchlist, хранит в Supabase, получает рекомендации с любого устройства.

## Стек
- Vite + React + TypeScript
- Tailwind CSS
- Supabase Auth + Postgres + Edge Functions
- OpenAI API
- Vercel

## Реализовано
- Импорт xlsx, csv, json
- Локальная история и watchlist
- Дедупликация по `titleRu + year + type`
- Вход по email magic link (Supabase Auth)
- Облачное хранение библиотеки в Supabase
- Глобальная рекомендация через OpenAI + Supabase Edge Function
- AI-чат с учётом фильтров, истории и watchlist

## Edge Functions
- `openai-chat` — AI-чат
- `movie-recommendation` — главный глобальный подбор

## Важное ограничение
Глобальный подбор не использует официальный API Кинопоиска. OpenAI рекомендует фильм глобально по вкусовому профилю, без жёсткой серверной верификации наличия в каталоге Кинопоиска.
