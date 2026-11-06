# Teaching contract: kafka

Prerequisites: messaging-fundamentals exercise, docker; RabbitMQ concepts for comparison only.

Outcome: Replay into a read model and poison-message handling.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Load only RabbitMQ concepts needed for comparison when they are missing; do not create a circular prerequisite requiring completion of both broker tracks.

<!-- BEGIN PRESERVED CURRICULUM -->
# Kafka track (Level 4 to 5)

- **Model**: topics, partitions, offsets, brokers, replication, consumer groups, why Kafka is a distributed log rather than a queue, retention and log compaction.
- **Guarantees**: ordering only within a partition and how keys decide partitions, producer `acks`, idempotent producer, transactions, consumer offset commits, at-least-once handling, rebalancing and its pain.
- **Practical**: schema registry and Avro/Protobuf/JSON schema evolution, `Confluent.Kafka` client in .NET, consumer lag monitoring, partition count decisions, hot partitions, replay and reprocessing, event sourcing and CDC as use cases.
- **Kafka vs RabbitMQ**: an honest comparison (replay, throughput, routing flexibility, operational cost) and when you need neither.
- **Exercise**: stream patient-visit events, add a second consumer group that rebuilds a read model from the beginning, and handle a poison message.

Before this track, read `references/tracks/messaging-fundamentals.md`. After it, also read `references/tracks/rabbitmq.md` for the comparison section to be meaningful.
