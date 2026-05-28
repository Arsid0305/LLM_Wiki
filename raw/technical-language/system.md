# raw/technical-language/system.md

_Источник: arsid0305/technical-language — README.md_
_Скопировано: 2026-05-28_

---

# Technical Language

Веб-приложение для работы с техническим языком.

## Стек
- React + Vite + TypeScript
- Tailwind CSS + shadcn/ui
- react-router-dom, TanStack Query, react-hook-form, zod, recharts

## Разработка
```sh
npm ci
npm run dev
```

## Деплой
- Фронтенд: Vercel (автодеплой из ветки `main`)
- CI: GitHub Actions — feature ветки → `dev` → `main` (после билда)
