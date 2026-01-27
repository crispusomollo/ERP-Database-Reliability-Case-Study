# Key ERP Integrity Controls

This document identifies critical controls
that protect data integrity and auditability.

---

## KC-01: Asset Custody Uniqueness

- **Risk:** Duplicate asset assignment
- **Control:** DB-level conditional uniqueness
- **Detection:** Automated integrity queries
- **Owner:** ERP / DBA Lead

---

## KC-02: Approval Traceability

- **Risk:** Missing approval audit trail
- **Control:** Foreign key enforcement
- **Detection:** Approval integrity checks
- **Owner:** ERP Systems Lead

---

## KC-03: Change Regression Prevention

- **Risk:** Reintroduction of known defects
- **Control:** Pre-deploy integrity gates
- **Detection:** CI validation failures
- **Owner:** DevOps Lead

---

## KC-04: Incident Response Readiness

- **Risk:** Delayed or inconsistent response
- **Control:** Documented runbook & tabletop exercises
- **Owner:** Operations Lead

