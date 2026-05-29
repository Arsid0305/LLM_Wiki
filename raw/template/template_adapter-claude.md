# raw/template/template_adapter-claude.md

_Источник: arsid0305/template — adapters/CLAUDE.md_
_Скопировано: 2026-05-28_

---

# Claude Adapter

> Read after `SYSTEM.md`. Contains Claude Code-specific capabilities and rules.

## Capabilities

```
SUPPORTED:
- filesystem_rw
- terminal_access
- git_read
- git_push
- web_fetch
- multi_agent (subagents)

LIMITATIONS:
- no Supabase CLI locally
- no Deno locally
- no real .env in context
- no background persistent processes
```

## Subagents

| Model | When |
|-------|------|
| `haiku` | File search, grep, simple reads — fast and cheap |
| `sonnet` | Code writing, debugging — default |
| `opus` | Architecture, complex BIG-task analysis |

## Git Workflow

- Branch: `claude/<description>` — auto-merges to main via CI after tests pass
- PRs are optional, automerge triggers on push regardless
