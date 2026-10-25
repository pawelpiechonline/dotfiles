---
name: how-to-build-typescript
description: Write and review TypeScript files (.ts, .tsx) in a declarative style. Covers data modeling with unions, guard clauses, names, and formatting. Use when you write, change, or review TypeScript code.
paths: "**/*.ts, **/*.tsx"
---

Write TypeScript that a reader understands on the first pass. Aim for clarity, not for the smallest number of lines. This skill is the base for all TypeScript work. The how-to-build-react skill builds on it.

## Approach

- Write declarative code. Describe the result, not the steps. Use map, filter, find, some, every, and reduce instead of a manual loop with an index.
- Prefer the longer form of an implementation when the longer form is easier to read and to maintain. Do not trade clarity for a shorter line.
- Give each function one job. Give the function a name that says what it does.
- Keep data and behavior apart. Do not mix a function that changes data with a function that makes a decision.
- Let the types carry the rules. When a state must not happen, write the type so that the state cannot happen.

## Model data with types

- Use type instead of interface. Use an interface only when you extend it or when a library requires it.
- Do not use enum. Do not use const enum. Use a union of string values.
- Use a string union for a value from a known set.
- Use a discriminated union for a value that has more than one shape. Give each case one literal field that tells the cases apart. Check that field in every test.

A string union:

```
type RequestStatus = "idle" | "loading" | "done" | "failed";
```

A discriminated union:

```
type RequestState =
  | { status: "idle" }
  | { status: "loading" }
  | { status: "done"; items: Item[] }
  | { status: "failed"; error: string };
```

- Name each case after the real state. The status field is the discriminant. Do not add a boolean that repeats the status.

## Write control flow with guard clauses

- Test the input first. Return early when the input is not valid.
- Do not use else or else if after a return or a throw. Write a separate guard clause instead.
- Keep the main path of the function at the left edge. Do not put the main path inside a nested block.
- Do not use switch case.

Bad:

```
function getLabel(status: RequestStatus): string {
  if (status === "loading") {
    return "Loading";
  } else if (status === "done") {
    return "Done";
  } else {
    return "Idle";
  }
}
```

Good:

```
function getLabel(status: RequestStatus): string {
  if (status === "loading") {
    return "Loading";
  }

  if (status === "done") {
    return "Done";
  }

  return "Idle";
}
```

## Name values and functions

- Use simple English words. Make each name explain the value or the action. A reader must not guess.
- Start every boolean name with is. Examples are isLoading, isVisible, and isEmpty.
- Do not use one-letter names and do not use abbreviations.
- Name a function after what it does or what it returns. Examples are getUser, hasAccess, and canEdit.
- Name a type after the thing that it models. Examples are User and RequestState. Do not add a prefix or a suffix that adds nothing.

## Format the code

- Always use braces for a block, also when the block has one line.
- Put the opening brace on the same line as the statement.
- Put the closing brace on its own line.
- Put one statement on each line.
- Put a blank line between two guard clauses.

```
if (isReady) {
  run();
}
```
