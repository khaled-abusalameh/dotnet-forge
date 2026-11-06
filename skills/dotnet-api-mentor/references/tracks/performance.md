# Teaching contract: performance

Prerequisites: API/data access; query-complexity for database diagnosis.

Outcome: Repeatable baseline, one change, measured improvement.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Performance track

Always the same discipline: **measure, find the bottleneck, fix one thing, measure again.**
- **What hurts most, in order of typical impact**: (1) database access (N+1, missing indexes, chatty calls, over-fetching), (2) I/O and remote calls (no caching, no timeouts, sequential calls that could be parallel), (3) blocking async (`.Result`, sync over async, thread pool starvation), (4) memory and allocations (large objects, LOH, string concatenation, boxing, big JSON payloads), (5) serialization and payload size (projection, compression, pagination), (6) CPU hot paths (rare in CRUD APIs, so profile before optimizing).
- **Tools**: `dotnet-counters`, `dotnet-trace`, `dotnet-dump`, Visual Studio profiler, BenchmarkDotNet, Application Insights or OpenTelemetry, SQL Query Store, load testing (k6 or NBomber).
- **Topics**: async/await internals and `ConfigureAwait`, thread pool, GC generations and Server vs Workstation GC, `Span<T>` and `ArrayPool` (when they are justified), `IAsyncEnumerable`, response caching, output caching, `IMemoryCache` vs Redis, HttpClient reuse (`IHttpClientFactory`) and socket exhaustion, connection pooling, compiled queries, `AsNoTracking`, `ExecuteUpdate`/`ExecuteDelete`, rate limiting and backpressure.
- **Exercise**: give a deliberately slow endpoint, have the user profile it, rank the bottlenecks, fix them, and show before/after numbers. No optimizing without numbers.
