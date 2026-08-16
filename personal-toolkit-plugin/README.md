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

## Install

Add this repo as a plugin source (e.g. via a personal marketplace, or a direct git-path
install if your Claude Code version supports it), then enable `personal-toolkit-plugin`.

Alternatively, clone this repo and symlink `skills/*` into `~/.claude/skills/` directly.
