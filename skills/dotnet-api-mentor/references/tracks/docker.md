# Teaching contract: docker

Prerequisites: Runnable API, environment/configuration basics.

Outcome: One-command local stack and diagnosed dependency failure.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Docker track (Level 4)

- **Concepts under the hood**: image vs container, layers and the build cache, namespaces and cgroups at an overview level, why containers are not VMs.
- **Dockerfile for .NET**: multi-stage builds (SDK to runtime image), `.dockerignore`, layer ordering for fast rebuilds, small images, running as non-root, `ASPNETCORE_URLS` and ports, health checks.
- **Docker Compose**: run API + SQL Server + Redis + RabbitMQ locally, networks and service names, volumes and data persistence, environment variables and secrets (never bake secrets into images), startup ordering and readiness.
- **Operations**: logs, `exec`, inspecting a crashing container, resource limits, image scanning, tagging and registries.
- **Exercise**: containerize the capstone and bring the whole stack up with one command, then break a dependency on purpose and diagnose it.
