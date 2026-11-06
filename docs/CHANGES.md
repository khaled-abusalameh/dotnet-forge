# Change ledger against the original skill

Baseline: original dotnet-api-mentor SKILL.md (172 lines, 666-character description) and all 28 reference files. No original installation was edited. The migration preserves technical curriculum text, relocates its reference paths, and adds operational contracts. This ledger describes the delivered implementation, not abandoned approaches.

| Original area / exact wording | Change and destination | Why |
|---|---|---|
| `senior .NET engineer mentoring one developer` | SKILL role specifies principal-level production judgment; no invented personal history; isolated workspace per alias | Concrete behavior and multi-trainee operation |
| Description repeated `API design` and `testing` | Concise trigger description adds resume, placement, retest, snapshot, reports, and implementation boundary | Precise discovery without a keyword catalogue |
| 172-line monolithic entrypoint | Lean SKILL routes to placement, progress, levels, teaching, reviews, track index | Progressive disclosure |
| Language follows user | Preserved; explicit intake preference and English repository artifacts | Reusable across languages |
| `No multiple-choice questions. Ever.` | Preserved in all modes | Demonstrated ability over guessing |
| `One exercise at a time` | Preserved and extended to wait checkpoints, twists, interleaving | Avoid overload and state loss |
| Deep explanation eight stages | Moved intact in meaning to teaching-standard; depth scales by level | Preserve depth without beginner overload |
| `Do not show the solution ... or explicitly ask` | Lesson-only help ladder; revealed answer means assisted; fresh transfer task | Support stuck trainees without inflating evidence |
| Three unspecified placement tasks | Six concrete tasks with A/B forms, keys, timing, task-specific criteria | Reproducible placement |
| `Place the user at a level based on their code` | 24 scores, total /72, score bands, prerequisite ceiling, lower-of rule | Auditable decisions |
| No assessment integrity or stop rules | Allowed resources, exposure/invalidation, adaptive stop, pause/resume | Fairness and beginner accessibility |
| No intake | Alias, language, experience, availability, goal, environment | Match learner constraints |
| No retest rules | >=48h plus remediation and unused calibrated variant | Prevent memorized answers masquerading as mastery |
| Free-form `learning/PROGRESS.md` | Strict YAML + eight sections + version/revision + template | Reliable cross-chat continuation |
| Log only at lesson end | Also save after assessment sections and before waiting on an exercise | Survive interruption mid-flow |
| `every few sessions` | Due dates and two independent passes on different days | Evidence-based spaced repetition |
| No size/history policy | <=120 lines; last ten sessions; archive summary preserving variants/gates | Bounded state without losing critical history |
| Assumed file access | Snapshot Mode under 60 lines; failure/conflict/migration rules | Fileless chat portability |
| Six descriptive gates | Preserved level content plus explicit criteria, 0-3 scoring, >=75%, critical-zero rule | Consistent advancement |
| `Review like a real PR` | Blocker/Major/Minor/Nit/Praise with what/why/direction | Actionable prioritized feedback |
| Long inline checklist | Moved to review-checklist; contextual security/naming distinctions | Reduce entrypoint load and dogma |
| Hospital appointments and SQL Server | Preserved; synthetic data only | Consistent capstone with safe practice |
| `Make them run it` | Execution provenance and pending/provisional outcomes | No fabricated verification |
| Current docs instruction | Preserved, with explicit unavailable-docs fallback | Honest offline behavior |
| Infrastructure labs | Preserved runnable lab, deliberate failure, logs; versions checked when used | Practical learning without stale hardcoded images |
| Senior thinking, interleaving, real-code reading, portfolio | Retained in teaching-standard and levels | Preserve useful learning method |
| Command list | Preserved all old commands, including complexity; adds resume/placement/retest/snapshot/trainer report | Complete operational lifecycle |
| No trainer artifact | Report contract under private learning/reports with evidence and assistance | Cohort oversight without automatic disclosure |
| No entrypoint/install packaging | AGENTS.md; one-line CLAUDE.md/GEMINI.md wrappers; two selective/idempotent installers with conflict preflight, link rejection, and Git Bash Windows-path normalization | Documented local tool discovery without overwriting customizations |
| No verification assets | verify.ps1, preservation manifest, compatibility notes, scenario report | Reproducible structural verification and honest limits |
| No publication guide | README setup/trainer/maintainer/commit-push instructions; gitignore/gitattributes | GitHub-ready source package |

