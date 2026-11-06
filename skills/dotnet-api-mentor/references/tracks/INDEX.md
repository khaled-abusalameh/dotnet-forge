# Technical tracks index

All 28 original curricula are retained. This index is authoritative for prerequisites and sequencing. Read the selected file before teaching; load missing prerequisites only. Each track begins with a Teaching contract that overrides old procedural shorthand without deleting curriculum topics. Source preservation hashes are recorded in the repository docs.

| Track | Level | Prerequisites | Demonstrated outcome |
|---|---|---|---|
| [oop](oop.md) | 0 | Basic editor/CLI setup; teach missing C# syntax in place | Encapsulated hospital model and executable invariants |
| [naming-code-style](naming-code-style.md) | 0 onward | First code attempt; no advanced prerequisites | Intent-revealing names and automated conventions |
| [solid](solid.md) | 1 onward | oop | Refactor a concrete violation and defend the abstraction |
| [design-patterns](design-patterns.md) | 2-4 | oop, solid | Strategy/Factory/Decorator first when needed; remaining patterns later |
| [fluent-interface](fluent-interface.md) | 2-4 | oop, design-patterns Builder lesson | Runnable builder and independently tested validator |
| [ef-fluent-api](ef-fluent-api.md) | 2 | oop, API/DI basics, relational keys | Model configurations, reviewed migration and SQL |
| [tsql-sqlserver](tsql-sqlserver.md) | 2 onward | Tables, keys, basic SELECT; teach these first if missing | Correct query plus actual plan and logical reads |
| [query-complexity](query-complexity.md) | 1 basics; 2 onward SQL | LINQ basics; tsql-sqlserver before plan analysis | Measured query improvement with stable results |
| [redis-caching](redis-caching.md) | 4 | API/data access, docker fundamentals | Measured cache benefit with invalidation/failure lab |
| [api-design](api-design.md) | 1-4 | HTTP basics and C# functions | Explicit API contract and request evidence |
| [openapi](openapi.md) | 1 then 4 | api-design basics | Accurate specification and generated-client verification |
| [jwt-auth](jwt-auth.md) | 3 | API pipeline, DI, HTTP, basic testing | Validated tokens and tested resource authorization |
| [testing](testing.md) | 0 basics; 3 deep | Small callable function; API/data access for integration tests | Tests expose an injected bug; deepen at Level 3 |
| [debugging](debugging.md) | 0 onward | One runnable program | Reproduced defect, hypothesis, fix and regression evidence |
| [legacy-refactoring](legacy-refactoring.md) | 4-5 | testing, oop, solid | Characterization tests and safe incremental refactor |
| [senior-toolkit](senior-toolkit.md) | 5 or relevant earlier | Relevant subject prerequisites from this index | ADR, operational evidence or bounded engineering exercise |
| [async-concurrency](async-concurrency.md) | 0 async basics; 2-5 concurrency | Functions/Task basics; transactions before distributed concurrency | Reproduced race and justified durable fix |
| [performance](performance.md) | 2-5 | API/data access; query-complexity for database diagnosis | Repeatable baseline, one change, measured improvement |
| [clean-architecture](clean-architecture.md) | 4 | oop, solid, testing, API/data access | Justified boundaries and dependency test |
| [messaging-fundamentals](messaging-fundamentals.md) | 4 | async-concurrency, transactions; docker for broker labs | Idempotent consumer under duplicate delivery |
| [rabbitmq](rabbitmq.md) | 4 | messaging-fundamentals exercise, docker | Crash/redelivery lab with safe consumer effects |
| [kafka](kafka.md) | 4-5 | messaging-fundamentals exercise, docker; RabbitMQ concepts for comparison only | Replay into a read model and poison-message handling |
| [signalr](signalr.md) | 4 | API pipeline, jwt-auth, async basics; docker for scale lab | Authorized two-instance waiting-room updates |
| [microservices](microservices.md) | 5 | clean-architecture, docker, rabbitmq or kafka | Extract one bounded service and document operational cost |
| [docker](docker.md) | 4 | Runnable API, environment/configuration basics | One-command local stack and diagnosed dependency failure |
| [kubernetes](kubernetes.md) | 5 | docker, health checks, basic observability | Local rollout/recovery measured under load |
| [healthcare](healthcare.md) | 0 domain basics; later integrations | No prerequisite for scheduling vocabulary; API/data access for imports | Synthetic appointment model, audit trail and validated import |
| [files-reports-realtime](files-reports-realtime.md) | As needed | API basics, security before uploads; signalr before scale | Safe report/upload/notification with executable checks |
