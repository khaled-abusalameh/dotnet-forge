# Teaching contract: testing

Prerequisites: Small callable function; API/data access for integration tests.

Outcome: Tests expose an injected bug; deepen at Level 3.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Introduce small executable checks at Level 0; the deep track below belongs at Level 3. Container-dependent tests require environment setup or pending status, never a fabricated pass.

<!-- BEGIN PRESERVED CURRICULUM -->
# Testing deep track (Level 3, practiced from then on)

- **Why and what**: the testing pyramid and its real-world shape, what to test and what not to, test naming, Arrange-Act-Assert, one behavior per test.
- **Practice**: unit tests (xUnit), fakes vs mocks vs stubs (and over-mocking as a smell), integration tests with `WebApplicationFactory` and a real SQL Server in Testcontainers, testing EF queries, testing validators and middleware, contract tests, flaky tests and how to remove them.
- **TDD**: do real red-green-refactor cycles on a feature, then discuss where TDD helps and where it slows you down.
- **Coverage and mutation testing**: why coverage percentage lies, what mutation testing reveals.
- **Exercise**: give a feature with hidden bugs and a test suite that passes anyway; the user must write tests that expose the bugs.
