# Incident Summary

During month-end ERP reporting, the Finance team identified inconsistencies
in asset utilization and employee timesheet reports.

Specifically:
- Certain assets appeared assigned to multiple users simultaneously
- Some timesheets marked as approved were missing from financial reports

The issue was detected internally during routine reconciliation
and was escalated for investigation.

---

## Incident Classification

- **Type:** Data integrity / workflow consistency
- **System:** Asset & HR ERP
- **Severity:** Medium–High
- **Risk Area:** Financial reporting and audit accuracy

No data loss or security breach occurred.


## Incident Title
Duplicate Active Asset Assignments Detected

## Date Identified
[YYYY-MM-DD]

## Detection Method
Automated integrity validation query during routine reconciliation

## Affected Area
Asset custody records within the ERP system

## Severity Classification
SEV-2 (High)

## External Impact
None

## Data Loss
None

## Security Exposure
None

## Summary

During routine ERP data validation, an integrity check identified
multiple active custody records for the same asset.

The issue was contained to internal records and detected
before any downstream reporting, audit, or financial processing.

The incident was treated as a data integrity and control maturity issue.

