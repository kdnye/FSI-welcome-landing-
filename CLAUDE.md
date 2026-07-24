# CLAUDE.md — FSI-welcome-landing

Guidance for Claude Code working in this repo.

<!-- fsi-design-realignment: v1.1.0 aligned 2026-07-24 -->
## Design System — Fleet UI Kit v1.1.0 (FSI Brand Standard) — ALIGNED

**Status:** FSI-welcome-landing was realigned to the kit on 2026-07-24. Keep new UI on the
tokens below; do not reintroduce ad-hoc colors, fonts, or opaque status pastels.

**Where the tokens live:** `public/css/fsi.css` carries the kit primitives inline at the
top of the file, and is **byte-identical (modulo CRLF) to inbox-'s
`static/css/fsi.css`** — they are maintained as copies, so change one and change the
other or the two drift. `public/css/home.css` holds welcome-page-only styles and must not
hardcode hexes or font families. Both `index.html` and `404.html` carry their own
pre-paint theme script and font links; keep the two pages in step.

### Source of truth
- Local kit: `~/Repos/fleet-ui-kit/` — `tokens.css` (canonical), `foundations/`, `components/`, `CHANGELOG.md`
- Cloud: claude.ai/design -> **Fleet UI Kit** project
- Version: **v1.1.0 "FSI Brand Standard"** — palette/type measured from freightservices.net

### Light mode = FSI brand standard
- Accent (brand blue) `#2d6fb7` · hover / darkest blue `#1c53a1` · accent-subtle `#e9f1f9`
- Surface `#ffffff` · bg `#f2f2f2` · border `#d8d8d8` · text `#111111` · muted `#555555`
- Fonts: body/UI **Lato**; display headings **Bebas Neue** (`--font-display`)
- Status (semantic, keep): success `#16a34a` · warning `#d97706` · danger `#dc2626` · info `#0891b2`

### Dark mode (navy; blues from the site's darkest)
- bg `#0a1626` · surface `#10203a` · border `#1c3253` · text `#eaf1f9` · muted `#9db4d0`
- accent `#1c53a1` · accent-hover `#2d6fb7`
- Applies via `prefers-color-scheme` **and** `[data-theme="dark"]`

### Status-tint pattern (badges, pills, alerts)
- Fill = translucent status color, e.g. `rgba(22,163,74,.12)` — tracks the page in both themes
- In dark, lift labels to bright tints: active `#86efac` · idle `#fcd34d` · offline `#fca5a5` · maint `#67e8f9`
- Never use opaque light pastels — they float on the dark surface

### Realignment checklist
- [x] Adopt `tokens.css` values (import/copy the CSS vars; don't hardcode hexes)
- [x] Swap fonts to Lato (body) + Bebas Neue (display)
- [x] Add the dark block if missing; verify contrast in light AND dark
- [x] Convert status chips to the translucent status-tint pattern above
- [x] Keep operational status colors semantic — do not rebrand them
- [ ] If this app needs a component the kit lacks, add it to `~/Repos/fleet-ui-kit` and re-sync (`/design-sync`)

### FSI-welcome-landing-specific decisions
- `fsi.css` received the identical transformation applied to inbox-, since the two files
  are copies. CRLF line endings were preserved so the diff stays content-only.
- **`404.html` was loading `fsi.css` but no fonts at all**, so it silently fell back to a
  system stack while `index.html` rendered correctly. It now carries the same preconnects
  and font link. If you add a third page, give it the same head block.
- `home.css` hardcoded `"Bebas Neue"` in `.home-hero__title`; it now uses
  `var(--font-display)` so the page cannot drift from the token.

_Note added 2026-07-24 by Claude (Cowork); realignment completed 2026-07-24._
