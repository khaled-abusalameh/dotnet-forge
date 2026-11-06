# Teaching contract: naming-code-style

Prerequisites: First code attempt; no advanced prerequisites.

Outcome: Intent-revealing names and automated conventions.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Distinguish correctness from team conventions. Prefer positive boolean names, but do not mechanically rename external contracts or established domain terms. Report all relevant issues over successive passes; prioritize defects over nits. Async naming applies to relevant awaitable APIs, not only Task.

<!-- BEGIN PRESERVED CURRICULUM -->
# Naming and code style track (starts at Level 0, enforced in every review)

Teach it deeply (why a convention exists, not only what it is) and correct every violation in the user's code during review. Based on the official Microsoft C# conventions; check the current docs for updates.
- **Casing**: `PascalCase` for classes, records, structs, enums and their members, methods, properties, events, namespaces, constants, and public fields. `camelCase` for local variables and method parameters. `_camelCase` for private fields. Interfaces start with `I` (`IPatientService`). Generic type parameters are `T` or `TEntity`, `TKey`. Async methods that return `Task` end with `Async`.
- **Meaning over shortness**: names reveal intent (`appointmentDate`, not `d` or `dt1`). No Hungarian notation, no unclear abbreviations, no names like `data`, `temp`, `obj`, `Manager`, `Helper`, `Utils` without a real reason.
- **Booleans** read as questions: `isActive`, `hasInsurance`, `canCancel`. Never negative names like `isNotValid`.
- **Collections** are plural (`appointments`); methods are verbs (`CancelAppointment`); classes and properties are nouns.
- **API-specific naming**: DTOs and contracts like `CreatePatientRequest`, `PatientResponse`, `PatientSummaryDto`; controllers `PatientsController` (plural resource); endpoints use nouns and plural resources (`/api/patients/{id}/appointments`), not verbs; consistent JSON casing (camelCase by default); one class per file, file name equals type name.
- **Consistency in the database vs code**: C# uses PascalCase while SQL Server tables and columns follow the team's rule; show how EF Core maps between them (Fluent API `ToTable`, `HasColumnName`).
- **Modern style**: file-scoped namespaces, `var` only when the type is obvious from the right side, expression-bodied members where they stay readable, `nameof` instead of magic strings, no magic numbers (named constants or enums).
- **Tooling**: set up `.editorconfig` and Roslyn analyzers (and `dotnet format`) so the compiler enforces the rules, and explain why teams automate style instead of arguing in reviews.
Exercise: give a messy file with bad names and mixed styles, have the user clean it up, then explain the reason behind each rename.
