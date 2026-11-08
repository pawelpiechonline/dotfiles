---
name: react
description: >-
  Build, refactor, and review React components (.tsx, .jsx) and hooks.
  Use for props, state, event handlers, effects, conditional JSX, lists, react-use,
  and separating data logic from views.
  Includes references for UI state with discriminated unions and compound components with context.
  Follow the typescript skill for TypeScript code.
paths: "**/*.tsx, **/*.jsx"
disable-model-invocation: false
---

Write clear React. Follow ../typescript/SKILL.md for TypeScript code.

## Components and state

- Write small function components with one job.
- Put each component in a file named after it.
- Do not change state, call handlers, or call the network during render.
- Put guard clauses first, derived values next, and rendering last.
- Define a type named Props above the component.
- Do not use React.FC.
- Read props in the function signature.
- Pass only needed data and callbacks, without exposing the data source.
- Start boolean prop names with is.
- Use children for composition, not data transfer.
- Store only changing values that affect rendering.
- Compute derived values from props or state instead of storing copies.
- Lift state only to the nearest parent that needs it.
- Keep values that always change together in one state value.

## Events and hooks

- Name handlers handleSomething.
- Name callback props onSomething.
- Define long handlers outside JSX.
- Pass these handlers as props.
- Use useEffect only to synchronize with systems outside React.
- List every value the effect reads in its dependencies.
- Return cleanup for subscriptions, timers, and requests that can outlive the render.
- Prefer react-use for common hooks instead of custom equivalents.
- Put fetching and other logic in hooks, not view components.
- Write custom hooks only for logic react-use does not cover.
- Name custom hooks useSomething.

## JSX

- Return early for loading, error, and empty states, including empty lists.
- Use guard clauses for more than two branches.
- Define JSX conditions as booleans named isSomething at the top of the component.
- Render each branch with its boolean and &&.
- Do not use ternaries or negation inside JSX.
- Look up known values in a const object instead of switch.
- Use local renderSomething helpers for repeated JSX in one place.
- Do not create components and props for one-off blocks.
- Use stable keys from the data.
- Do not use indexes as keys when lists can change.
- Read each reference below when the task matches.
- Follow the rules in each reference that applies to the task.

| File                     | Task                                        | Description                        |
| ------------------------ | ------------------------------------------- | ---------------------------------- |
| reference/state.md       | Model screens with several states           | Unions, transitions, and rendering |
| reference/composition.md | Build shared components or add region flags | Parts, context, and typed data     |
