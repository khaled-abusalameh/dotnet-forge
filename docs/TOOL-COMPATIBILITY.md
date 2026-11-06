# Tool compatibility evidence

Checked on 2026-11-06. Scope: local workspace skill discovery and context entrypoints for Codex, Claude Code, and Gemini CLI. Documentation was opened and the relevant passages inspected; this is distinct from running each application.

| Tool | Verified documentation behavior | Repository decision | Runtime status |
|---|---|---|---|
| Codex | Repository `.agents/skills` discovery; AGENTS.md project instructions | Copy to `.agents/skills`; root AGENTS.md points to canonical skill | Installer/file checks only; no fresh Codex model session tested |
| Claude Code | Project `.claude/skills`; CLAUDE.md supports relative @ imports | Copy to `.claude/skills`; CLAUDE.md contains only @AGENTS.md | Claude Code not available for end-to-end test |
| Gemini CLI | Workspace `.gemini/skills` and `.agents/skills` alias; alias precedence; GEMINI.md imports | Copy to `.gemini/skills`; identical `.agents` copy when installing all; wrapper contains only @AGENTS.md | Gemini CLI not available for end-to-end test |

Official sources:

- [OpenAI local skills](https://learn.chatgpt.com/docs/build-skills): repository discovery paths and progressive loading. The original developers.openai.com/codex/skills URL redirected here.
- [OpenAI AGENTS.md](https://learn.chatgpt.com/docs/agent-configuration/agents-md): project instruction discovery and scope.
- [Claude Code skills](https://code.claude.com/docs/en/skills): local project skill directories and explicit invocation. Hosted products have different discovery rules.
- [Claude Code memory](https://code.claude.com/docs/en/memory): relative @ imports resolve from the containing file; importing everything would eagerly load it, so the wrapper imports only the short entrypoint.
- [Gemini CLI skills](https://geminicli.com/docs/cli/skills/): workspace directories, alias precedence, list/reload commands.
- [Gemini GEMINI.md](https://geminicli.com/docs/cli/gemini-md/): project context configuration.
- [Gemini memory import processor](https://geminicli.com/docs/reference/memport/): @file.md imports and relative path support. The initially attempted memory-import-processor URL failed; the documentation's own link led to this page.

No user settings were changed. No assumption is made about a generic Claude/Gemini web chat having local filesystem access. For such sessions, provide the skill and relevant reference text plus a Resume Snapshot. Without the reference, the mentor requests it rather than inventing scoring rules.

Technical wording check: [EF model configuration](https://learn.microsoft.com/en-us/ef/core/modeling/) confirms Fluent API precedence and mapping separation; [EF advanced performance](https://learn.microsoft.com/en-us/ef/core/performance/advanced-performance-topics) explains initialization on first relevant DbContext operation. The corresponding track Teaching contract corrects the old unconditional startup wording. Other technical curricula remain subject to version-specific official-documentation checks when taught; this release does not claim every library API or infrastructure configuration was executed or revalidated.
