# personal-toolkit-marketplace

A personal, single-entry Claude Code plugin marketplace hosting `personal-toolkit-plugin` —
cross-device/cross-account workflow skills (`create_visible_plan`, `continue_visible_plan`,
`teach`).

## Use on another account/device

From within a Claude Code session:

```
/plugin marketplace add <your-username>/personal-toolkit-marketplace
/plugin install personal-toolkit-plugin@personal-toolkit-marketplace
```

Or from a shell, using the `claude` CLI directly (verified working on v2.1.233):

```
claude plugin marketplace add <your-username>/personal-toolkit-marketplace
claude plugin install personal-toolkit-plugin@personal-toolkit-marketplace
```

(Exact command names/flags may vary by Claude Code version — run `/plugin` or `claude plugin
--help` to see what your version supports, e.g. `marketplace add` vs pointing directly at a
git URL.)

That's the entire setup on a new account/device — no `~/.claude/CLAUDE.md` edits, no
`@import` lines, no path configuration. The install registers both the three skills and the
`global-preferences.md` SessionStart hook (see `personal-toolkit-plugin/README.md`) in one
step; any machine-specific instructions (e.g. enterprise tooling notes) stay local to that
device's own `~/.claude/CLAUDE.md`, untouched by this plugin.

## Updating

Add or edit skills under `personal-toolkit-plugin/skills/`, bump the `version` in both
`personal-toolkit-plugin/.claude-plugin/plugin.json` and this repo's
`.claude-plugin/marketplace.json`, commit, and push. Accounts with the marketplace added
will pick up the update on next `/plugin marketplace update` (or equivalent refresh command
for your version).