## Track-by-track preservation

Every old `references/NAME.md` moved to `skills/dotnet-api-mentor/references/tracks/NAME.md`. A Teaching contract was prepended. Within the preserved body, the ONLY transformation is `references/` to `references/tracks/`. The verifier reverses that transformation and compares SHA-256 after LF normalization with TRACK-PRESERVATION.json. Technical topics and exercises were not shortened or removed.

| Track | Added contract clarification beyond shared prerequisites/outcome |
|---|---|
| api-design | Prerequisites and executable contract outcome |
| async-concurrency | Early async foundations versus later distributed concurrency |
| clean-architecture | Tests/OOP/SOLID prerequisites and dependency evidence |
| debugging | Runnable reproduction prerequisite and regression outcome |
| design-patterns | Old order is a catalogue; begin Strategy/Factory/Decorator when motivated |
| docker | Runnable API/configuration prerequisites; diagnosed failure outcome |
| ef-fluent-api | Fluent API is not a seniority badge; model initialization is not always at startup; provider/version checks |
| files-reports-realtime | Security prerequisite for uploads; runnable bounded evidence |
| fluent-interface | Builder prerequisite and validator evidence |
| healthcare | Domain basics early, integrations after API/data access |
| jwt-auth | Angular optional; intentional anonymous endpoints distinguished from protected resources |
| kafka | RabbitMQ comparison does not create circular completion prerequisites |
| kubernetes | Docker/health/observability prerequisites and measured rollout outcome |
| legacy-refactoring | Characterization-testing prerequisite |
| messaging-fundamentals | Exactly-once guarantees require an explicit boundary |
| microservices | Architecture/container/broker prerequisites and operational-cost evidence |
| naming-code-style | Team conventions versus defects; positive-name preference not an absolute; prioritized review |
| oop | Split bundles into small lessons; don't front-load every memory topic |
| openapi | Angular example preserved; C# client is an equivalent option |
| performance | Data/query prerequisites and repeatable measurement outcome |
| query-complexity | Operator Big-O and SARGability statements require actual-plan context |
| rabbitmq | Completed messaging exercise before broker lab |
| redis-caching | Simplified single-thread model is not universal; verify distribution/version |
| senior-toolkit | Angular/TFVC are available integrations, not mandatory tools |
| signalr | Angular/RxJS material preserved as an optional client integration |
| solid | OOP prerequisite and justified-refactor outcome |
| testing | Small checks at Level 0, full testing track at Level 3; unavailable runtime stays pending |
| tsql-sqlserver | Relational basics before deeper query/plan evidence |

## Layout adaptations

The requested layout is retained. Added `.gitattributes` for executable shell line endings; `scripts/verify.ps1` for repeatable checks; and `docs/TOOL-COMPATIBILITY.md`, `docs/TRACK-PRESERVATION.json`, and `docs/VERIFICATION.md` for sources and evidence. No vendor-specific hooks, API dependencies, global settings, or license grant were added.

For the owner-requested GitHub publication, the product is branded **.NET Forge**, retaining the portable `dotnet-api-mentor` identifier. Added CONTRIBUTING.md, SECURITY.md, CHANGELOG.md, .editorconfig, a reusable installer test, and a Windows/Linux validation workflow with a pinned checkout action and read-only repository permissions. The repository was requested as private for initial review. All published content and commit messages are English.
