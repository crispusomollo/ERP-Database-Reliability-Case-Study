# Failure Mode: Approval State Drift

## Scenario
A workflow record is marked APPROVED
without a corresponding approval record.

## Risk
- Audit trail inconsistency
- Compliance exposure

## Detection
- Approval integrity validation queries
- Pre-deploy enforcement checks

## Prevention
- Foreign key enforcement
- Transaction discipline

## Recovery
- Approval restoration scripts

## Residual Risk
Low

## Owner
ERP Systems Lead

## Review Cadence
Annual

