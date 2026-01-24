# Root Cause Analysis

## Immediate Cause

The incident was caused by **partial enforcement of ERP business rules**:

- Asset assignment logic allowed a new assignment
  without closing an existing active assignment
- Timesheet workflow allowed status updates
  without guaranteeing corresponding approval records

These conditions allowed the ERP to enter **logically invalid states**.

---

## Contributing Factors

### 1. Application-Level Assumptions
The ERP application assumed:
- Sequential user actions
- Successful completion of multi-step workflows

Under concurrency or edge cases, these assumptions did not always hold.

---

### 2. Missing Database-Level Guardrails
Critical business rules were enforced only in application logic.
The database did not yet enforce:
- One active assignment per asset
- Mandatory approval history for approved records

This allowed silent data drift.

---

### 3. Lack of Continuous Integrity Validation
At the time of the incident:
- Integrity checks were not automated
- Detection relied on downstream reconciliation

The issue was caught, but later than ideal.

---

## Root Cause Statement

> The root cause was reliance on application logic alone
> to enforce critical ERP business rules,
> without database-level enforcement or automated validation.

---

## Lessons Identified (Preliminary)

- ERP correctness must be enforced at the data layer
- Application workflows must be treated as fallible
- Detection must be proactive, not reactive

These lessons directly informed subsequent prevention and automation work.

