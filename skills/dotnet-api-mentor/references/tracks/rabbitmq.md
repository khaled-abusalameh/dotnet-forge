# Teaching contract: rabbitmq

Prerequisites: messaging-fundamentals exercise, docker.

Outcome: Crash/redelivery lab with safe consumer effects.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# RabbitMQ track (Level 4)

- **Model**: producer, exchange, binding, queue, consumer. Exchange types (direct, topic, fanout, headers) and routing keys, virtual hosts, connections vs channels.
- **Reliability**: durable queues and persistent messages, publisher confirms, consumer acks and nacks, prefetch (QoS), redelivery, retry with delay, dead-letter exchanges, quorum queues, ordering limits with multiple consumers.
- **Patterns**: work queues, pub/sub, routing, topics, request/reply (RPC) and its dangers, competing consumers.
- **In .NET**: the official client vs MassTransit (check current licensing and versions), consumer setup, serialization, error handling, health checks.
- **Exercise**: appointment-booked event feeds notification and billing consumers; kill a consumer mid-message, restore it, and prove nothing was lost or duplicated unsafely.

Before this track, read `references/tracks/messaging-fundamentals.md` and make sure the user has done its exercise.
