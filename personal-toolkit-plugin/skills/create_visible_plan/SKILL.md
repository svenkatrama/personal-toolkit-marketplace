---
name: create_visible_plan
description: Create a persistent, human-readable plan file in a plans/ directory at the root of the directory the Claude session originated from, and keep it updated with progress as work on it proceeds. Use when the user says "create a visible plan", "save this plan", or invokes /create_visible_plan with plan instructions/requirements, so the plan can be revisited across sessions and reflects current status.
---

# Create Visible Plan

Write the plan the user describes (in the text following this skill's invocation) to a
markdown file under a `plans/` directory, so it's readable and revisitable across sessions —
independent of Claude Code's internal plan-mode state.

## Steps

1. Determine the origin directory: the directory the current Claude session was started from
   (the initial working directory of this session, not any directory you may have `cd`'d into).
2. Check whether `plans/` exists at that origin directory. If not, create it.
3. Choose a filename that clearly and specifically describes the plan's subject, in
   kebab-case, e.g. `plans/migrate-auth-to-oauth2.md`. Do not use generic names like
   `plan.md` or `notes.md`. If a file with that name already exists, pick a more specific
   name rather than overwriting it, unless the user is clearly asking to update that
   specific existing plan.
4. Write the plan to that file as clean, well-structured markdown:
   - A top-level heading with the plan's title.
   - A brief summary/goal line.
   - The requirements and instructions the user gave, organized into logical sections
     (e.g. Goals, Requirements, Steps, Open Questions) — do not just dump the raw request
     verbatim; structure it for future readability.
   - Use checkboxes (`- [ ]`) for concrete action items so progress can be tracked over time.
5. Confirm to the user the full path of the file you created.

## Keeping the plan updated

The plan file is not a one-time snapshot — it is the living source of truth for progress on
this work, across this session and any future session that picks it back up. Treat every
update as if you are handing the task off to a completely different agent with no memory of
this conversation: that agent must be able to resume seamlessly, with zero duplicated work,
using only what's written in the file.

- Whenever you (in this session, or a future session resuming this work) complete a step
  from the plan, check it off (`- [x]`) in the plan file immediately — don't batch updates
  or wait until the end of the task.
- If the plan changes shape (a step is no longer needed, a new step is discovered, scope
  changes), edit the plan file to reflect that, rather than letting it drift out of sync
  with reality.
- Record every decision as it's made, not just steps. Any time you or the user settles a
  question — a design choice, a trade-off, a rejected alternative, a naming/format/approach
  decision — write it into the plan (a "Decisions" section works well) along with a short
  reason why. A future agent should never have to re-derive or re-ask something that was
  already decided.
- Capture anything else a fresh agent would need to continue without re-discovering it or
  redoing it: current state (what's actually been built/changed so far, not just what's
  checked off), file paths touched, blockers hit and how they were resolved, open questions
  still unresolved, and exact next steps. If a step is partially done, say precisely what
  part is done and what remains — don't leave a checkbox unchecked with no indication that
  work already started, since that risks the next agent redoing it from scratch.
- Update the plan file at natural checkpoints throughout the task, not only at the end —
  after completing a step, after making a decision, after hitting and resolving a blocker.
  The goal is that the file is always current enough that work could stop at any moment
  and resume cleanly from it alone.
- If useful, add brief status notes (e.g. a short "Status" line or dated progress note)
  when a step's outcome isn't obvious from the checkbox alone — e.g. blockers hit, decisions
  made, or why a step was skipped.
- Before starting work on a task that has an associated plan file under `plans/`, read the
  entire file first — not just the checkboxes, but the Decisions section and any status
  notes — to pick up every piece of context the prior session left, and treat unchecked
  items as the remaining work. Do not re-ask the user something the file shows was already
  decided, and do not redo work the file shows was already done.

## Notes

- This is about durable, on-disk documentation the user can open in any editor and revisit
  in a future session — it is not the same as Claude Code's built-in ExitPlanMode/plan-mode
  feature, and should not be confused with it.
- Do not create documentation elsewhere or duplicate the plan in multiple files.
- If the user's instructions are ambiguous about scope, ask a clarifying question before
  writing the file rather than guessing.
