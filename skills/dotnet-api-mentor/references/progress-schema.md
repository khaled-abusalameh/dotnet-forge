# Progress schema and resume protocol

## Storage contract

Use one trainee-controlled workspace per alias. State is `learning/PROGRESS.md`, relative to that workspace, never the installed skill. Before teaching in every chat, read it or the supplied snapshot. Do not enumerate other trainees' directories. No file does not mean no history: ask a returning learner for their snapshot or last checkpoint. Only initialize a confirmed new record from [the template](../assets/PROGRESS.template.md).

Keep the file at most 120 lines. Use UTF-8, YAML frontmatter, then the EXACT eight headings in the template, in that order. Do not add free-form top-level sections. Additional evidence may live in ignored `learning/evidence/` files, but the current prompt, criteria, stage, and next action must remain sufficient to resume without old chat access. Never store secrets, real names, contacts, patient data, access tokens, or unsanitized production logs.

Frontmatter keys are required. `schema_version` is integer 1; `revision` is a nonnegative integer incremented per write. `alias`, `language`, `timezone`, and `updated_at` are strings or null during intake; timestamps use ISO 8601 with an explicit offset. `mode` is intake, placement, lesson, review, gate, or paused. `level` is null or integer 0-5. Intake fields record experience, positive hours per week, goal, and environment (OS, SDK, editor, SQL/container access, frontend preference, tool limitations), each null until answered. Ask timezone with environment; never infer locale from a filesystem path.

`placement` always has status (not_started, in_progress, complete, stopped, provisional, invalidated), variant, next_task, scores, elapsed_minutes, used_variants, and retry_after. Each scores item is `{task: T1, criteria: [0,0,0,0], evidence: "short quote/ref", execution: "pending"}`. Use null criteria for unassessed tasks, not fabricated zeros. Used variants include all exposed forms, including invalidated attempts. Store current assessment responses in sanitized evidence files when available; keep each score's evidence excerpt in the record. Never lose task completion or elapsed time between sittings.

## Fixed sections

`Where we stopped` contains the last completed action and one next action. `Open exercise` records ID, exact bounded prompt and acceptance criteria, stage (awaiting_attempt, reviewing, revision, twist, explain_back, or none), latest attempt excerpt or evidence path, help rung, and execution status. Only one exercise is open. For a large artifact, preserve its contract plus a stable file reference; ask for that file if absent in a future chat instead of resetting.

`Level and gate status` records placement raw score, evidence ceiling, starting level, provisional status, and each attempted gate's variant, per-criterion scores, evidence, pass/fail, and retry date. Placement never marks gates passed. `Tracks table` uses track, status, evidence, next; unlisted tracks are not_started. `Weak spots` uses stable ID/topic, concrete evidence, independent-pass dates, and revisit date.

`Capstone milestones` records CRUD, auth, tests, audit trail, and deployment with status and evidence; add milestones as needed on compact lines. `Last 10 session lines` contains date, topic, assistance/evidence, result, next. Before adding an eleventh line, summarize the oldest into `Archive summary`. Preserve historical passed gates, used assessment variant IDs, and unresolved risks during compaction.

Remove a weak spot only after TWO independent passes on different calendar days in the trainee's recorded timezone. An assisted answer, repeated identical task, or merely saying "I understand" does not count. Record closure evidence in archive summary. First revisit is normally 2-3 days after the lesson, second at least one day later; adapt to intake availability and preserve actual dates.

## Write and recovery protocol

Save after every lesson, assessment section, completed review, and before waiting on a newly issued exercise. Read before write; verify alias and revision have not changed. If changed, reconcile without discarding concurrent updates. Write a temporary sibling then replace the state file if supported; otherwise write and read back to verify. If any write fails, say so and emit a snapshot instead. Do not claim persistence on an attempted write alone.

Unknown schema versions require a non-destructive migration proposal; do not overwrite them. For legacy prose records, retain all known evidence, mark missing values unknown, and migrate without inventing passed gates. For a file/snapshot conflict, prefer a demonstrably newer revision of the SAME alias only if its history is consistent; otherwise ask one blocking question. Dates alone do not prove which record is correct.

## Snapshot Mode

Without filesystem access, read the supplied Resume Snapshot before intake. At the end of EVERY lesson, and after assessment/checkpoint changes, print exactly one fenced YAML Resume Snapshot of at most 59 total lines including fences. The `snapshot` command does this in File Mode too. State that it was not saved to disk. The trainee must keep and paste it in the next chat; continuity cannot be guaranteed if they lose both file and snapshot.

Required snapshot keys: schema_version, revision, alias, language, timezone, updated_at, mode, level, intake, placement, checkpoint, next_action, open_exercise, gates, tracks, weak_spots, milestones, sessions, archive. Use compact flow mappings where appropriate. Same types and semantics as File Mode; include task scores, used variants, help rung, and pending execution. Keep open_exercise's prompt, criteria, attempt excerpt, stage, and next action intact. Compact old sessions before current state. A missing large code artifact is requested explicitly; never hallucinate its contents.

Example shape (illustrative synthetic state, not an actual assessment):

```yaml
schema_version: 1
revision: 4
alias: trainee-07
language: English
timezone: Asia/Amman
updated_at: '2026-11-06T14:00:00+03:00'
mode: lesson
level: 0
intake: {experience: beginner, hours_per_week: 4, goal: CRUD API, environment: '.NET CLI; SQL unavailable'}
placement: {status: stopped, variant: A, next_task: null, scores: [{task: T1, criteria: [1,1,0,0], evidence: 'Aliasing prediction incorrect', execution: trainee-reported}], elapsed_minutes: 10, used_variants: [A], retry_after: null}
checkpoint: Encapsulation explanation complete
next_action: Await constructor attempt and run output
open_exercise: {id: OOP-02, stage: awaiting_attempt, prompt: 'Create Appointment with a positive duration invariant', criteria: 'Reject zero/negative; accept 15; run all three cases', attempt: none, assistance: 0, execution: pending}
gates: []
tracks: {oop: in_progress}
weak_spots: [{id: W1, topic: invariants, evidence: 'Public setter allowed zero', passes: [], revisit: '2026-11-09'}]
milestones: {CRUD: not_started, auth: not_started, tests: not_started, audit: not_started, deployment: not_started}
sessions: ['2026-11-06: encapsulation explained; awaiting attempt']
archive: 'No passed gates; no other used variants'
```

## Summaries and planning

`where am I` reports the level with its evidence limits, open exercise, due weak spots, and next action. `weekly review` uses actual dated entries; if fewer than seven days exist, say so. Plan within hours_per_week, prioritize weak prerequisites, and interleave one exercise at a time. Never infer improvement from elapsed time alone.
