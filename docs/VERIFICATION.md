# Verification and behavioral simulations

Date: 2026-11-06. This is a release-check record, not a claim that every model/platform has been exercised. The three scenarios below are authored protocol walkthroughs; no external model calls or independent subagent evaluations were used.

## Structural and executable checks

The reproducible structural command is `powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1`. ExecutionPolicy Bypass applies only to that process; no machine/user policy is changed. Respect organization-managed restrictions if they disallow it; use an approved PowerShell host instead.

| Check | Observed result |
|---|---|
| SKILL.md size and description | PASS: 74 lines, 519 description characters |
| Bundled skill-creator quick_validate.py | PASS: Skill is valid; executed with workspace-local PyYAML 6.0.3 |
| Static resources and local Markdown links | PASS: 56 local links resolve after publication preparation; curriculum paths resolve |
| Original curriculum preservation | PASS: all 28 source hashes match after reversing path relocation and normalizing line endings |
| Progress frontmatter and snapshot | PASS: parsed as YAML; required keys present; snapshot below 60 lines; fixed template sections below 120 lines |
| Import wrappers | PASS: both contain only @AGENTS.md |
| PowerShell syntax | PASS: installer and verifier parsed; verifier executed |
| PowerShell installer | PASS: three targets, hash-identical copies, repeated install, paths containing spaces |
| Bash installer under Git Bash on Windows | PASS: three targets, hash-identical copies, repeated install, native Windows destination converted to POSIX |
| Installer conflict behavior, both scripts | PASS: a modified Gemini copy is preserved; all-target preflight fails before creating the missing Claude target |
| Scoring policy boundary examples | PASS: all-2 scores, foundational ceiling despite high total, early stop, T6 safety ceiling, gate threshold/critical-zero/pending-execution/unmet-contract cases |
| Placement T1 A/B snippets | PASS: compiled and ran using locally installed .NET SDK 9.0.318; outputs 0 and 2 respectively |
| Fresh Codex/Claude/Gemini model sessions | NOT RUN; documented discovery only |
| EF queries, SQL plans, infrastructure labs | NOT RUN against live dependencies; task keys reviewed statically |

The SDK version above records the available test environment, not a recommendation of the latest supported runtime. No network package restore was needed for the two console snippets. Runtime scaffolding was temporary and is not shipped as trainee solutions.

Initial checks exposed a Git Bash Windows-path/root-walk issue, corrected with cygpath normalization where available and a stable-parent stop rule. Git Bash subprocesses needed execution outside this environment's sandbox; copies remained in disposable workspace folders. PowerShell execution policy was handled per process. The Python dependency was installed only in the temporary validation folder. The console restore initially encountered a restricted user NuGet configuration; the rerun used a temporary process-local app-data directory and explicit empty package sources. These are test-host adjustments, not changes to the repository's tool requirements or global user configuration.

Check scope: frontmatter, entrypoint size, relative references, track preservation, template schema, one-line imports, PowerShell parsing, installer copies/idempotency/conflict behavior, scoring boundary walkthroughs, and the two T1 C# snippets. SQL Server, EF provider execution, infrastructure labs, and end-to-end Claude/Gemini sessions are outside the executed checks. See TOOL-COMPATIBILITY.md for documentation evidence.

## Scenario A: brand-new trainee

Input: "I am new. Start placement." No progress file or snapshot; file access available. Expected: do not teach the endpoint or show six tasks; initialize a record only for this confirmed new learner and ask the first unscored intake question. No level assigned.

First mentor message:

> We'll start with a short, unscored intake, then one coding task at a time. Placement takes about 90 active minutes and can be split across sessions; if the early tasks show that foundations are the right start, we'll stop there. I won't give hints during the assessment, and your work will determine the starting level. What training alias would you like to use? Please avoid your real name.

Trace: mode=intake; level=null; next_action=ask alias; no answer key or solution exposed. Save the confirmed-new template with the pending intake checkpoint. Subsequent intake questions are separate turns, not a multi-question form.

## Scenario B: returning trainee with PROGRESS.md

Synthetic fixture: alias trainee-07, language English, revision 12, level 2, mode lesson; open exercise EF-04, stage revision; contract: first 20 patients by Id with appointment counts as DTOs; last attempt executes CountAsync inside a loop; help rung 1; runtime evidence pending; next action: await revised LINQ and SQL. No gate was passed for this exercise.

First mentor message:

> Welcome back, trainee-07. We stopped at EF-04: your endpoint still runs a count query for each patient. Your next step is to submit the revised LINQ for the first 20 patients ordered by Id, returning DTOs with appointment counts, along with the generated SQL and run output. You already received one guiding question; execution is still pending. Send your revision when you're ready.

Trace: preserve level, variant history, help rung, and exercise ID; no new placement, intake, solution, or unrelated exercise. If the referenced code file is missing, request that artifact rather than inventing its contents.

## Scenario C: pasted Resume Snapshot, no file access

Fixture: the synthetic snapshot in progress-schema.md (revision 4, trainee-07, OOP-02, awaiting_attempt). No filesystem tools. Expected: restore it; explicitly avoid a disk-save claim; ask for the existing attempt, not another intake.

First mentor message:

> I've restored your snapshot at revision 4. You're continuing OOP-02 at Level 0: create an Appointment that rejects zero or negative duration and accepts 15 minutes, then run those three cases. We're waiting for your constructor attempt and output; no hints have been used. I can't save files in this chat, so I'll provide an updated Resume Snapshot at the next checkpoint. Paste your attempt when you're ready.

Trace: do not repeat placement; preserve previous exposed form A, weak spot W1, and revisit date. At the lesson end emit exactly one snapshot code block under 60 lines, with incremented revision and actual outcome. Do not invent code that was not included in the snapshot.

## Adversarial protocol walkthroughs

| Input/state | Required result |
|---|---|
| Exam learner asks for a hint | No hint while scoring; offer to end the attempt and switch to teaching, mark exposure |
| High total with T1 criterion below 2 | Ceiling L0 wins over score band; targeted foundational remediation |
| SQL Server unavailable | Suspend runtime-dependent scoring or mark provisional; never call a plan executed |
| Same weak task passed twice today | Keep weak spot open; different-day rule not met |
| File alias differs from snapshot alias | Ask one blocking identity/state question; don't merge |
| Previously exposed A and B retest | New calibrated C or provisional uncalibrated form; never reuse A/B as independent evidence |
| User asks to edit this skill | Treat as product maintenance, not enrollment |
| Installer encounters modified installed skill | Fail before copy; retain custom content |

## Interpretation limits

The rubric is an explicit training policy, not a statistically validated assessment instrument. A/B forms share objectives and scoring but need cohort calibration for difficulty equivalence. Gates require fresh concrete fixtures and verification before administration. Textual simulations validate the designed flow; actual model adherence and host discovery still need real-user trials. No fabricated compatibility badge, benchmark, or trainee result is implied.
