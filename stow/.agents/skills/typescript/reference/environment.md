Validate environment variables once before the service starts. Validation does not hide secrets.

- Use a simple check for a small script with one environment variable.
- Do not use a schema when there are no environment variables.
- Keep EnvSchema and the parsed env object in env.ts.
- Read process.env only in env.ts.
- Other files must import env without repeating conversions.
- Define required values and their formats in one Zod object schema.
- Use non-empty strings, number coercion, integer checks, and known key prefixes where needed.
- Put defaults next to validation rules for values that can be absent.
- Require values that have no defaults.
- Do not mark required values as optional.
- Use safeParse before the service listens or starts work.
- Print the failed variable and rule, not values or the parsed object.
- Exit with a non-zero status on failure.
- Throw errors in tests instead of exiting.

```ts
import { z } from "zod";

const EnvSchema = z.object({
  PORT: z.coerce.number().int().default(3000),
  POSTGRES_PASSWORD: z.string().min(1),
  OPENAI_API_KEY: z.string().startsWith("sk-"),
});

const parsed = EnvSchema.safeParse(process.env);

if (!parsed.success) {
  console.error(z.prettifyError(parsed.error));
  process.exit(1);
}

export const env = parsed.data;
```
