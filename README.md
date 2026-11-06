# .NET Forge

**Build engineering judgment. Prove it in code.**

Practical C# and ASP.NET Core mentoring for developers who want to understand the system, defend their decisions, and demonstrate that their code works.

**28 technical tracks · 6 levels · 1 evolving capstone · 3 agent tools**

[Get started](#start-in-a-trainee-workspace) · [Curriculum](skills/dotnet-api-mentor/references/tracks/INDEX.md) · [Assessment](skills/dotnet-api-mentor/references/placement-exam.md) · [Verification](docs/VERIFICATION.md) · [Contributing](CONTRIBUTING.md)

A hands-on C# and ASP.NET Core Web API training skill for individual trainees and trainers. One hospital-appointments capstone grows from object invariants to production incidents. The mentor teaches deeply, assigns one exercise at a time, reviews evidence, and retains a precise resume checkpoint.

The product name is **.NET Forge**. Its portable skill identifier remains `dotnet-api-mentor`, so installation paths and existing invocation commands stay compatible. Maintained by [Khaled Abusalameh](https://github.com/khaled-abusalameh).

## What makes it different

- **Evidence before advancement.** Placement and gates use explicit scoring, prerequisite ceilings, and execution evidence.
- **Depth without overload.** One concept and one exercise at a time, with explanations of mechanisms and trade-offs.
- **Continuity across chats.** Structured local progress or a compact Resume Snapshot preserves the current exercise.
- **Production thinking.** Invalid input, concurrent requests, timeouts, duplicate delivery, and operational diagnosis become part of the learning path.
- **Honest limits.** Assisted answers, static review, and unexecuted checks are labeled; no invented test results or certification claims.

## Learning path

| Level | Focus | Evidence to advance |
|---|---|---|
| 0 | C#, OOP, HTTP, and naming | Working in-memory CRUD and explained invariants |
| 1 | API contracts, validation, middleware, and DI | Consistent responses and correct service lifetimes |
| 2 | EF Core and SQL Server | A measured query improvement and a defensible execution plan |
| 3 | Authentication, authorization, and testing | Tests that catch injected security and behavior defects |
| 4 | Architecture, caching, messaging, and containers | Justified boundaries and demonstrated failure handling |
| 5 | Observability, resilience, performance, and incidents | Reproduced diagnosis, measured recovery, and a clear ADR |

See the [gate protocol](skills/dotnet-api-mentor/references/levels-and-gates.md) for mandatory criteria and retry rules.

## Start in a trainee workspace

Give each trainee a separate clone or workspace. Their `learning/` directory stays private and is ignored by Git. Do not share a live progress file between learners. All repository content is English; mentoring uses the trainee's preferred language.

From the repository root, choose either installer:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/install.ps1
```

```bash
bash scripts/install.sh
```

The default copies the same skill to `.claude/skills`, `.agents/skills`, and `.gemini/skills`. Re-running against identical contents is safe. A divergent installation is rejected before copying; use a fresh workspace or reconcile your customizations manually. No global configuration, existing context files, or trainee progress is overwritten. Scripts need filesystem write permission; manual copying is equivalent.

The PowerShell execution-policy option is process-scoped; it does not change global policy. If organizational policy disallows it, use an approved host or manual copying. The Bash script requires standard `dirname`, `find`, `diff`, `mkdir`, and `cp` utilities (for example in Git Bash, Linux, or macOS).

To install only one tool or into another workspace:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/install.ps1 -Tool codex -Destination 'C:\Training\trainee-07'
```

```bash
bash scripts/install.sh claude '/path/to/trainee workspace'
```

When installing into an existing external project, the scripts copy only the skill. Invoke it explicitly or add a scoped pointer to the installed SKILL.md in that project's existing instructions yourself. Do not replace the project's AGENTS.md/CLAUDE.md/GEMINI.md with this repository's wrappers blindly.

## Setup per tool

| Tool | Local skill location | Context entrypoint | Start |
|---|---|---|---|
| Codex | `.agents/skills/dotnet-api-mentor/SKILL.md` | `AGENTS.md` | Open this workspace, invoke `$dotnet-api-mentor`, then say `placement` or `resume` |
| Claude Code | `.claude/skills/dotnet-api-mentor/SKILL.md` | `CLAUDE.md` imports `AGENTS.md` | Restart from workspace, invoke `/dotnet-api-mentor` |
| Gemini CLI | `.gemini/skills/dotnet-api-mentor/SKILL.md` | `GEMINI.md` imports `AGENTS.md` | Reload skills, inspect `/skills list`, request `dotnet-api-mentor` and `resume` |

Gemini also discovers `.agents/skills`; that alias takes precedence within the same tier. The default install deliberately keeps both copies identical. Restart or use the documented reload command after installation and check which copy loaded. Older personal installations with the same name can affect discovery; inspect rather than silently removing them.

These local CLI/workspace instructions are documentation-verified, not a promise that every hosted chat product reads local files. Details, official sources, and runtime-test limits are in [tool compatibility](docs/TOOL-COMPATIBILITY.md). If discovery fails, explicitly provide the SKILL.md content and the relevant reference. A fileless chat uses Snapshot Mode: keep the emitted snapshot and paste it in the next chat, along with any requested reference or code artifact.

## How training works

The first intake collects an alias, language, experience, weekly availability, goal, and environment. Placement has six progressively harder coding/reasoning tasks, about 90 active minutes, resumable across sittings. Beginners stop adaptively. A four-criterion 0-3 rubric, score bands, and evidence ceiling produce the starting level; placement does not award gate passes.

Lessons last roughly 30-45 minutes and cover one concept: problem, mechanism, runnable examples, trade-offs, explain-back, exercise, review, and a sequential failure twist. If stuck, the mentor escalates through five hint rungs. Revealed solutions count as assisted, and a fresh transfer exercise checks independence.

Six levels cover foundations, core API, data access, security/quality, architecture, and senior operations. Gates pass at 75% with no zero on critical criteria, required execution evidence, and all mandatory criteria met. Retrying requires remediation, at least 48 hours, and an unexposed variant. Passing this curriculum is evidence of these tasks, not a professional certification.

## Resume and privacy

State uses [the strict schema](skills/dotnet-api-mentor/references/progress-schema.md) and [template](skills/dotnet-api-mentor/assets/PROGRESS.template.md). The mentor saves after lessons and assessment sections, and before waiting on an exercise. In fileless mode, a Resume Snapshot under 60 lines carries the same checkpoint. No system can restore a lost file and lost snapshot; back up your private state deliberately.

Only synthetic data belongs in exercises. Do not paste real patient records, credentials, or production secrets. Reports are written under ignored `learning/reports/` and are not automatically sent anywhere.

## Commands

`resume`, `where am I`, `placement`, `retest`, `test me`, `explain <topic>`, `deeper`, `review`, `naming review`, `break it`, `debug this`, `profile this`, `complexity of this`, `lab <topic>`, `level up`, `weekly review`, `snapshot`, `trainer report`.

## Trainer guide

Use one workspace per trainee and calibrate sample scoring before a cohort starts. Review the placement key privately during administration; it is public source, so do not pretend this is a secure proctored exam. Ask about exposure and tooling. Forms A/B are parallel seeds with different defects; later forms need trainer calibration. Keep assistance and execution provenance visible in reports, and do not compare raw speed across different environments.

Read `trainer report` outputs for actual evidence, unresolved weak spots, and two-week plans. Require two independent passes on different days before closing a weakness. Make explicit accommodations for missing SQL Server/container access: provisional evidence is preferable to inventing a pass. Practical setup may be a separate session.

Core C# and endpoint placement tasks can run with the trainee's installed SDK using `dotnet new console` or `dotnet new web`; the mentor checks official support/version guidance before choosing new versions. EF/SQL tasks require suitable packages and SQL Server for runtime evidence; Docker/Kubernetes labs require their runtimes. No deployment, cloud account, or proprietary IDE is mandatory. Supply environment-specific scaffolding without supplying the active solution.

## Maintainer guide

Canonical skill content lives under `skills/dotnet-api-mentor/`; installed copies are generated. Read [CHANGES](docs/CHANGES.md) for the migration and [verification](docs/VERIFICATION.md) for checks and three first-message simulations. All 28 original track bodies are preserved with only reference path relocation; separate Teaching contracts clarify legacy wording. [The manifest](docs/TRACK-PRESERVATION.json) records normalized source hashes.

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This verifies structure, local links, imports, preservation hashes, and PowerShell parsing. The GitHub Actions workflow also exercises installer idempotency and conflict protection on Windows and Linux. It does not execute every future infrastructure lab or prove a model follows instructions. Keep behavioral scenario review and tool documentation checks in the release process.

## Project status

Initial release: **v0.1.0**. The curriculum, assessment protocols, and installation tooling are ready for review. Real cohort calibration and fresh end-to-end sessions in all three agent tools remain follow-up work. See the [changelog](CHANGELOG.md) for release scope and [verification report](docs/VERIFICATION.md) for evidence boundaries.

## Contributing and data handling

Read [CONTRIBUTING.md](CONTRIBUTING.md) before proposing changes and [SECURITY.md](SECURITY.md) before reporting a sensitive issue. Never commit trainee progress, real patient data, credentials, or production logs. No reuse license is currently included; public visibility alone does not establish an open-source license.
