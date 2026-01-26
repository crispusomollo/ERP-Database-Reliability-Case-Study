/* ============================================================
   Post-Recovery Validation
   Purpose:
   Confirm all known integrity rules are satisfied
   ============================================================ */

-- Check 1: Active asset assignments
SELECT asset_id
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- Check 2: Approved timesheets without approvals
SELECT t.id
FROM timesheets t
LEFT JOIN approvals a
    ON a.reference_type = 'TIMESHEET'
   AND a.reference_id = t.id
   AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

