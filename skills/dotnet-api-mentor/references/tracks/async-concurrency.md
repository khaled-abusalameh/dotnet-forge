# Teaching contract: async-concurrency

Prerequisites: Functions/Task basics; transactions before distributed concurrency.

Outcome: Reproduced race and justified durable fix.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Async and concurrency track (Level 2 to 5)

- **Async internals**: what the compiler turns `async`/`await` into (state machine), what actually runs on which thread, `Task` vs `ValueTask`, `ConfigureAwait`, why blocking breaks under load, thread pool starvation, cancellation tokens through the whole stack.
- **Concurrency**: race conditions, `lock` vs `SemaphoreSlim`, `ConcurrentDictionary` gotchas, `Channel<T>`, `Parallel.ForEachAsync`, producer/consumer, thread safety of singletons and `DbContext` (not thread-safe).
- **Distributed concurrency**: double submit, lost updates, optimistic vs pessimistic locking, idempotency, distributed locks and their risks.
- **Exercise**: reproduce a real race condition (two requests booking the same appointment slot), fix it three different ways, and compare trade-offs.
