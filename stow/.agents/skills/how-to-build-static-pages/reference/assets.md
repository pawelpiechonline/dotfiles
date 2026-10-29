# Image and icon rules

Keep image files in the project. Use the paths and styles from BRANDING.md. Follow reference/accessibility.md for image and icon labels.

## Images

- Use real photos from Unsplash. Download them into the project assets directory. Do not hotlink them.
- Name files page_section_description.webp or page_section_description.png.
- Use lowercase letters and underscores between parts. Use hyphens inside a part.
- Use the route for page, the block for section, and the content for description. Example: home_hero_dashboard.webp.
- Use webp for photos. Use png for graphics that need transparency. Use svg only for sharp logos or illustrations.
- Resize each image for its page size. Do not use a 4000 pixel image in a 600 pixel block.
- Compress images. Aim for less than 200 KB per photo in a content block.
- Set image width and height to prevent layout movement.
- Lazy-load images below the fold. Load the hero image early.
- Use the same light, crop, and finish across the project.
- Show the product, place, or person in context. Do not use fake laptop screens, handshakes, or charts.
- Record each photo source URL and author in BRANDING.md.

## Lucide icons

- Use Lucide as the only icon set. Select icons at https://lucide.dev/icons/.
- Follow the guide for the project framework. For Astro, use https://lucide.dev/guide/astro/.
- For Astro, run npm install @lucide/astro. Import icons from @lucide/astro.
- For React, run npm install lucide-react. Import icons from lucide-react.
- Import only the icons you use.
- Use sizes of 16, 20, or 24 pixels. Use one size per role.
- Use one stroke width across the project. Common values are 1.5 and 2.
- Match the icon color to nearby text. Use a different color only for a reason.
- Use icons only to help the reader find or understand content. Do not decorate headings with icons.
- Add text for an unusual action. Do not use an icon as its only label.
- Align the icon and text on the same baseline.

## Check the assets

- Check image names, dimensions, formats, loading, and alt text.
- Check the Lucide icons for consistent style and useful labels.
- Check page weight. Remove images and icons that do not help the reader.
