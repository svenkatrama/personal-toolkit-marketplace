---
name: continue_visible_plan
description: Resume implementing a persistent visible plan file created by create_visible_plan. Takes the path to the plan file as an argument. Use when the user says "continue the plan", "resume this plan", "keep working on this plan", or invokes /continue_visible_plan <path-to-plan-file>.
---

# Continue Visible Plan

Resume work on a plan file previously created by the `create_visible_plan` skill, picking up
exactly where the last session (this one or a prior one) left off — with zero re-derivation
and zero duplicated work.

## Steps

1. Determine the plan file path from the argument following this skill's invocation. If no
   path was given, or the given path does not exist, ask the user for the correct path rather
   than guessing which file under `plans/` they mean.
2. Read the entire plan file — not just the checkboxes. Pay particular attention to:
   - Any "Decisions" section — treat every decision recorded there as settled; do not
     re-ask the user or re-derive something the file shows was already decided.
   - Status notes or dated progress entries describing blockers hit, how they were
     resolved, and partial progress on any step that isn't fully checked off.
   - The exact current state of the work: what's actually been built/changed so far
     (this can differ from what's checked off, if a step is partially done).
3. Cross-check the plan's claimed state against reality before acting on it: skim the files
   or code it says it touched to confirm they're in the state the plan describes. Plan files
   can drift out of sync with the actual repo state (e.g. from an interrupted session or
   manual changes outside the plan). If you find a mismatch, reconcile the plan file to match
   reality before proceeding, and note the discrepancy.
4. Identify the next unchecked item(s) as the remaining work. If a step is marked partially
   done, resume from precisely where the notes say it left off — don't restart that step from
   scratch.
5. If there are open questions recorded in the plan that block the next step, resolve them
   with the user before proceeding, rather than guessing.
6. Continue implementing the plan, following the same "keep the plan updated" discipline
   described in `create_visible_plan`:
   - Check off (`- [x]`) each step immediately upon completion — don't batch updates.
   - Record new decisions as they're made, with a short reason why.
   - Update status notes at natural checkpoints (after a step, after a decision, after
     resolving a blocker) so the file stays current enough to hand off at any moment.
   - If the plan's shape changes (a step becomes unnecessary, a new step is discovered,
     scope changes), edit the plan file to reflect that rather than letting it drift.
7. If you finish all remaining steps, mark the plan complete (e.g. a top-level "Status: Done"
   note) rather than leaving it looking mid-flight.

## Notes

- This skill only resumes work tracked in an existing plan file — it does not create new plan
  files. If the user wants to start tracking a new task this way, use `create_visible_plan`
  instead.
- Never treat the conversation history as authoritative over the plan file — if this is a
  fresh session, the plan file is the only source of truth for prior progress.
- Do not duplicate the plan's content elsewhere; keep the single plan file as the one living
  source of truth.
