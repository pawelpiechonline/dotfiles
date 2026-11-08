Use a discriminated union when screen states need different data or some values only make sense together.

- List valid states before implementation, such as idle, loading, error, and success.
- Give each variant a literal status and only its required data.
- Do not store booleans that repeat status.
- Use a boolean for two simple states, such as open and closed.
- Keep independent states separate, such as an export action and table loading.
- Store the union in one value named state.
- Replace the whole value on each transition.
- Model retained data explicitly instead of keeping old data by accident.
- Use nested flags only when the UI stays visible, such as isRefreshing inside ready.
- Check status before you render one variant or read its data.
- Do not use optional chaining or null fallbacks inside a known variant.
- Run the type check after you add a variant.
- Fix every place that does not handle the new variant.
- Test defined states, not all flag combinations.

```tsx
type AlertsState =
  | { status: "idle" }
  | { status: "loading" }
  | { status: "error"; error: Error }
  | { status: "success"; data: Alert[] };

const [state, setState] = useState<AlertsState>({ status: "idle" });

// Use these transitions in the request handlers.
setState({ status: "loading" });
setState({ status: "success", data: alerts });
setState({ status: "error", error });
```
