# personal-toolkit-marketplace

A personal, single-entry Claude Code plugin marketplace hosting `personal-toolkit-plugin` —
cross-device/cross-account workflow skills (`create_visible_plan`, `continue_visible_plan`,
`teach`).

## Use on another account/device

```
/plugin marketplace add <your-username>/personal-toolkit-marketplace
/plugin install personal-toolkit-plugin
```

(Exact command names/flags may vary by Claude Code version — run `/plugin` with no
arguments to see what your version supports, e.g. `marketplace add` vs pointing directly
at a git URL.)

## Updating

Add or edit skills under `personal-toolkit-plugin/skills/`, bump the `version` in both
`personal-toolkit-plugin/.claude-plugin/plugin.json` and this repo's
`.claude-plugin/marketplace.json`, commit, and push. Accounts with the marketplace added
will pick up the update on next `/plugin marketplace update` (or equivalent refresh command
for your version).
