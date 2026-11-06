# Teaching contract: redis-caching

Prerequisites: API/data access, docker fundamentals.

Outcome: Measured cache benefit with invalidation/failure lab.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Treat single-threaded as a simplified description of command execution, not a claim that all Redis work uses one thread. Verify the chosen distribution/version before teaching internals or licensing.

<!-- BEGIN PRESERVED CURRICULUM -->
# Redis and caching track (Level 4)

- **Why**: what a cache solves and what it costs (staleness, invalidation, extra failure mode). Measure before and after with real numbers.
- **Redis fundamentals**: data structures (strings, hashes, lists, sets, sorted sets, streams), TTL and eviction policies, persistence (RDB vs AOF) and what is and is not durable, single-threaded model and why it is fast. Check current licensing and alternatives before recommending a distribution.
- **In .NET**: `IDistributedCache` vs `StackExchange.Redis` directly, `IMemoryCache` vs distributed cache, serialization choices, connection multiplexer reuse.
- **Patterns and problems**: cache-aside, write-through, write-behind, cache stampede and how to prevent it, cache penetration, hot keys, invalidation strategies, versioned keys, distributed locks and their real risks, rate limiting with Redis, sessions, pub/sub, SignalR backplane.
- **Exercise**: cache an expensive hospital report endpoint, handle invalidation when a patient record changes, simulate a stampede, and fix it.
