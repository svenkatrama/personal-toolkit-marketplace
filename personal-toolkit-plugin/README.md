# personal-toolkit-plugin

Personal Claude Code skills for cross-device / cross-account workflow continuity.

## Skills

- **create_visible_plan** — write a durable, human-readable plan file to `plans/` at the
  session's origin directory, kept updated with progress, decisions, and status as work
  proceeds.
- **continue_visible_plan** — resume a plan file created by `create_visible_plan`, picking
  up exactly where a prior session (this device or another) left off.
- **teach** — interactive Q&A-based learning session on any topic, with in-session
  repetition of missed concepts.

## Global preferences (auto-injected)

`global-preferences.md` holds the account-agnostic subset of personal `~/.claude/CLAUDE.md`
instructions (coding style, communication preferences, planning). `hooks/hooks.json` registers
a `SessionStart` hook that runs `cat ${CLAUDE_PLUGIN_ROOT}/global-preferences.md` at the start
of every session — Claude Code treats `SessionStart` stdout as visible context, and
`${CLAUDE_PLUGIN_ROOT}` resolves at runtime to wherever this plugin is installed, so no
account/machine ever needs to hardcode a path to this file.

This means a fresh account/device gets the same baseline behavior purely by installing this
plugin — no `~/.claude/CLAUDE.md` edits, no `@import` lines, no manual path setup. Any
machine-specific instructions (e.g. enterprise tooling notes) stay local to that machine's own
`~/.claude/CLAUDE.md` and are never part of this file.

## Debug logs (read on demand, not injected)

`global-preferences.md` also points Claude at a tiered set of debug logs for root-caused
environment/tool/config issues, so the same problem never gets re-debugged from scratch:
`global-debug.md` in this plugin (portable across every account/device), `~/.claude/user-debug.md`
(this machine/account only), and a repo-local file for project-specific issues. Unlike
`global-preferences.md`, none of these are part of the `SessionStart` hook — their content is
only pulled into context via `Read` when an agent is actually debugging something, so sessions
that never hit an environment/tool problem pay zero extra context cost. See
`global-preferences.md`'s "Persisting debugged issues" section for the full policy and entry
format.

## Install

Add this repo as a plugin source (e.g. via a personal marketplace, or a direct git-path
install if your Claude Code version supports it), then enable `personal-toolkit-plugin`. That
single install step wires up both the skills and the global-preferences hook — nothing else to
configure on that account/device.

Alternatively, clone this repo and symlink `skills/*` into `~/.claude/skills/` directly (note:
symlinking skills this way does not register the `hooks/hooks.json` SessionStart hook — that
requires an actual plugin install).
