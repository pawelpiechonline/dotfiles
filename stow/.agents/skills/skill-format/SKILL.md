---
name: skill-format
description: Create and rewrite the user's skills in ASD-STE100 Simplified Technical English. Use this skill for a new skill or a change to an existing skill. Manual use only.
disable-model-invocation: true
---

The user gives a skill name, a skill path, or a request for a new skill. Find or create the skill. For a rewrite, keep the meaning and the rules. Write all text in ASD-STE100 Simplified Technical English. Save tokens. Do not lose quality.

- Write short sentences. Use 20 words or less in a procedure sentence and 25 words or less in a descriptive sentence.
- Write one direct order in each sentence. Use the active voice and the simple present tense.
- Use the same word for the same meaning. Do not use a synonym.
- Use must for a requirement, can for a possibility, and do not for a prohibition.
- Do not use difficult words. Do not put more than three nouns together.
- Write the shortest text that keeps the full meaning. Delete a word or a sentence when it does not change the result.
- Do not repeat a rule. Write as a colleague writes. Do not write a summary, praise, or filler.
- Write for a small model. Repeat a word when the meaning must stay clear.
- Keep every instruction and its meaning. Change behavior only when the user asks.
- Write description that tells what the skill does and when to use it. On a rewrite, keep its meaning and style.
- Keep the frontmatter fields and their values. Change description only.
- Write plain text. Do not use bold, italics, or backticks. Write paths and commands as plain text.
- Use a fenced code block only for code, and only when the skill needs an example.
- Keep this shape: a short introduction, then a list of rules.
- Use a header only when necessary. Do not use one in a short skill.
- Use steps only for actions in an order. Write each step as a level 2 header. Put its rules under the header.
- If the skill has more files, add one table after the rules with file, task, and description columns.
- For a new skill, ask for the name, task, and when to use it. Ask only for missing information. Use a lowercase name with hyphens. Create the directory and SKILL.md with frontmatter. Add files only when necessary.
- Before you edit, read the full skill and its files. Edit SKILL.md in place.
- Show the new or changed SKILL.md to the user.
