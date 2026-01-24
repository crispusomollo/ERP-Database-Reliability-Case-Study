# Schema Design

## Design Goals

The ERP schema was designed to:

- Protect critical business workflows (assets, HR, approvals, finance)
- Preserve historical accuracy for audits and investigations
- Prevent silent data corruption
- Support safe, transactional recovery

---

## Core Architectural Principles

### 1. Separation of Static and Transactional Data

Static entities store long-lived attributes:

- Assets
- Employees
- Users
- Projects

Transactional entities capture **events over time**:

- Asset assignments
- Timesheet entries
- Approval actions
- Maintenance records

This separation prevents destructive updates and preserves history.

---

### 2. Time-Bound Lifecycle Records

Instead of overwriting records, lifecycle changes are captured as new rows.

Example:
- Asset reassignment creates a new assignment row
- Previous assignment is closed with a return date

This design enables:
- Full audit trails
- Point-in-time reporting
- Safe rollback and investigation

---

### 3. Database as the System of Record

The database enforces critical business rules:

- One active assignment per asset
- Approved timesheets must have approval records
- Referential integrity between workflow stages

Application logic supports workflows, but the database guarantees correctness.

---

## High-Level Schema Domains

| Domain | Purpose |
|------|--------|
| Assets | Asset master data |
| Asset Assignments | Custody and ownership history |
| HR & Timesheets | Employee effort and time tracking |
| Approvals | Workflow state and audit trail |
| Reporting | Finance and operational analytics |

---

## Why This Matters in ERP Systems

ERP systems span multiple modules, users, and integrations.
Without database-enforced integrity, inconsistencies propagate
into finance, audits, and decision-making.

This schema design ensures **ERP correctness even when applications fail**.

