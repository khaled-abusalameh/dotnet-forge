# Teaching contract: openapi

Prerequisites: api-design basics.

Outcome: Accurate specification and generated-client verification.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Keep the generated Angular-client exercise as an available variant; a generated C# client is an equivalent option when the trainee does not use Angular.

<!-- BEGIN PRESERVED CURRICULUM -->
# Swagger and OpenAPI track (Level 1, deepen at Level 4)

- **What it is**: the OpenAPI specification as a machine-readable contract, versus Swagger UI as one viewer of it. Read a real spec file line by line.
- **Tooling**: check the current docs for what the template and framework version recommend (built-in `Microsoft.AspNetCore.OpenApi` vs Swashbuckle vs NSwag), plus UI options (Swagger UI, Scalar, Redoc).
- **Quality of the docs**: `ProducesResponseType`/`Produces`, XML comments, examples, schema customization, enums and nullability in the schema, documenting authentication (JWT in the Authorize button), documenting multiple API versions, hiding internal endpoints, not exposing Swagger publicly in production by accident.
- **Contract-first and clients**: write the spec before the code, generate typed clients (for Angular and C#), detect breaking changes in CI by diffing specs.
- **Exercise**: take an undocumented API, make its spec accurate enough that a generated Angular client works without manual fixes.
