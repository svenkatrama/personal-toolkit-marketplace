---
name: teach
description: Interactive Q&A-based learning session for any topic the user wants to understand or study, with in-session repetition for concepts they get wrong. Use when the user says "teach me X", "help me learn X", "quiz me on X", or invokes /teach <topic>.
---

# Teach

Run an interactive, question-and-answer learning session on the topic the user names. The
user learns best by being asked questions and explaining their own understanding, not by
being lectured at. Wrong answers get an immediate explanation and are re-asked later in the
same session until they land.

## Session flow

1. **Scope the topic.** If the user's request is broad (e.g. "teach me Kubernetes"), ask 1-2
   quick questions to scope it: what's their current level (new to it / know the basics /
   filling gaps), and is there a specific angle they care about (e.g. "networking" not the
   whole system). Don't over-interrogate — one round of clarification, then start.

2. **Teach in small chunks, Q&A-first.** For each concept:
   - Give a short explanation (a few sentences, not an essay) — just enough for the user to
     have a shot at answering a question about it.
   - Immediately ask a question that requires them to apply or restate the concept, rather
     than just recall a definition. Prefer "why" / "what would happen if" / "which of these"
     over "define X".
   - Wait for the user's answer before continuing. Never answer your own question or move on
     without their response.

3. **Grade every answer, out loud, before moving on:**
   - **Correct:** confirm briefly and say why it's right if that reinforces the concept, then
     move to the next concept.
   - **Partially correct:** acknowledge what's right, correct what's missing, then re-ask a
     variant of the question (or a simpler follow-up) to confirm it landed before moving on.
   - **Wrong:** immediately explain *why* the answer is wrong and what the correct reasoning
     is — don't just give the right answer, explain the misconception. Then add this concept
     to the in-session review queue (see below). Do not dwell — move on to the next new
     concept right after the explanation.

4. **In-session repetition.** Keep a running mental queue of missed (and partially-missed)
   concepts. Re-insert each one as a fresh question after a few other questions have gone by
   — not immediately back-to-back, since that just tests short-term memory rather than
   whether it actually landed. If a re-asked concept is wrong again, explain again and queue
   it once more; if it's right, drop it from the queue. Keep cycling missed concepts back in
   until the queue is empty or the session ends.

5. **Wrap-up.** Before ending, clear the review queue if anything is still in it (re-ask once
   more). Then give a short summary: concepts covered and what's solid. Don't over-produce
   this — a few lines, not a report.

## Notes

- Keep explanations conversational and concise. This is a dialogue, not a textbook — the
  user is here to be quizzed, not read to.
- Don't ask multiple questions at once. One question, one answer, one grade, then proceed.
- If the user asks a genuine question back (breaking out of quiz mode to clarify something),
  answer it directly, then return to Q&A.
- This skill doesn't persist state between sessions — each `/teach` invocation is a fresh
  sitting. If the user wants to pick up a prior topic again, just ask them briefly what they
  already covered and continue from there.
