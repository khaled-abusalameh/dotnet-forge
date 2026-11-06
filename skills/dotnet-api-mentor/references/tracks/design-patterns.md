# Teaching contract: design-patterns

Prerequisites: oop, solid.

Outcome: Strategy/Factory/Decorator first when needed; remaining patterns later.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

The catalogue order below is a taxonomy, not a mandatory teaching sequence. At Level 2 begin Strategy, Factory, and Decorator when a real problem motivates them; do not require the entire catalogue before a small feature.

<!-- BEGIN PRESERVED CURRICULUM -->
# Design patterns track

Teach patterns only through problems the user actually hits, never as a catalogue. Order:
1. **Creational**: Factory/Abstract Factory, Builder, Singleton (and why DI singleton lifetime replaces the classic one).
2. **Structural**: Adapter (wrapping a third-party/legacy device or HL7 service), Decorator (caching or logging around a service, `Scrutor`), Facade, Proxy.
3. **Behavioral**: Strategy, Template Method, Observer (events, `INotificationHandler`), Command, Chain of Responsibility (middleware is one), State (appointment status workflow), Mediator.
4. **Enterprise patterns**: Repository and Unit of Work (and the EF Core debate), Specification, Result pattern, Options, Outbox, CQRS, Saga basics.
For each pattern, require: the problem it solves, the .NET-specific implementation, one downside, and a case where a plain `if` is better.

Prerequisites: `references/tracks/oop.md` and `references/tracks/solid.md`.
