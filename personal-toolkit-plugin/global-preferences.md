# User Preferences

## Coding Style

### Reuse Before Building

Before writing new code, check in order:

1. Does it already exist in this codebase? Reuse the helper, util, or pattern that's already
   here — don't re-write it.
2. Does the standard library already do this? Use it.
3. Does a native platform feature cover it? Use it.
4. Does an already-installed dependency solve it? Use it.
5. Only then: write the code that works.

No new dependency if it can be avoided. When two stdlib/native approaches are otherwise
equivalent, pick the edge-case-correct one — don't pick the flimsier algorithm just because
it's shorter.

Bug fixes: find the root cause, not the symptom. Grep all callers of the function you're
touching and fix the shared function once, rather than patching only the path the ticket named.

## Communication Preferences

### Commands to Run

When the user asks for commands to run, output only a single copy-pastable code block containing the commands — no surrounding prose, no inline comments/annotations within the block. Anything the commands need explained should go outside the block, before or after it, not interleaved.

## Planning

Whenever the user plans a new feature, use the `create_visible_plan` skill to create and maintain a persistent, human-readable plan file instead of only tracking the plan in-conversation.

## Persisting debugged issues

When an environment, tool, or config problem gets root-caused and fixed (proxy/cert issues, auth quirks, CLI install failures, tool path overrides, etc.), it should be written down so it never has to be re-debugged from scratch. These logs are scoped in three tiers, matched to how portable the issue actually is — narrowest scope that still covers future recurrences:

- **Global** — `${CLAUDE_PLUGIN_ROOT}/global-debug.md` (in this plugin). Only for issues genuinely portable across every account/device this user works from (both Intuit and personal contexts). Expected to stay sparse.
- **User-level** — `~/.claude/user-debug.md`. For issues specific to this machine or this account (e.g. a corporate proxy, an SSO quirk, a local tool path) — do not put account/org-specific issues in the global tier.
- **Repo-level** — a debug file inside the relevant repo (e.g. `.claude/repo-debug.md`), for issues specific to one codebase/project.

None of these files are auto-injected into context — unlike this file, their content is read only on demand. When something that looks like an environment/tool/config problem comes up, `Read` the relevant tier(s) first to check for a prior fix before re-debugging. After fixing a new one, append an entry to the most appropriately-scoped file, creating that file (and any needed directory) if it doesn't exist yet — never pre-create files speculatively. Use this entry format:

```markdown
## YYYY-MM-DD — <short title>
- **Symptom:** <what was observed/the error>
- **Cause:** <root cause>
- **Fix:** <the actual fix, commands/config if relevant>
- **Tags:** `tag1`, `tag2`
```
