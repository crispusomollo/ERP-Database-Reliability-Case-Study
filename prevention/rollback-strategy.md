# Rollback Strategy for Preventive Controls

Preventive controls may require rollback
if they block legitimate business operations.

---

## When to Roll Back

- Unexpected constraint violations during normal workflows
- Performance degradation traced to new indexes
- Business process misalignment

---

## Rollback Rules

1. Roll back enforcement, not data
2. Drop only one constraint or index at a time
3. Re-run detection queries after rollback
4. Document rollback and root cause

---

## PostgreSQL Rollback Example

DROP INDEX IF EXISTS ux_asset_one_active_assignment;

---

## Oracle Rollback Example

DROP INDEX ux_asset_one_active_assignment;

---

## Key Principle

> Rollback restores flexibility, not correctness.
Correctness is re-established through redesign.

