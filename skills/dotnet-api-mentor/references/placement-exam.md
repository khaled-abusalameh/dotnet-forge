# Placement exam: six tasks, 90 minutes

## Administration

Use placement mode, one task at a time. Intake is unscored: ask separately for alias, preferred language, experience, hours per week, goal, and environment (OS, SDK, SQL/container access, editor, timezone, frontend preference). Do not require real identity or employer details. Confirm whether prior progress exists. Setup time and interruptions are not scored time. The 90-minute budget is a target, not an accessibility penalty; split across sittings and record elapsed active minutes after every section.

Tell the trainee: this is diagnostic, no multiple choice; explain reasoning and provide code/output. Official documentation, compiler diagnostics, and ordinary editor completion are allowed. Disclose tools used. Generative solutions, answer-key consultation, and another person's implementation invalidate independence, not the learner's worth. Public repository answer keys cannot be made secret. Before starting ask whether this form has been seen; choose an unexposed form. Never accuse without evidence. Request a fresh explain-back or new form if provenance is unclear.

Use A initially and B for an unexposed retest. Never display both forms or the key to the trainee during the exam. No hints, corrections, leading questions, or scoring feedback until the assessment ends. Clarify the contract without explaining a solution. If asked for teaching, end the scored attempt, mark exposed tasks, then teach separately. Save responses and per-task evidence after each submission; do not reveal internal evaluation yet.

After both A and B are exposed, create and record C with NEW code, fixtures, and failure trigger before administering it; preserve time, criteria, difficulty, and invariants. Trainer reviews its key first. If no reviewer is available, label the generated form uncalibrated and placement provisional. Do not pretend two public forms support unlimited secure retesting.

## Rubric, scoring, and ceiling

Each task has four named criteria below, each scored 0-3: 0 = absent, incorrect, or unsafe; 1 = partial with a material unresolved defect; 2 = independently correct for stated requirements with adequate explanation; 3 = correct with edge-case evidence and justified trade-offs. Use the task key as evidence anchors, accept equivalent solutions, and quote the trainee's actual code/reasoning for EACH score. Grammar/accent and tool preference are not scoring criteria. Tests can be trainee-reported; label their provenance. Runtime-dependent criteria remain provisional when evidence is missing.

Total = sum of 24 criterion scores, maximum 72. Score bands: 0-17 => L0; 18-29 => L1; 30-41 => L2; 42-53 => L3; 54-65 => L4; 66-72 => L5. Task-qualified means >=8/12 AND every criterion >=2. Evidence ceiling starts at L0: qualified T1 permits L1, contiguous qualified T1-T2 permits L2, T1-T3 permits L3, T1-T4 permits L4, T1-T5 permits L5. T6 still contributes to total and mandatory remediation; a zero on its safety criterion caps the ceiling at L3. Starting level = min(score level, ceiling). Placement selects where to BEGIN learning, never certifies all earlier gates or senior employment readiness.

Adaptive stop: after T1, stop if total <=3 or the learner cannot attempt basic C# after neutral setup clarification. Otherwise stop after any two consecutive tasks below 6/12, or at the learner's request. Record later tasks as not_assessed with null scores; they contribute zero points to the fixed-denominator total (never normalize to attempted tasks), and cannot satisfy ceiling prerequisites. Distinguish this arithmetic from a judgment that unseen answers were wrong. Environmental failure suspends the task, not a scored zero. Save a provisional outcome until the required evidence can be supplied.

Examples: all 2s gives 48/72, score L3, ceiling L5, start L3. T1=[1,3,3,3] and all other criteria=3 gives 70/72 but ceiling L0, start L0 with a targeted foundation recheck. Early stop after T1=[1,1,0,0] gives 2/72 and start L0. These conservative rules prevent aggregate strength hiding a prerequisite gap.

## T1 - C# semantics and OOP (10 minutes)

Run in a console project using the installed SDK. Predict output BEFORE executing, then run, explain it, and replace the mutable field with an invariant-preserving design. Submit a test/program showing rejection of invalid values and acceptance of a valid value.

Form A: explain aliasing; require duration >0.

```csharp
var first = new Appointment { Minutes = 15 };
var second = first;
second.Minutes = 0;
Console.WriteLine(first.Minutes);
public class Appointment { public int Minutes; }
```

Form B: explain copying and shared references; require every charge >0 and prevent external mutation of charges.

