# Prevention Design Notes

## Why Constraints, Not Triggers

- Constraints are visible and predictable
- Triggers hide logic and complicate audits
- Constraints fail immediately and clearly

## Why Database-Level Enforcement

- Application logic cannot guarantee serialization
- Databases are concurrency authorities
- Enforcement must survive future code changes

## Prevention Philosophy

> If a state must never exist,
> the database must refuse to store it.

