---
name: how-to-use-react
description: Build and review React components (.tsx, .jsx) in a declarative style. Covers components, props, state, events, effects, and JSX, with reference files for tables, forms, API requests, composition, and context. Use when you write, change, or review React code.
paths: "**/*.tsx, **/*.jsx"
---

Write React that a reader understands on the first pass. Follow the how-to-use-typescript skill for all TypeScript code. This file holds the rules for every React task. Open a reference file when the task matches one, and follow both files.

## Approach

- A component is a function that returns JSX. Write one component in each file. Name the file after the component.
- Keep each component small. Give each component one job.
- Keep the render pure. Do not change state and do not call the network during the render.
- Read the component from top to bottom: guard clauses first, derived values next, the render last.
- Prefer the longer component when the longer component is easier to read and to maintain.

## Components and props

- Use type for props. Do not use React.FC.
- Name the props type Props. Put it above the component in the same file.
- Read the props in the function signature.
- Pass the smallest prop that the component needs. Do not pass a whole object when the component needs one field.
- Name a boolean prop with is. Example isDisabled.
- Use children for composition. Do not use children as a data channel.

## Model state

- Keep state to the values that change and that affect the render. Compute the rest.
- Derive a value from the props or the state. Do not mirror the value in state.
- Model a state that has several shapes with a discriminated union. Do not use several booleans for one state.
- Do not keep a boolean that only repeats a union case.
- Lift state to the nearest parent that needs it. Do not lift it higher.
- Prefer one state value over several values that always change together.

A union for a request:

```
type RequestState =
  | { status: "idle" }
  | { status: "loading" }
  | { status: "done"; items: Item[] }
  | { status: "failed"; error: string };
```

## Handle events

- Name a handler handleSomething. Example handleSubmit.
- Name a callback prop onSomething. Example onSubmit.
- Define a long handler in the component and pass it. Do not write a long inline arrow function in JSX.
- Pass the handler to the child as a prop. Do not call the handler during the render.

## Use effects

- Use useEffect only to synchronize with a system outside React: the network, the DOM, a subscription, or a timer.
- Do not use useEffect to compute a value. Compute the value during the render.
- Do not use useEffect to copy a prop into state. Read the prop.
- List every value that the effect reads in the dependency array.
- Return a cleanup function when the effect starts a subscription, a timer, or a request that can outlive the render.

## Prefer react-use

- Use the react-use library for a common hook. Do not write a custom hook that duplicates one.
- Use a react-use hook for a timer, an interval, a toggle, a debounce, a throttle, a window size, a media query, a local or session storage, a click outside, a copy to clipboard, an intersection observer, and the other common cases.
- Write a custom hook only for logic that react-use does not cover. Name the hook useSomething.

## Keep the data apart from the view

- Put the fetching and the other logic in a custom hook. Name the hook useSomething.
- Keep the component for the view. Keep the hook for the logic.
- Let the component receive data and callbacks as props. Do not let the component know where the data comes from.

## Write JSX

- Return early for the loading, error, and empty states. Use the same guard clause shape as the how-to-use-typescript skill.
- Do not use a ternary inside JSX for conditional rendering.
- Extract each condition into a boolean at the top of the component. Name it with is.
- Render each branch with its own boolean and &&. Example {isLoggedIn && <Home />} and {isNotLoggedIn && <Login />}. Do not negate a boolean inside the JSX.
- For more than two branches, return early with a guard clause.
- For a value from a known set, look it up in a const object. Do not use switch.
- For JSX that repeats and stays in one place, define a render helper function in the component. Name it renderSomething. Example renderListItem. Do not create a component, a props type, and a prop pass for a one-off block.
- Give each item in a list a stable key from the data. Do not use the array index when the list can change.
- Return a guard for an empty list before the list render.
