# Cross-Platform Portability Notes

This document explains how core ERP data integrity rules are implemented
consistently across different database platforms while respecting each
engine’s native capabilities.

The goal is **portable business rules**, not identical SQL syntax.

---

## Design Philosophy

ERP systems often evolve over time and may run on different database
platforms due to organizational standards, licensing, or performance needs.

This architecture ensures that:
- Business rules remain consistent
- Enforcement mechanisms adapt per database
- Operational behavior is predictable across platforms

---

## Core Business Rules (Platform-Agnostic)

The following ERP rules apply regardless of database engine:

1. An asset may have **only one active assignment** at any point in time  
2. Approved workflow records must have **corresponding approval history**  
3. Time and effort records must be **validated and auditable**  
4. Invalid states must be **rejected or detected early**, not corrected later  

The **intent** of these rules never changes — only the **implementation** does.

---

## Platform-Specific Enforcement Patterns

### MySQL

- Uses standard constraints and indexed columns
- Relies on filtered indexes or application-assisted enforcement where needed
- Suitable for high-throughput ERP transactional workloads

Example:
```sql
CREATE UNIQUE INDEX ux_asset_active_assignment
ON asset_assignments(asset_id)
WHERE return_date IS NULL;
```

### PostgreSQL

- Native support for partial indexes
- Strong constraint enforcement
- Ideal for expressing lifecycle-based ERP rules declaratively

Example:
```sql
CREATE UNIQUE INDEX ux_asset_active_assignment
ON asset_assignments(asset_id)
WHERE return_date IS NULL;
```

### Oracle Database

- Uses function-based indexes to enforce conditional uniqueness
- Offers advanced constraint options (DEFERRABLE, INITIALLY DEFERRED)
- Well-suited for large, regulated ERP environments

Example:
```sql
CREATE UNIQUE INDEX ux_asset_active_assignment
ON asset_assignments (
  CASE WHEN return_date IS NULL THEN asset_id END
);
```

## Why Enforcement Differs by Engine

Different engines optimize for different workloads and design philosophies:

| Database   | Enforcement Style               |
| ---------- | ------------------------------- |
| MySQL      | Practical, performance-oriented |
| PostgreSQL | Declarative, rule-driven        |
| Oracle     | Enterprise-grade, feature-rich  |

Choosing the right enforcement mechanism ensures correctness without
introducing unnecessary complexity or performance penalties.

## Operational Implications

- Integrity rules are enforced as close to the data as possible
- Application logic remains portable and simpler
- Detection and recovery logic remains consistent across platforms
- Migration between engines does not change business semantics

## Testing & Validation Strategy

- Regardless of platform:
- Integrity rules are validated using read-only checks
- Violations are treated as incidents
- Recovery is performed transactionally
- Automation ensures continuous verification

## Key Takeaway

> Portability is about preserving intent, not duplicating syntax.

By designing ERP integrity rules around intent first, this architecture
supports multiple database platforms without sacrificing reliability,
auditability, or operational clarity.
