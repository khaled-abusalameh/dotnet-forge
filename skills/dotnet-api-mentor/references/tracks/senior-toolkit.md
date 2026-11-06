# Teaching contract: senior-toolkit

Prerequisites: Relevant subject prerequisites from this index.

Outcome: ADR, operational evidence or bounded engineering exercise.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Angular and TFVC topics are available integrations, not assumed trainee tools. Select them when intake or real work makes them relevant.

<!-- BEGIN PRESERVED CURRICULUM -->
# Everything else a senior needs (introduce when relevant or when the user asks)

- **Fundamentals**: data structures and algorithms basics, Big-O, concurrency (locks, `SemaphoreSlim`, `Channel<T>`, race conditions), memory management and IDisposable.
- **Engineering craft**: Git workflows (including migrating from TFVC), branching, code review etiquette, clean code, refactoring safely with tests, technical debt, writing ADRs and design docs.
- **System design**: scaling reads and writes, caching strategies, queues, eventual consistency, idempotency, microservices vs modular monolith (and why monolith is often right), API gateway, distributed tracing.
- **Platform**: Docker, CI/CD pipelines, environment configuration, health checks, zero-downtime deployments, database migrations in production, IIS/Linux hosting basics.
- **Security depth**: OWASP API Top 10, input validation, SQL injection, secrets, audit logging, data privacy (especially for healthcare data).
- **Frontend integration**: OpenAPI/Swagger and generated clients, CORS, pagination and error contracts that Angular can consume, RxJS-friendly API design.
- **Domain modeling**: DDD basics (entities, value objects, aggregates, bounded contexts), when it pays off and when it is overkill.
- **Career and communication**: explaining trade-offs, estimating, mentoring, system-design and coding interview practice (as hands-on tasks).
