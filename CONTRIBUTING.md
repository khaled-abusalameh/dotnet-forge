# Contributing to .NET Forge

Keep changes concrete, teachable, and supported by evidence. A larger curriculum is not automatically a better curriculum.

## Before changing the skill

Read AGENTS.md and the relevant protocol or track. Product maintenance is not a mentoring session. Keep all repository prose in English; user-facing mentoring remains language-adaptive.

Preserve the `dotnet-api-mentor` identifier and install paths unless a migration is intentional and documented. Keep SKILL.md within 150 lines and the description below 1024 characters. Load detailed protocols and tracks on demand rather than expanding the entrypoint.

## Technical and assessment changes

Explain the learner problem, the new behavior, and how it was checked. Version-sensitive claims need current official sources. Maintain the distinction between executed, trainee-reported, static-only, and pending evidence.

Assessment changes must preserve explicit rubrics, integrity rules, prerequisite ceilings, and fresh variants. Never fix a scoring inconsistency by silently changing a learner's historical result. Explain schema migrations and keep existing progress recoverable.

The 28 original track bodies are protected by preservation hashes. Add clarifications in Teaching contracts where possible. Any intentional baseline change must document the original and replacement content and update the preservation policy explicitly; do not merely refresh hashes to make a failing check pass.

## Validate locally

```powershell
pwsh -NoProfile -File scripts/verify.ps1
pwsh -NoProfile -File scripts/test-installers.ps1
```

The installer test writes to a uniquely named temporary directory and reports its location. It does not touch global installations or actual trainee workspaces. On Linux it also checks the Bash installer. Respect your organization's execution-policy requirements.

For protocol changes, walk through a new learner, a returning learner, and a fileless snapshot session. State whether this was a textual walkthrough or an actual model session.

## Pull request expectations

Use a descriptive English title and a short description covering the concrete problem, resulting behavior, relevant verification, and known limits. Link a synthetic example when helpful. Separate required correctness changes from stylistic preferences. Do not include real trainee identities, progress records, credentials, or patient data in issues, commits, or screenshots.

No contribution or reuse license has been selected yet. Discuss licensing with the maintainer before contributing material that requires specific distribution terms.
