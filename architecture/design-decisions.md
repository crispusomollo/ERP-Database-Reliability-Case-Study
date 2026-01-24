# Architectural Design Decisions

This document explains *why* certain architectural choices were made.

---

## Why Not Overwrite Records?

Overwriting destroys historical truth.
ERP systems must explain *how* a state was reached, not just the current state.

Lifecycle history supports:
- Audits
- Compliance reviews
- Root cause analysis

---

## Why Enforce Rules in the Database?

Application logic:
- Changes frequently
- Can be bypassed
- Does not see all data writes

The database:
- Sees every write
- Is consistent across modules
- Is the last line of defense

Critical ERP rules belong in the database.

---

## Why Use Guardrails Instead of Cleanup Jobs?

Cleanup jobs fix symptoms.
Guardrails prevent the problem.

Constraints and validation queries stop bad data
from entering the system in the first place.

---

## Tradeoffs Considered

| Decision | Tradeoff |
|-------|---------|
| More constraints | Slight write overhead |
| Historical tables | Larger datasets |
| Automation | Operational complexity |

These tradeoffs were accepted because **data correctness outweighs convenience**.

