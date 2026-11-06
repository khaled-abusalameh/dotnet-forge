# Teaching contract: clean-architecture

Prerequisites: oop, solid, testing, API/data access.

Outcome: Justified boundaries and dependency test.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Clean Architecture track (Level 4)

- **The idea**: the dependency rule (dependencies point inward), Domain / Application / Infrastructure / Presentation layers, ports and adapters (hexagonal), use cases, why the domain must not know about EF Core, ASP.NET, or the database.
- **In a .NET solution**: project layout and references, where interfaces live vs where implementations live, DTOs and mapping at the boundaries, `Result` types for expected failures, domain events, validation at the right layer, dependency injection composition root.
- **Variations and honesty**: vertical slice architecture, modular monolith, and when Clean Architecture is overkill (small CRUD apps). Compare the same feature in a plain layered design, Clean Architecture, and vertical slices, and have the user argue for one.
- **Mistakes**: anemic domain, leaking `IQueryable` or EF entities across layers, "repository on top of EF" debates, giant `Application` layer that is just a pass-through, MediatR used by habit.
- **Exercise**: refactor the capstone into Clean Architecture step by step with tests green, then prove the dependency rule with an architecture test (for example with NetArchTest).
