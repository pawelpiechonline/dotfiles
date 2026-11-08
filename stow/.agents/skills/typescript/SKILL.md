---
name: typescript
description: >-
  Write, refactor, and review TypeScript (.ts, .tsx) for frontend and backend code.
  Use for data types, discriminated unions, guard clauses, collection operations, naming,
  formatting, and environment validation with Zod.
  Applies to React TypeScript code together with the react skill.
paths: "**/*.ts, **/*.tsx"
disable-model-invocation: false
---

Write clear TypeScript. These rules also apply to the react skill.

- Describe results with declarative code, not manual indexed loops.
- Use map, filter, find, some, every, or reduce as needed.
- Prefer clarity and maintainability over fewer lines.
- Give each function one job.
- Keep data and behavior separate.
- Separate functions that change data from functions that make decisions.
- Use type, except when extending an interface or when a library requires one.
- Use string unions for known values, not enum or const enum.
- Use discriminated unions to prevent invalid combinations of fields.
- Give each variant a literal field that names its real state.
- Check that field before reading variant data.
- Do not add booleans that repeat the status.
- Check inputs first with early returns for invalid values.
- Use guard clauses instead of else or else if after return or throw.
- Keep the main path outside nested blocks.
- Do not use switch.
- Use clear English names.
- Do not use abbreviations, single letters, or prefixes and suffixes without meaning.
- Start boolean names with is.
- Name functions after their action or result.
- Name types after the things they model.
- Use braces for every block.
- Put the opening brace on the statement line.
- Put the closing brace on its own line.
- Put one statement on each line.
- Separate guard clauses with a blank line.
- Read the reference below when the task matches.
- Follow its rules when the task matches.

| File                     | Task                                          | Description                                        |
| ------------------------ | --------------------------------------------- | -------------------------------------------------- |
| reference/environment.md | Read process.env or configure the environment | Zod schema, typed env, startup errors, and secrets |
