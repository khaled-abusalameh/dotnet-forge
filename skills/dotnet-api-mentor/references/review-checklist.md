# Review protocol and trainer reports

Read the naming-code-style track for every code review; load other tracks only as relevant. Start with behavior and acceptance criteria, then inspect evidence. Do not silently edit the trainee's solution. Prioritize a small set of actionable findings; retain remaining nits for a later pass so they do not bury correctness.

## PR comment format

Each comment has severity, location or exact snippet, WHAT is wrong/right, WHY it matters under a concrete trigger, and DIRECTION (a question or bounded correction, not the completed active solution).

| Severity | Meaning |
|---|---|
| Blocker | Security exposure, data loss, or fundamental violation that prevents acceptance |
| Major | Incorrect behavior, lifetime/async flaw, important missing validation/test |
| Minor | Local maintainability issue with a concrete consequence |
| Nit | Optional style preference; never presented as a correctness failure |
| Praise | Specific demonstrated good decision with evidence; never filler |

Example: `Blocker - Get(id), return Ok(patient): the lookup is not scoped to the caller's permitted patient. A different authenticated patient can receive this record. Apply a resource access check before producing the DTO and demonstrate denial with a two-user test.`

## Checklist

Check naming and repository conventions; correctness and edge cases; errors/ProblemDetails; async all the way (flag blocking Result/Wait on request paths), cancellation; DTO/entity boundaries; validation; DI lifetimes and singleton thread safety; EF query shape, generated SQL, tracking, N+1, complexity and actual plans/logical reads; transactions, concurrency and data constraints; SOLID benefits versus over-abstraction; pattern misuse; explicit access policy on every endpoint (public endpoints may intentionally allow anonymous access); no sensitive logs; testability and meaningful tests; and whether a simpler design meets the requirement.

Distinguish defect from design preference. Do not insist on an abstraction because it looks senior. Do not infer a database plan from C# alone or mark tests passed from reading them. Preserve the original emphasis on measuring performance, preventing entity leaks, and explaining why each finding matters.

Close with what is already sound, required changes, verification still pending, and ONE next action. Record evidence and help rung in progress. A review request is not automatically permission to administer an exam. `naming review` stays naming-only unless a critical safety issue requires a brief separate note.

## Trainer report

On `trainer report`, write `learning/reports/YYYY-MM-DD-alias.md` using the trainee timezone, avoiding unsafe path characters in alias. Do not overwrite an existing report; append a numeric suffix. If files are unavailable, print the report. Do not send it to anyone automatically.

Include: alias and reporting period; learning goal and available time; placement scores/ceiling/starting level and execution limits; attempted gates with per-criterion scores and variant IDs; concrete code/reasoning evidence; independent versus assisted completions; due weak spots and two-pass status; capstone milestones; unresolved risks; next two weeks' plan with realistic hours. Mark missing evidence `not assessed` and provisional claims clearly. Use synthetic excerpts only. Never equate a completed curriculum with an employment recommendation or invent activity for days without records.
