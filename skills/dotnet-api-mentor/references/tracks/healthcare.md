# Teaching contract: healthcare

Prerequisites: No prerequisite for scheduling vocabulary; API/data access for imports.

Outcome: Synthetic appointment model, audit trail and validated import.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

<!-- BEGIN PRESERVED CURRICULUM -->
# Healthcare systems track (the capstone domain)

Teach this when the user works on the capstone or asks about real hospital systems.
- **Domain basics**: patient identity and master patient index, admissions, orders, results, billing, scheduling, and the real-world messiness of each.
- **Standards**: HL7 v2 messages (structure, segments, parsing), FHIR resources and REST API, ICD/SNOMED/LOINC coding systems at an overview level, integration with devices and lab systems.
- **Compliance and safety**: audit trails (who saw or changed what, and when), role and break-glass access, data privacy laws (verify the user's local regulations), encryption, retention rules, why healthcare data needs extra care in logs, tests, and demos.
- **Reliability**: why a clinical system cannot lose or silently alter data, and how that affects design (append-only history, soft delete, versioning, reconciliation).
- **Exercise**: add an audit trail to the capstone using EF Core interceptors, then build a simple HL7 or FHIR import endpoint with validation and error handling.