```csharp
var first = new Invoice(new List<int> { 10 });
var second = first;
second.Charges.Add(-5);
Console.WriteLine(first.Charges.Count);
public record Invoice(List<int> Charges);
```

Criteria: C1 output/semantics; C2 invariant-preserving design; C3 invalid/valid execution evidence; C4 explanation of identity, mutability, and design cost. Remediate with oop and naming-code-style.

## T2 - Web API endpoint (15 minutes)

Implement in a minimal ASP.NET Core app. In-memory state is allowed; no database required. Return a DTO, validate at the boundary, and demonstrate HTTP responses using curl or equivalent. State lifetime/thread-safety assumptions. A matching GET may be minimal but the Location must resolve for a successful creation.

Form A: implement POST /appointments using this request. DoctorId must be >0, Minutes 5-120, StartsAt in the future relative to UTC. Return 201 plus Location and generated ID; invalid input returns 400 with field errors. Demonstrate valid, invalid, and malformed JSON.

```csharp
public record CreateAppointmentRequest(int DoctorId, DateTimeOffset StartsAt, int Minutes);
// Map the endpoint and a GET route; supply your implementation.
```

Form B: implement POST /departments. Code must be 2-8 uppercase ASCII letters, Name nonblank and <=80 characters. Return 201 plus resolvable Location; duplicate Code =>409; invalid=>400. Demonstrate valid, duplicate, and invalid JSON/value requests.

```csharp
public record CreateDepartmentRequest(string? Code, string? Name);
// Map the endpoint and a GET route; supply your implementation.
```

Criteria: C1 contract/statuses; C2 boundary validation; C3 DTO/state correctness and naming; C4 execution evidence/explanation. Remediate with api-design, openapi, naming-code-style.

## T3 - EF Core bug hunt (15 minutes)

Assume a scoped HospitalDbContext with SQL Server. Patient has Id, Name and a collection of Appointments; Appointment has Id, PatientId, StartsAt and Patient navigation. Rewrite to one bounded read-only DTO query. Show generated SQL or state what must be verified when SQL Server is unavailable. Do not assert an exact plan from LINQ alone.

Form A: the following runs one query per patient plus an initial patient query. Return the first 20 patients by Id with their appointment counts. Propagate cancellation.

```csharp
var patients = await db.Patients.ToListAsync(ct);
var result = new List<PatientCountDto>();
foreach (var p in patients)
{
    var count = await db.Appointments.CountAsync(a => a.PatientId == p.Id, ct);
    result.Add(new PatientCountDto(p.Id, p.Name, count));
}
public record PatientCountDto(int Id, string Name, int Count);
```

Form B: this read path accidentally changes patient data when SaveChanges runs later. Return up to 20 appointments from fromInclusive, sorted by StartsAt then Id, with patient name in uppercase for DISPLAY only.

```csharp
var rows = await db.Appointments.Include(a => a.Patient).ToListAsync(ct);
foreach (var row in rows) row.Patient.Name = row.Patient.Name.ToUpperInvariant();
return rows.Where(a => a.StartsAt >= fromInclusive).ToList();
```

Criteria: C1 diagnosis and cost; C2 correct server-side bounded query; C3 tracking/data safety/cancellation; C4 SQL/evidence and trade-off explanation. Remediate with ef-fluent-api, query-complexity, async-concurrency.

## T4 - T-SQL and indexing (15 minutes)

Use synthetic data in a disposable SQL Server database. Table: Appointments(Id bigint PK, DoctorId int, StartsAt datetime2, Status varchar(12)); Bills(Id bigint PK, PatientId int, IssuedAt datetime2, Amount decimal(12,2)). Write the query and candidate index; explain seek keys, residual predicates, ordering, write costs, and how actual plan plus STATISTICS IO/TIME would validate it. If no database is available, submit the query and measurement protocol; execution remains pending.

Form A: return the next 20 appointments for @DoctorId in [@Start,@End), ordered by StartsAt then Id. Repair this predicate and avoid SELECT *:

```sql
SELECT * FROM Appointments
WHERE DoctorId = @DoctorId AND CAST(StartsAt AS date) = @Day;
```

Form B: return the latest 20 bills for @PatientId in [@Start,@End), ordered by IssuedAt DESC then Id DESC, including Amount. Repair this query:

