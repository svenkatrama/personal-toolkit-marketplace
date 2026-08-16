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
