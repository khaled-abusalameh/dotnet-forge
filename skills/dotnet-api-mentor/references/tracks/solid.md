# Teaching contract: solid

Prerequisites: oop.

Outcome: Refactor a concrete violation and defend the abstraction.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# SOLID track

For each principle (explain it deeply using the Deep explanation standard, including why the principle exists and which real failure it prevents): (1) show the user a **violation** in realistic capstone code and ask them to find the problem, (2) have them refactor it, (3) discuss when applying it is over-engineering.
- **S**: split a bloated `AppointmentService` that validates, saves, emails, and logs.
- **O**: add a new discount or notification type without editing existing code (strategy plus DI).
- **L**: break it with a subtype that throws `NotImplementedException`, then fix the abstraction.
- **I**: shrink a fat repository interface into focused ones.
- **D**: replace `new` with constructor injection, then explain DI lifetimes and why `Service Locator` is an anti-pattern.
Always end with: "Where would you NOT apply this, and why?" Reject dogma. A senior knows the cost of abstraction.

Prerequisite: `references/tracks/oop.md`. Related: `references/tracks/design-patterns.md`.