```sql
SELECT * FROM Bills
WHERE PatientId = @PatientId AND YEAR(IssuedAt) = @Year;
```

Criteria: C1 result boundaries/order; C2 index design; C3 plan/IO reasoning; C4 parameterization and index/write trade-offs. Remediate with tsql-sqlserver and query-complexity.

## T5 - Review a flawed controller (20 minutes)

Write PR comments with severity, exact defect, production consequence, and direction; sketch corrected ownership/lifetime/async flow. Do not rewrite the entire application. Supply a failing integration-test outline and a lifetime/startup check; run a minimal reproduction when the environment supports it, otherwise mark execution pending. Assume the caller is authenticated but must only access their own patient records. CanAccessAsync below is an application service method, not a framework API.

Form A:

```csharp
builder.Services.AddDbContext<HospitalDbContext>();
builder.Services.AddSingleton<PatientService>();
public class PatientService(HospitalDbContext db)
{
    public Task<Patient?> GetAsync(int id) => db.Patients.FindAsync(id).AsTask();
}
[ApiController, Route("patients")]
public class PatientsController(PatientService service) : ControllerBase
{
    [HttpGet("{id}")]
    public IActionResult Get(int id) => Ok(service.GetAsync(id).Result);
}
```

Form B:

```csharp
builder.Services.AddDbContext<HospitalDbContext>();
builder.Services.AddSingleton<ReportService>();
public class ReportService(HospitalDbContext db)
{
    public async Task<string> RenderAsync(int id) =>
        (await db.Patients.FindAsync(id))!.Name;
}
[ApiController, Route("reports")]
public class ReportsController(ReportService service, AccessService access) : ControllerBase
{
    [HttpGet("{id}")]
    public IActionResult Get(int id)
    {
        _ = access.CanAccessAsync(User, id);
        return Ok(service.RenderAsync(id).Result);
    }
}
```

Criteria: C1 async/cancellation; C2 lifetime/correctness; C3 resource authorization/privacy; C4 prioritized comments and verification plan. Remediate with async-concurrency, jwt-auth, testing, debugging.

## T6 - Concurrency and design (15 minutes)

Explain a two-request interleaving, propose a database-enforced fix and retry behavior, and design an executable two-client test. Supply pseudocode or code for the critical transaction; don't rely on an in-process lock across API replicas.

Form A: fixed slots, one active booking per SlotId, SQL Server, two API instances. A retry after a timeout must not create a second booking for the same request key.

```csharp
if (!await db.Bookings.AnyAsync(b => b.SlotId == slotId, ct))
{
    db.Bookings.Add(new Booking { SlotId = slotId, RequestKey = key });
    await db.SaveChangesAsync(ct);
}
```

Form B: invoice Balance must never become negative, two API instances, duplicate RequestKey must not charge twice. A notification is sent after payment.

```csharp
var invoice = await db.Invoices.SingleAsync(x => x.Id == id, ct);
if (invoice.Balance >= amount)
{
    invoice.Balance -= amount;
    await db.SaveChangesAsync(ct);
    await notifier.SendAsync(id, ct);
}
```

Criteria: C1 interleaving diagnosis; C2 durable atomicity/data safety; C3 idempotency/failure handling; C4 reproducible concurrency test and trade-offs. Remediate with async-concurrency, tsql-sqlserver, messaging-fundamentals.

## Mentor key - do not present before assessment ends

These are reference answers, not the only accepted implementations. A score of 2 meets the listed requirements; 3 additionally demonstrates edge cases and explains alternatives independently. Reserve 1 for material gaps, not cosmetic differences. Do not award full execution credit for an unrun sketch.

T1 A prints 0 because both variables refer to the same object. A constructor validating minutes and a getter-only property preserves the invariant; invalid construction throws a suitable argument exception. Test -1, 0, and 15. T1 B prints 2; record syntax does not deep-copy or freeze a referenced List. Copy the input, reject nonpositive charges, and expose a nonmutating view (not an array/list callers can cast and mutate). Test external input mutation and exposed collection behavior as well as invalid entries. Explain allocation and copy cost.

