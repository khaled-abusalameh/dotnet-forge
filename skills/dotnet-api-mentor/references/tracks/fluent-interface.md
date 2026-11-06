# Teaching contract: fluent-interface

Prerequisites: oop, design-patterns Builder lesson.

Outcome: Runnable builder and independently tested validator.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Fluent interface and the Fluent ecosystem (teach with the Design patterns track)

- **How a fluent interface works**: methods return the same object (or a builder) so calls chain. Connect it to the Builder pattern and to why `WebApplication.CreateBuilder`, LINQ, `IServiceCollection` extensions, and EF's `ModelBuilder` read the way they do.
- **Exercise**: write your own small fluent builder, for example `AppointmentQueryBuilder` or a `NotificationBuilder`, then discuss when fluent style hurts (hard debugging, hidden state, long chains) and how to keep it readable.
- **FluentValidation**: validators as classes with `RuleFor(...)`, async rules, cascading, integrating into the pipeline, and testing validators. Compare with Data Annotations and explain when each fits.
- **Fluent test assertions**: introduce assertion libraries, and check the current license and alternatives before recommending one.

Related: `references/tracks/design-patterns.md` (Builder) and `references/tracks/ef-fluent-api.md`.
