# Teaching contract: api-design

Prerequisites: HTTP basics and C# functions.

Outcome: Explicit API contract and request evidence.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# API design track (Level 1 to 4)

- **REST done properly**: resource modeling, correct verbs and idempotency (`PUT` vs `PATCH` vs `POST`), status codes, `ProblemDetails`, the real meaning of REST maturity levels, HATEOAS and why most APIs skip it.
- **Contracts**: request/response design, filtering, sorting, searching, pagination (offset vs keyset), partial responses, consistent error format, versioning strategies and their costs, OpenAPI/Swagger as the contract, backward-compatible changes vs breaking changes.
- **Reliability**: idempotency keys, ETags and conditional requests, optimistic concurrency exposed through the API, rate limiting, timeouts, long-running operations (202 Accepted plus status endpoint).
- **Style choices**: controllers vs minimal APIs, `IExceptionHandler`, endpoint filters, model validation pipeline, when gRPC or GraphQL is the better fit.
- **Exercise**: review a badly designed API (verbs in URLs, wrong codes, leaking entities) and redesign it, then write the OpenAPI contract first and implement against it.
