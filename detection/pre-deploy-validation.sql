/* ============================================================
   PRE-DEPLOY INTEGRITY VALIDATION
   Purpose:
   Prevent known integrity regressions
   ============================================================ */

-- Fail deployment if duplicate active asset assignments exist
SELECT
    asset_id
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- Fail deployment if approved records lack approvals
SELECT
    t.id
FROM timesheets t
LEFT JOIN approvals a
    ON a.reference_type = 'TIMESHEET'
   AND a.reference_id = t.id
   AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

