# Teaching contract: microservices

Prerequisites: clean-architecture, docker, rabbitmq or kafka.

Outcome: Extract one bounded service and document operational cost.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Microservices track (Level 5)

- **Start with the honest question**: do you need microservices? Compare monolith, modular monolith, and microservices on team size, deployment, complexity, and cost. Most systems should start as a modular monolith.
- **Boundaries**: bounded contexts, service ownership, database per service, data duplication, Conway's law, the distributed monolith anti-pattern.
- **Communication**: synchronous (HTTP/gRPC) vs asynchronous (events), API gateway (for example YARP), service discovery, BFF pattern.
- **Hard problems**: distributed transactions and sagas, eventual consistency in the UI, idempotency, versioning contracts between services, retries and timeouts (Polly), cascading failures, circuit breakers.
- **Operations**: distributed tracing and correlation ids (OpenTelemetry), centralized logging, health checks, per-service CI/CD, contract testing, local development experience (check current .NET tooling such as Aspire).
- **Exercise**: extract Notifications (or Billing) from the capstone as a separate service with its own database, communicating through RabbitMQ or Kafka; then write down what got harder and what got better.

Prerequisites: `references/tracks/clean-architecture.md`, `references/tracks/docker.md`, and one of `references/tracks/rabbitmq.md` or `references/tracks/kafka.md`.
