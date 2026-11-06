# Teaching contract: oop

Prerequisites: Basic editor/CLI setup; teach missing C# syntax in place.

Outcome: Encapsulated hospital model and executable invariants.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Split every numbered bundle below into small lessons. Begin with objects and a simple invariant; do not front-load all memory internals in the first session.

<!-- BEGIN PRESERVED CURRICULUM -->
# OOP track (teach first, revisit often)

OOP is the foundation under SOLID and design patterns, so build it carefully and deeply. Use the Deep explanation standard for every item. Teach in this order, each as one or more full lessons:
1. **Objects, classes, and memory**: what an object is, class vs instance, stack vs heap, reference types vs value types, `struct` vs `class` vs `record`, boxing and unboxing, `null` and nullable reference types, how an object is created in memory (allocation, constructor chain, field initialization order, base constructor order), garbage collection at a basic level, `IDisposable` and `using`.
2. **Encapsulation**: access modifiers, fields vs properties (what the compiler generates), `init` and `required`, invariants (an object should never be in an invalid state), immutability and defensive copies, "tell, don't ask", the Law of Demeter.
3. **Abstraction**: abstract classes vs interfaces (and default interface methods), designing a contract, leaky abstractions, programming to an interface and what that really buys you.
4. **Inheritance**: how it works, `base`, constructor chaining, `sealed`, the fragile base class problem, why "composition over inheritance" is advice and not a law, `is-a` vs `has-a`.
5. **Polymorphism**: compile-time (overloading, generics) vs runtime (virtual dispatch), how `virtual`/`override` work under the hood (the method table), `override` vs `new` (method hiding) and the bugs it causes, Liskov substitution as the rule that keeps polymorphism safe, pattern matching as an alternative.
6. **Equality and identity**: reference vs value equality, `Equals` and `GetHashCode` contracts, why dictionaries break when they are wrong, record equality, entity identity vs value object equality (link to EF Core and DDD).
7. **Generics, delegates, and events**: why generics exist, constraints, covariance and contravariance, `Func`/`Action`, closures and their gotchas, events and the observer idea, how this underlies LINQ and DI.
8. **Object design and modeling**: coupling and cohesion, anemic vs rich domain model, modeling the hospital domain (`Patient`, `Appointment`, `Money` as a value object), error handling in the model (exceptions vs result), when inheritance fits and when it hurts.
Exercises: model a small domain with encapsulated invariants, then deliberately violate them to see the failures. Predict output of tricky snippets (virtual calls in constructors, `new` vs `override`, boxing in a hot path, mutable struct bugs). Refactor an inheritance hierarchy into composition and justify it. After this track, SOLID and patterns should feel like consequences, not rules to memorize.
