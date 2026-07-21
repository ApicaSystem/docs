# docs — PR Review Context
Context for reviewing PRs in ApicaSystem/docs. Read alongside the org-wide review rules.

## What this is
- Documentation site for **Apica Ascent** (the observability / telemetry-pipeline platform: Flow, Observe, Fleet Management, Data Sources, Autonomous Insights, Lake, Data Management, Admin, Integrations).
- Built and published by **GitBook** via Git Sync (commits arrive as `GITBOOK-NNNN`; edits also come as normal PRs).
- **No build tooling in-repo**: no `package.json`, no Node/npm/yarn, no static-site generator config. GitBook renders and hosts the site remotely — there is nothing to install, build, or serve locally.
- Content is authored in **Markdown** (`.md`, ~900 files). No MDX.

## Layout
- Content: top-level product dirs (`flow/`, `observe/`, `fleet-management/`, `data-sources/`, `autonomous-insights/`, `admin/`, `integrations/`, `product-overview/`, `getting-started/`, etc.); each dir uses `README.md` as its section landing page.
- `SUMMARY.md`: the table of contents — defines site navigation order and sidebar titles. Pages not listed here don't appear in nav.
- `README.md`: the site's home page.
- `.gitbook/assets/`: images and uploaded files (referenced as `../.gitbook/assets/...`).
- `.gitbook/includes/`: reusable content snippets embedded into pages.
- Page frontmatter: YAML with GitBook keys (`description`, `icon`, `title`, `layout`).

## Build / conventions
- No build/serve commands — publishing happens on push through GitBook Git Sync. Don't expect (or ask for) CI build steps, `npm run`, or a dev server.
- Content uses **GitBook-flavored Markdown**: `{% hint %}`, `{% code %}`, `{% embed %}`, `{% file %}`, `{% content-ref %}` blocks, plus raw HTML like `<table data-view="cards">` and `<mark>`. These are valid GitBook syntax, NOT Jekyll/Liquid/MDX errors.
- Links are relative repo paths ending in `.md` (e.g. `data-sources/overview.md`); images live under `.gitbook/assets/`.
- Filenames are GitBook auto-slugged and may not match the visible title, and duplicates get `-1` suffixes (e.g. release-note pages) — this is expected, not a mistake.
- No linter / formatter config (`.editorconfig`, prettier, markdownlint all absent).

## Review focus (priority order)
This is a docs repo — weight review toward content integrity, not code:
1. **Broken links / refs** — relative `.md` links, `SUMMARY.md` entries, `{% content-ref %}` / `{% embed %}` targets, and `.gitbook/assets/` image paths that point at missing files.
2. **Broken rendering** — malformed YAML frontmatter, unclosed/mismatched `{% ... %}` blocks (`hint`/`code`/`file`), broken tables or HTML that would fail to render on GitBook.
3. **Correctness of documented commands/examples** — wrong flags, endpoints, config keys, or code snippets a reader would copy-paste.
4. **Accidental secrets / internal-only info** — tokens, credentials, private hostnames/URLs, or content flagged internal (e.g. "Internal Release") that should not be public.
5. **Custom component / JS correctness** — only if a PR touches any (rare here).

## Do NOT flag (known-intentional)
- `node_modules/`, build output (`build/`, `dist/`, `public/`, `_site/`), generated search indexes, lockfiles — none should be present; ignore if they appear.
- `{% ... %}` tags and inline HTML — GitBook syntax, not bugs.
- Filename/title mismatches and `-1` suffixed filenames — GitBook slugging.
- Missing `package.json` / build config / CI build — by design; GitBook builds remotely.
- Prose style, tone, grammar, or wording nitpicks — it's documentation; do NOT bikeshed writing.
