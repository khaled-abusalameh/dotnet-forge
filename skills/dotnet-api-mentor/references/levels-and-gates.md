# Levels and gates

Placement is a starting recommendation, not a passed gate. Teach missing prerequisites even after a high placement score. Start OOP before SOLID/patterns; naming starts with the first line of code. Basic executable checks begin at Level 0; the full testing track deepens at Level 3. Use [tracks/INDEX](tracks/INDEX.md) for prerequisites.

## Shared gate protocol

Publish acceptance criteria and the four-criterion rubric BEFORE starting. Each criterion is 0-3: 0 unsafe/absent/wrong; 1 partial with material defects; 2 independently meets the contract; 3 meets it with edge-case evidence and justified alternatives. Criteria are C1 correctness, C2 security, C3 data safety, C4 verification/reasoning. All four apply at every level, proportionately: early security means input boundaries and no sensitive disclosure, not prematurely requiring JWT infrastructure.

Pass at >=9/12 (75%) AND no zero on C1/C2/C3 AND required execution evidence present AND all mandatory acceptance criteria met. A score never overrides a known critical defect. If execution is unavailable, record provisional, not passed. Use the placement integrity policy: no hints/corrections mid-gate, disclose allowed tools, do not expose a key. The trainee writes the code. Review and remediation follow the submitted attempt, not during scoring.

Record gate ID, level, variant, prompt, per-criterion evidence/scores, execution provenance, outcome, and retry_after. A failed gate requires targeted practice and at least 48 hours before a fresh equivalent variant; pause is not failure. A disclosed/solved variant is retired. Change the behavior and failure trigger, not just names. Use A/B examples below as seeds, generate a concrete bounded task and acceptance tests BEFORE administration, and freeze the rubric. After both forms are used, create a new form and have a trainer calibrate it, or mark it provisional. Advance L0->L1 through L4->L5 only after passing the current gate. Passing L5 completes the curriculum; it is not a job title certification.

## Level 0 - Foundations

Content: C# essentials (records, generics, LINQ, nullable reference types, async/await, exceptions), HTTP and REST fundamentals, dotnet CLI, project structure. Start OOP, naming, and small executable assertions.

Gate: build in-memory CRUD with sound object invariants and naming; explain async/await and why blocking hurts. A: appointments with positive duration and valid state transitions. B: department roster with bounded capacity and duplicate membership rejection. C1 checks CRUD/statuses/invariants; C2 checks malformed input and safe error content; C3 checks invalid requests do not mutate valid state and IDs stay unique; C4 requires requests/tests plus async explain-back. Persistence across restart is explicitly out of scope and must be stated.

## Level 1 - Core Web API

Content: controllers vs minimal APIs, routing, model binding, DTOs vs entities, validation, status codes, ProblemDetails, middleware ordering, configuration/Options, DI lifetimes and captive dependencies, logging/global exception handling. Start OpenAPI, SOLID after OOP, and code complexity basics.

Gate: consistent errors, validation, correct DI, no entity leaks. A: appointment cancellation endpoint with a scoped clock/service and global errors. B: patient contact-preference endpoint with a deliberately misordered middleware. C1 validates contracts; C2 checks accidental disclosure and explicitly documented access boundaries; C3 ensures failed validation leaves state intact; C4 requires scope validation, integration requests, accurate OpenAPI, and explanation of middleware flow.

## Level 2 - Data access

Content: DbContext lifetime, migrations, relationships, tracking/no-tracking, Include/projection, N+1, pagination, transactions, optimistic concurrency, raw SQL/Dapper trade-offs; SQL Server indexes, covering indexes, plans, deadlocks, isolation. Start EF Fluent API and query complexity. Introduce Strategy, Factory, Decorator through encountered problems, not a fixed catalogue.

Gate: diagnose and repair a slow endpoint using evidence. A: appointment list with N+1 and over-fetching. B: billing report with nonsargable filtering and unstable pagination. C1 checks results and stable paging; C2 checks parameterization/DTO limits; C3 checks read path does not mutate data and migrations preserve fixtures; C4 requires before/after actual plans and logical reads on recorded data scale, generated SQL, and a justified index/query change. No performance pass based only on elapsed time from unrelated environments.

## Level 3 - Security and quality

Content: JWT/refresh tokens, policy and resource authorization, CORS, rate limiting, secrets, OWASP API Top 10; xUnit, fakes/mocks, WebApplicationFactory, Testcontainers. Teach JWT and full testing tracks.

Gate: secure API with role AND resource checks plus tests catching an injected bug. A: patient appointment access with refresh replay. B: clinician bill access with cross-department authorization and reused refresh token. C1 validates normal/invalid flows; C2 requires denial of unauthorized access and token validation; C3 checks rotation/replay state changes are atomic and don't expose secrets; C4 requires unit/integration tests that fail on the injected defect and pass after repair, with explanation of test boundaries.

## Level 4 - Architecture and design

Content: layering/Clean Architecture and when excessive, CQRS/MediatR trade-offs, repository-over-EF debate, domain modeling, Result/exceptions, API versioning, idempotency, memory/distributed caching, hosted services/Hangfire, outbox, messaging. Teach Docker, Redis, messaging fundamentals before RabbitMQ/Kafka, SignalR, finish patterns, apply SOLID at architecture scale. Begin Kafka.

Gate: refactor capstone into a justified structure. A: reliable appointment notification with outbox plus cache invalidation. B: billing completion with idempotent consumer and stale-report cache handling. C1 checks feature behavior through failure; C2 checks boundaries, secrets and authorization survive refactor; C3 checks atomic write/outbox and safe duplicate handling; C4 requires green regression tests, dependency evidence, a runnable failure lab, and an ADR defending both selected and rejected abstractions. A modular monolith is a valid choice.

## Level 5 - Senior

Content: structured logging/OpenTelemetry/health checks, profiling/BenchmarkDotNet/allocations/pooling/async pitfalls, Polly/timeouts/retries/circuit breakers, Docker and CI/CD, ADRs/design docs, code review, estimation, legacy .NET Framework migration, incidents. Teach microservices/Kubernetes after prerequisites; finish Kafka/performance.

Gate: simulated incident diagnosis, recovery, ADR, and flawed-PR review. A: retry storm and duplicate appointment notifications after deployment. B: connection-pool exhaustion and ambiguous payment commits during rollout. Supply synthetic logs, metrics, failing service, and a reproducible load script before the timer starts. C1 requires causal diagnosis and recovery; C2 protects patient data in telemetry and access; C3 requires reconciliation, rollback/roll-forward reasoning and duplicate safety; C4 requires reproduced failure, measured recovery, observability improvements, ADR, severity-based PR review, and a bounded rollout plan. Never claim production safety from a local simulation alone.
