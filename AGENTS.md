# Production Deployment Rules

- This is the canonical GO GO SHOP repository for `https://gogoshop.nz/`.
- Publish only from `gh-pages` and keep remote `main` on the same production commit.
- Keep `index.html` and `gogoshop.html` byte-identical.
- Do not deploy from `../online`, old workspace-root HTML files, temporary release folders, or retired worktrees.
- Do not change `store-config.js` or switch Supabase projects unless the user explicitly requests it.
- Stage only files required for the current request; preserve unrelated local changes.
