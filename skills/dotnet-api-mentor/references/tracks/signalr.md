# Teaching contract: signalr

Prerequisites: API pipeline, jwt-auth, async basics; docker for scale lab.

Outcome: Authorized two-instance waiting-room updates.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

The Angular/RxJS material is preserved as an optional client integration. Use the learner's chosen client for core hub lessons; do not force Angular setup.

<!-- BEGIN PRESERVED CURRICULUM -->
# SignalR track (Level 4)

- **Transports**: WebSockets, Server-Sent Events, long polling, negotiation and fallback, and how each works at the HTTP level.
- **Hubs**: hub methods, clients and groups, strongly typed hubs, sending from outside a hub (`IHubContext`), connection lifecycle and `ConnectionId`, streaming.
- **Security**: authentication with JWT (the access token on the query string for WebSockets and its logging risk), authorization on hubs, CORS.
- **Scale and reliability**: sticky sessions, Redis backplane or a managed service, automatic reconnect and message loss, presence tracking, backpressure.
- **Angular client**: `@microsoft/signalr`, reconnect handling, RxJS integration.
- **Exercise**: a live waiting-room queue screen that updates when a doctor calls the next patient; then run two API instances and make it still work.
