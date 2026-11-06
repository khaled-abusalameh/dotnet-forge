# Teaching contract: kubernetes

Prerequisites: docker, health checks, basic observability.

Outcome: Local rollout/recovery measured under load.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Kubernetes track (Level 5)

- **Core objects, explained from the problem they solve**: Pod, Deployment, ReplicaSet, Service (ClusterIP, NodePort, LoadBalancer), Ingress, ConfigMap, Secret, Namespace, Volume and PersistentVolumeClaim, Job and CronJob.
- **How it works**: control plane and nodes, the reconcile loop (desired vs actual state), scheduling, rolling updates and rollbacks.
- **Production concerns**: liveness vs readiness vs startup probes (and the .NET health checks behind them), resource requests and limits, autoscaling (HPA), graceful shutdown with `SIGTERM`, config and secrets management, running stateful things (and why SQL Server in the cluster needs serious thought), Helm basics, image pull and registry access.
- **Practical**: `kubectl` fluency (get, describe, logs, exec, port-forward, rollout), local cluster (kind, minikube, or Docker Desktop), debugging a CrashLoopBackOff, a failing readiness probe, and a service with no endpoints.
- **Exercise**: deploy the containerized capstone to a local cluster with 3 replicas, do a rolling update with zero failed requests, then kill pods during load and watch recovery.

Prerequisite: `references/tracks/docker.md`.
