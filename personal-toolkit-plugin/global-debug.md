# Global Debug Log

Root-caused environment/tool/config issues that are genuinely portable across every
account and device this user works from (not specific to any one org, machine, or repo).
See `global-preferences.md`'s "Persisting debugged issues" section for the full tiering
policy and entry format. This file is read on demand — it is not injected into every
session's context.

Entry format:

```markdown
## YYYY-MM-DD — <short title>
- **Symptom:** <what was observed/the error>
- **Cause:** <root cause>
- **Fix:** <the actual fix, commands/config if relevant>
- **Tags:** `tag1`, `tag2`
```

No entries yet.
