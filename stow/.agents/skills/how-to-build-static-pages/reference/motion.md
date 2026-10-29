# Motion rules

Use motion to show a state or a link. Do not use motion as decoration.

## Setup

- Run npm install motion in the project.
- Run npx motion-ai for the current agent skill and setup.
- Import from motion for HTML or Astro. Import from motion/react for React.
- Read https://motion.dev/ before you write a new pattern. Do not use an old pattern from memory.
- Use CSS transitions for simple hover or focus states.
- Use Motion for springs, staggered animation, or values that change with time.

## Hover and press

- Animate only clickable elements on hover or press: buttons, links, nav items, and cards that open.
- Do not animate static headings, text, images, badges, logos, statistics, or cards on hover.
- Scale an image on hover only inside a link that opens the full card.
- Do not change the cursor on an element that does not click.
- Use 150 to 250 milliseconds for hover.
- Use a lift of 1 to 2 pixels, a scale from 1 to 1.02, or a small opacity change.
- Do not use a spring with a visible bounce. Use a short spring or a tween.

## Entrance

- Animate only the first screen or its first row of cards. Do not animate each section on scroll.
- Use 300 to 500 milliseconds for entrance.
- Use ease-out for entrance and ease-in for exit.
- Stagger items by 40 to 80 milliseconds. Do not stagger more than five items.
- Keep content visible without JavaScript. Keep the page usable if animation fails.

## Limits

- Animate transform and opacity only. Do not animate layout properties.
- Do not animate color and transform together. Use one change per element.
- Do not use parallax, constant floating, pulsing badges, bouncing icons, spinning elements, or animated gradients.
- Do not animate an element that also moves the layout.
- Do not block clicks during animation. Keep the focus ring visible.
- Follow prefers-reduced-motion. Remove movement, scale, and entrance animation when the user requests less motion.
- Keep opacity changes small or remove them under prefers-reduced-motion.

## Check motion

- Check that only clickable elements move on hover. Keep motion small and fast.
- Test with reduced motion and without JavaScript.
- Remove animation that does not help the reader.
