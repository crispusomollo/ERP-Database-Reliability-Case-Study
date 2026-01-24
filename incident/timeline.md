## Incident Timeline

- T0: Month-end reconciliation detects anomalies
- T0 + 1h: Issue escalated to engineering
- T0 + 2h: Integrity violation confirmed
- T0 + 3h: Containment initiated


This timeline documents the progression of the ERP data integrity incident
from discovery through containment and resolution.

---

## Timeline

**T0 – Detection**
- Month-end reconciliation performed by Finance
- Asset utilization and timesheet reports flagged as inconsistent

**T0 + 30 minutes – Escalation**
- Issue escalated to ERP / Systems Engineering
- Initial assessment classified issue as data correctness risk

**T0 + 1 hour – Validation**
- Read-only investigation confirmed:
  - Multiple active asset assignments
  - Approved timesheets without approval records

**T0 + 2 hours – Containment**
- Write access to affected ERP modules restricted
- Downstream reporting paused to prevent propagation

**T0 + 3 hours – Root Cause Identified**
- Missing database-level enforcement of ERP business rules identified
- Reliance on application logic confirmed as root cause

**T0 + 4 hours – Resolution Initiated**
- Transactional correction scripts prepared
- Data integrity restored without destructive updates

**T0 + 6 hours – Verification**
- Post-fix validation confirmed zero integrity violations
- ERP modules safely re-enabled

**T0 + 24 hours – Prevention**
- Database guardrails and automated detection implemented
- Incident documented and reviewed

---

## Summary

The incident was detected internally, contained quickly,
and resolved without data loss or audit impact.
Preventive controls were implemented immediately after resolution.

