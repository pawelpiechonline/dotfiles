---
name: how-to-use-git
description: >-
  Inspect repository changes and make safe commits.
  Use when you run Git commands, prepare a commit, or review repository history.
---

Follow project instructions when they differ. Protect user changes. Keep commits small.

- Run git status --short before you change or commit files.
- Review relevant diffs before you change or commit files.
- Do not stage unrelated changes.
- Do not commit, stash, clean, reset hard, rewrite history, or force-push unless asked.
- Make one small commit per task.
- Use short, readable branch names, such as feat/user-login or fix/token-refresh.
- Use Conventional Commits in this format: type: short imperative subject.
- Do not include a scope.
- Keep commit subjects simple and short.
- Omit commit bodies unless needed or required by project instructions.
- Do not add Co-authored-by trailers or agent names.
- Run relevant tests before you commit.
- Review git diff --cached before you commit.
- Run git status --short after you commit.
- Report remaining changes.
