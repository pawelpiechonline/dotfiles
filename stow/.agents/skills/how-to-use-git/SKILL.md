---
name: how-to-use-git
description: Inspect repository changes and make safe commits. Use when you run Git commands, prepare a commit, or review repository history.
---

Follow project instructions when they differ. Protect user changes and keep commits small.

- Run git status --short and review relevant diffs before changing or committing files.
- Do not stage unrelated changes.
- Do not commit, stash, clean, reset hard, rewrite history, or force-push unless asked.
- Make one small commit per task.
- Use short, readable branch names, such as feat/user-login or fix/token-refresh.
- Use Conventional Commits: type: short imperative subject. (without scope)
- Keep commit subjects simple and short.
- Omit commit bodies unless needed or required by project instructions.
- Do not add Co-authored-by trailers or agent names.
- Run relevant tests and review git diff --cached before committing.
- Run git status --short after committing and report remaining changes.
