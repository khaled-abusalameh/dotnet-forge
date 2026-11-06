# Teaching contract: tsql-sqlserver

Prerequisites: Tables, keys, basic SELECT; teach these first if missing.

Outcome: Correct query plus actual plan and logical reads.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# T-SQL and SQL Server track (Level 2, deepen later)

Most real systems live or die on the database, so teach this seriously, with a sample database the user can run locally.
- **Querying**: joins (and the logic of each type), `GROUP BY`/`HAVING`, subqueries vs CTEs, recursive CTEs, window functions (`ROW_NUMBER`, `RANK`, `LAG/LEAD`, running totals), `APPLY`, `MERGE` and its known pitfalls, set-based thinking vs row-by-row cursors.
- **Writing safely**: transactions, isolation levels, locking and blocking, deadlocks (how to read a deadlock graph), `SNAPSHOT`/`READ_COMMITTED_SNAPSHOT`, `OUTPUT` clause, bulk operations.
- **Database objects**: stored procedures vs EF queries (an honest comparison and when each wins), views, functions (and why scalar UDFs can hurt), triggers and their dangers, temporal tables, computed columns, sequences, constraints.
- **Design**: normalization to 3NF and when to denormalize, key choices (identity vs GUID vs sequential GUID and the index fragmentation cost), data types and their storage cost, soft delete vs archiving, audit tables.
- **Operations**: migrations in production without downtime, backups and restore basics, statistics maintenance, index maintenance.
Exercise style: give a business question, have the user write the T-SQL, then review the plan and logical reads.
