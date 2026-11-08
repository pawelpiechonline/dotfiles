Use props for values. Use parts for structure. Use context for shared behavior and identifiers.

- Keep simple prop APIs for small components or components used the same way everywhere.
- Replace flags that hide or replace regions with parts, such as Dialog.Header and Dialog.Body.
- Keep parts small.
- Give each part one job.
- Let each page select its parts.
- Let each page arrange its parts.
- Keep page-specific requirements and layout flags out of shared components.
- The call site must show the structure without requiring the reader to open the component.
- Create context in the parent component file with only fields the parts need.
- Keep context private to the parts.
- Do not export context for other components.
- Initialize typed context with null.
- Read shared behavior through a useSomething hook in each part instead of passing it through props.
- Throw a clear error when the hook finds null.
- Use props for data that does not need context.
- Check union status in container parts.
- Pass narrowed data from container parts to leaf parts.
- Give leaf parts only the data they render, not the whole screen state.
- Do not add optional fields that only one status uses.
- Add new appearances as new parts, not shared flags.
- Add status branches only where those states appear.

```tsx
type DialogContextValue = {
  close: () => void;
  titleId: string;
};

const DialogContext = createContext<DialogContextValue | null>(null);

function useDialog() {
  const value = useContext(DialogContext);

  if (value === null) {
    throw new Error("Dialog parts must be used inside Dialog");
  }

  return value;
}
```
