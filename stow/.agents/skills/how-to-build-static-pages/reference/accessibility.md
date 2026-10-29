# Accessibility rules

Use these rules on every page. Keep the page accessible and beautiful.

## HTML

- Use semantic HTML: header, nav, main, section, footer, button, a, ul, and form.
- Use a button for an action. Use a link for navigation. Do not use a div as a button.
- Use one h1 per page. Do not skip a heading level.
- Set html lang. Give the page a descriptive title.
- Give each form field a label. Do not use a placeholder as the only label.
- Show errors in text. Do not use color alone to show an error or a state.
- Use a target of at least 44 by 44 pixels.

## Keyboard

- Make each control reachable with Tab. Keep the focus order the same as the visual order.
- Keep a visible focus ring. Replace the outline if you remove it.
- Add a skip link to the main content at the start of the page.
- Use Enter or Space to activate a button. Use Enter to follow a link.
- Let Escape close a menu, dialog, or popover.
- Move focus into an open dialog. Return focus to the trigger when the dialog closes.
- Do not trap focus. Do not use a positive tabindex.
- Use native controls when possible. Make a custom control work like the native control.

## Images and icons

- Give each image alt text for its content or function. Use empty alt text for a decorative image.
- Give the destination in the alt text of a linked image.
- Keep alt text to one short sentence. Do not include image, photo, or a file name.
- Add a caption for a long description.
- Give an icon-only button an aria-label. Hide decorative icons with aria-hidden.

## Contrast and appearance

- Use at least 4.5 to 1 for body text and 3 to 1 for large text.
- Use the palette from BRANDING.md. Do not add a color only to increase contrast.
- Keep the palette natural. Do not increase contrast above the minimum if the page looks harsh.
- Put a plain surface or a subtle overlay behind text on a photo.
- Use a clear focus ring that fits the brand. Do not add heavy outlines or strong colors for a checker score.
- Keep the page usable and beautiful. Do not add visual changes that do not help the reader.

## Check the page

- Test with a person. Use a keyboard and a screen reader.
- Tab through the page. Check focus order and visibility. Activate each control. Check for focus traps.
- Check text contrast and the primary button. Check alt text and form errors.
