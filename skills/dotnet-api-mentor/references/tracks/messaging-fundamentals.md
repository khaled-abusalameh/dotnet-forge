# Teaching contract: messaging-fundamentals

Prerequisites: async-concurrency, transactions; docker for broker labs.

Outcome: Idempotent consumer under duplicate delivery.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Discuss exactly-once with an explicit boundary: broker/transaction guarantees do not automatically cover external side effects. Preserve the topic without using the phrase below as a substitute for defining guarantees.

<!-- BEGIN PRESERVED CURRICULUM -->
# Messaging fundamentals (before RabbitMQ and Kafka)

Why asynchronous messaging, commands vs events, at-most-once / at-least-once / exactly-once (and why exactly-once is mostly a myth), idempotent consumers, ordering, retries and dead-letter queues, poison messages, the outbox and inbox patterns, eventual consistency, sagas (orchestration vs choreography), schema evolution of messages. Exercise: make a consumer safe against duplicate delivery.
