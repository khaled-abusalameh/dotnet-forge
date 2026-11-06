# Teaching contract: query-complexity

Prerequisites: LINQ basics; tsql-sqlserver before plan analysis.

Outcome: Measured query improvement with stable results.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Complexity estimates below are simplified operator models, not SQL latency guarantees. Functions on columns often obstruct useful seeks, but inspect the actual plan rather than treating the wording below as a universal law. Account for output cardinality, sort cost, memory/spills, statistics, and optimizer transformations.

<!-- BEGIN PRESERVED CURRICULUM -->
# Query complexity track (SQL Server and EF Core)

Teach the user to **measure**, not guess. Build these skills in order:
1. **Big-O for code**: LINQ costs (`Contains` on a List vs HashSet, nested loops, `OrderBy` n log n, deferred execution and multiple enumeration), `IEnumerable` vs `IQueryable` (where does the filter run?).
2. **Read the generated SQL**: use `ToQueryString()`, logging (`LogTo`), and spot N+1, cartesian explosion from multiple `Include`s (and `AsSplitQuery`), client evaluation.
3. **Execution plans**: scan vs seek, key lookup, estimated vs actual rows, spills, missing index hints (and why not to apply them blindly).
4. **Join algorithms and their complexity**: nested loops (about O(n*m) without an index, great for small outer input), hash join (about O(n+m), needs memory), merge join (O(n+m) on sorted input). Why the optimizer picks each.
5. **Index math**: B-tree seek is O(log n), scan is O(n); clustered vs nonclustered, composite index column order, covering/INCLUDE, selectivity, SARGability (functions on columns kill seeks), index cost on writes.
6. **Measure for real**: `SET STATISTICS IO, TIME ON`, **logical reads** as the main metric, Query Store, wait stats, parameter sniffing, statistics and cardinality estimates.
7. **Pagination and big data**: OFFSET vs keyset pagination complexity, batching, bulk operations.
Exercise style: give a slow query plus a table with a million rows (generate data with a script), have the user predict the plan, then confirm with the real plan and logical reads before and after.

Related: `references/tracks/tsql-sqlserver.md` and `references/tracks/ef-fluent-api.md`.
