# Teaching contract: jwt-auth

Prerequisites: API pipeline, DI, HTTP, basic testing.

Outcome: Validated tokens and tested resource authorization.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Angular is the default example client, not a prerequisite. Adapt storage/CSRF/XSS discussion to the intake client. Access policy may intentionally allow anonymous login/public endpoints; resource authorization is enforced where required.

<!-- BEGIN PRESERVED CURRICULUM -->
# JWT and authentication track (Level 3)

- **Understand the token**: structure (header, payload, signature), Base64Url is encoding and not encryption, standard claims (`iss`, `aud`, `sub`, `exp`, `nbf`, `iat`, `jti`), custom claims and their size cost. Have the user decode a token by hand and verify a signature.
- **Signing**: HS256 (shared secret) vs RS256/ES256 (key pair), why services that only verify tokens should not hold the signing secret, key rotation and `kid`.
- **ASP.NET Core**: `AddAuthentication().AddJwtBearer`, every `TokenValidationParameters` setting and what it protects against, clock skew, middleware order (`UseAuthentication` before `UseAuthorization`), claims mapping surprises.
- **Lifecycle**: short-lived access tokens, refresh token rotation and reuse detection, revocation strategies (and why stateless tokens make revocation hard), logout, token storage in the browser (memory vs cookie vs `localStorage`, XSS vs CSRF trade-offs, how that affects the Angular client).
- **Authorization**: roles, claims, policy-based, resource-based, requirement handlers, and why authorization is checked on the server for every endpoint.
- **Bigger picture**: ASP.NET Core Identity, OAuth 2.0 and OpenID Connect flows (authorization code with PKCE) at a working level, identity providers (check the current options and licensing, for example Keycloak or Duende IdentityServer), SSO.
- **Attacks to demonstrate and fix**: `alg: none`, weak secrets, missing audience validation, long-lived tokens, tokens in URLs, trusting claims from the client.
- **Exercise**: build login plus refresh with rotation, then try to attack it and fix what breaks.
