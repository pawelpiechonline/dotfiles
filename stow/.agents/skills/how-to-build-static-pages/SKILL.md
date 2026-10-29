---
name: how-to-build-static-pages
description: Build and review static marketing pages with one brand system. Covers BRANDING.md, typography, copy, images, Lucide icons, and Motion animation. Use when you create or change a static page.
paths: "**/*.astro, **/*.html, **/*.mdx, **/*.css, **/BRANDING.md"
---

Build static pages that look designed by a person. Keep one brand system across the project. Keep each page accessible and beautiful.

## Start with BRANDING.md

- Read BRANDING.md at the project root before you change a page.
- If the file does not exist, create it from BRANDING.template.md. Fill its fields from the project files.
- Ask the user only for values that the project files cannot supply.
- Use BRANDING.md as the only source for color, type, space, radius, shadow, tone, and images.
- Add missing values before use. Do not make values for one page.
- Keep the component set small. Use one button style, one card style, and one section rhythm.

## Build the page

- Give the page one audience, one message, one offer, and one primary action.
- Write the headline first. Select the layout for the message.
- Use few sections. Give each section one job.
- Read reference/visual.md for layout and style. Follow its Refactoring UI rules.
- Read reference/accessibility.md for every page. Keep the page usable and beautiful.
- Make the page work on phones and larger screens.
- Read reference/copy.md when you write or review copy. Use clear benefits, real proof, and consistent action labels.
- Read reference/assets.md when you add or change images or icons. Use local Unsplash photos and Lucide icons.
- Read reference/motion.md before you add or change animation. Use its Motion setup and CSS transition rules.
- Follow each reference that applies to the task.

## Review before you finish

- Compare the page with BRANDING.md and the other pages. Correct differences in shared styles and terms.
- Check the page on narrow and short screens.
- Test keyboard controls, focus, contrast, and alt text with reference/accessibility.md.
- Check image files and loading with reference/assets.md.
- Check animation with reference/motion.md. Test reduced motion and operation without JavaScript.
- Remove decoration and copy that do not help the reader.
- Read the copy aloud. Change sentences that sound like a template.

## Files

| File | Task | Description |
| --- | --- | --- |
| BRANDING.template.md | Create BRANDING.md | Brand fields and shared values |
| reference/visual.md | Build or review the layout | Refactoring UI, type, space, color, depth, and sticky |
| reference/accessibility.md | Build or review any page | HTML, keyboard, alt text, forms, and contrast |
| reference/copy.md | Write or review copy | Page structure, benefits, proof, and actions |
| reference/assets.md | Add or change images and icons | Unsplash, image files, and Lucide |
| reference/motion.md | Add or change animation | Motion setup, subtle animation, and reduced motion |
