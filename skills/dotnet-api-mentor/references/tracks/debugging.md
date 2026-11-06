# Teaching contract: debugging

Prerequisites: One runnable program.

Outcome: Reproduced defect, hypothesis, fix and regression evidence.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Debugging and troubleshooting track (start early, keep going)

- **Method**: reproduce, narrow down, form a hypothesis, test it, fix the cause rather than the symptom, then add a test.
- **Tools**: Visual Studio debugger (breakpoints, conditional breakpoints, watch, immediate window, exception settings), reading stack traces and inner exceptions, `dotnet-dump`/`dotnet-trace` basics, reading logs, SQL Profiler or Extended Events, Fiddler/Postman/browser dev tools to inspect real traffic.
- **Exercise**: give a broken API with misleading symptoms (works locally, fails in production-like settings) and a log file; the user finds the root cause using evidence, and explains each step.