T2 A reference flow: validate DoctorId, Minutes, and StartsAt; on failure return ValidationProblem; otherwise generate a unique ID, store in a thread-safe in-memory store, return Created($"/appointments/{id}", responseDto); GET returns DTO or 404. Use a clock seam for deterministic future-date tests. T2 B validates Code/Name, atomically adds by Code (e.g. TryAdd), maps duplicates to Conflict, and provides lookup. Check malformed JSON behavior through an actual request rather than claiming custom validation handles parsing. Do not claim an in-memory store is durable or replica-safe.

T3 A reference query:

```csharp
var query = db.Patients.AsNoTracking().OrderBy(p => p.Id).Take(20)
    .Select(p => new PatientCountDto(p.Id, p.Name, p.Appointments.Count));
var sql = query.ToQueryString();
var result = await query.ToListAsync(ct);
```

Expect one SQL command with a translated count, not N application round trips; inspect generated SQL and command logs. Pure scalar DTO projection does not materialize tracked entities, so AsNoTracking is explicit intent rather than essential for this projection. T3 B reference: filter/order/Take(20) and project Id, StartsAt, Patient.Name in SQL, execute with ct, then uppercase the at-most-20 DTO strings in memory. This avoids mutating tracked patients and avoids assuming provider translation for ToUpperInvariant. Confirm the change tracker has no modified patient and later SaveChanges does not change names.

T4 A reference:

```sql
SELECT TOP (20) Id, DoctorId, StartsAt, Status
FROM Appointments
WHERE DoctorId=@DoctorId AND StartsAt>=@Start AND StartsAt<@End
ORDER BY StartsAt, Id;
CREATE INDEX IX_Appointments_Doctor_Start_Id
ON Appointments(DoctorId, StartsAt, Id) INCLUDE(Status);
```

T4 B reference:

```sql
SELECT TOP (20) Id, PatientId, IssuedAt, Amount
FROM Bills
WHERE PatientId=@PatientId AND IssuedAt>=@Start AND IssuedAt<@End
ORDER BY IssuedAt DESC, Id DESC;
CREATE INDEX IX_Bills_Patient_Issued_Id
ON Bills(PatientId, IssuedAt DESC, Id DESC) INCLUDE(Amount);
```

Equivalent backward-scan indexing is acceptable with an explanation. Evaluate actual plan, rows, logical reads, and write/storage cost on representative distributions. Index creation is a candidate experiment, not a promise of a seek. Parameters are typed and bound, not string-concatenated. No need to apply these indexes to real production.

T5 A/B: singleton captures scoped DbContext; use scoped services or intentionally created/disposed scopes for background operations. Await I/O all the way and propagate cancellation where supported. A leaks entities and lacks resource ownership checks; null should not become 200. B discards the authorization result and can disclose data; await AND enforce it before rendering; handle missing records. Authentication alone is insufficient. Never add blanket Task.Run to hide blocking. Critical test: a different patient's authenticated user receives no data; test not-found and canceled calls; validate service scopes at startup. Comments prioritize authorization and lifetime defects before naming. State suitable 401/403/404 behavior under an explicit disclosure policy.

T6 A: both reads can observe no booking. Enforce unique SlotId for the stated active-booking model and an appropriately scoped unique request key with stored payload fingerprint/result. Insert atomically, map only recognized uniqueness conflicts, reject same key with different payload, and replay a committed response after timeout. If active/canceled rows coexist, use a suitable filtered uniqueness design. T6 B: a conditional update (Balance>=amount) or rowversion conflict handling prevents lost updates; positive amount validation and a unique payment request key must participate in the same transaction as debit. Record result plus outbox notification atomically; send outside the transaction with idempotent processing. A check constraint is defense in depth. Test synchronized parallel clients against the database and verify final counts/balance after retries and notification failure. No claim of exactly-once end-to-end external side effects without a defined boundary.

## Report and retest

After stopping/completing, report intake context, each task's four scores and evidence, raw total/72, unassessed tasks, score level, ceiling, starting level, execution limits, remediation tracks, and next exercise. No gate is implicitly passed. Provide a two-week plan sized to hours_per_week: week 1 targets the earliest weak prerequisite, week 2 uses fresh practice plus independent transfer. State session counts and expected evidence, not guaranteed mastery.

Retest after targeted remediation and at least 48 hours from the last assessment, using an unused parallel form. Record retry_after in the trainee timezone. If the date/time is unknown, ask; do not infer readiness. Previously seen tasks are practice only. Preserve old results and compare like-for-like criteria; do not erase weaknesses until the two-day independent-pass rule is met.
