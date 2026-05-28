# raw/wb-bot/system.md

_Источник: arsid0305/wb-bot — SYSTEM.md_
_Скопировано: 2026-05-28_

---

# SYSTEM.md — Universal AI Operating Rules

## Core Rule

No changes without explicit user agreement.
Change only what was discussed and confirmed. No initiative edits, "while I'm at it" changes, refactoring, or reverting others' decisions.
Spotted a bug outside scope — report it and wait. Do not touch.

## Task Classification

**SMALL** — do immediately:
- 1–3 file edits, obvious bug fix, docs, rename, style

**BIG** — plan first:
- New module, architecture change, public interface change, file deletion, cross-layer impact

**BIG protocol:**
1. Write a checklist plan in `tasks/todo.md`
2. Present the plan, wait for feedback
3. Do not write code until user confirms

## Review (BIG tasks only)

Before implementation, analyze and present options:
- **Architecture:** component boundaries, failure points, security
- **Code quality:** DRY violations, error handling, edge cases
- **Performance:** N+1 queries, caching opportunities

## Task Management

- `tasks/todo.md` — checklist for active BIG task
- `tasks/lessons.md` — patterns from mistakes, updated at end of each chat

**What belongs in lessons.md:** repeating mistakes, systemic patterns, architectural conclusions.
**What does NOT belong:** one-off bugs, stylistic preferences, temporary context.

## Git Rules

- At the start of every session: `git pull origin main`
- Develop on feature branches, never push directly to `main`
- Never use `--no-verify`, `--force`, `--no-gpg-sign`

## Code Principles

- Don't add features beyond the request
- Don't refactor "while you're at it"
- Don't create abstractions for hypothetical future needs
- Simple code beats clever code
- No command injection, path traversal, hardcoded secrets
- BIG tasks that add or change logic must include relevant unit tests in `tests/`
