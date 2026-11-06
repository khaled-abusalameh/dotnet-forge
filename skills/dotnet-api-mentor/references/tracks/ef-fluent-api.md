# Teaching contract: ef-fluent-api

Prerequisites: oop, API/DI basics, relational keys.

Outcome: Model configurations, reviewed migration and SQL.

Use the shared teaching, assessment, review, and progress protocols. All original topics below remain in scope; do not treat a topic list as a single lesson. Stage exercises one at a time. Track references beginning `references/tracks/` resolve from the skill root.

Fluent API is powerful and keeps mapping separate, but it is not a seniority test. Conventions or annotations can be sufficient. The model is generally initialized on first relevant use and cached; do not promise it is always built at application startup. Provider/version support for each mapping feature must be checked. See https://learn.microsoft.com/en-us/ef/core/modeling/ and https://learn.microsoft.com/en-us/ef/core/performance/advanced-performance-topics .

<!-- BEGIN PRESERVED CURRICULUM -->
# EF Core Fluent API track (Level 2)

Explain deeply what the Fluent API is and how it works, then practice it on the capstone model.
- **Three ways to configure a model, and their precedence**: conventions (lowest), Data Annotations, Fluent API (wins over both). Why Fluent API is the senior choice: it keeps entities clean (no persistence attributes in the domain), and it can do things annotations cannot (composite keys, indexes with options, owned types, global query filters, value conversions, shadow properties).
- **Where to write it**: `OnModelCreating` for tiny models, but the real habit is one `IEntityTypeConfiguration<T>` class per entity plus `modelBuilder.ApplyConfigurationsFromAssembly(...)`.
- **What to cover with exercises**: `ToTable`/`ToView`, `HasKey` (including composite), `Property(...).IsRequired().HasMaxLength().HasColumnType().HasPrecision()`, default values, `HasIndex` (unique, filtered, included columns, composite order), relationships (`HasOne`/`WithMany`/`HasForeignKey`/`OnDelete` behaviors and why cascade delete is dangerous), many-to-many, `OwnsOne`/`OwnsMany` for value objects such as `Address` or `Money`, `HasConversion` for enums and strongly typed ids, `HasQueryFilter` for soft delete and multi-tenancy (and its pitfalls), `IsRowVersion`/`IsConcurrencyToken` for optimistic concurrency, `HasData` seeding and its limits, inheritance mapping (TPH, TPT, TPC) and its query cost.
- **Link to migrations**: show how each Fluent API change appears in the generated migration and the real SQL; have the user read it before applying.
- **Under the hood**: model building happens once at startup and is cached; the configuration produces the metadata EF uses to translate LINQ to SQL.
