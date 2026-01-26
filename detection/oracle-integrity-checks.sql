/* ============================================================
   Oracle Integrity Validation Queries
   ============================================================ */

-- ------------------------------------------------------------
-- Check 1: Multiple active asset assignments
-- ------------------------------------------------------------
SELECT
    asset_id,
    COUNT(*) AS active_assignments
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- ------------------------------------------------------------
-- Check 2: Approved timesheets without approval record
-- ------------------------------------------------------------
SELECT
    t.id AS timesheet_id,
    t.employee_id,
    t.work_date
FROM timesheets t
LEFT JOIN approvals a
  ON a.reference_type = 'TIMESHEET'
 AND a.reference_id = t.id
 AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

-- ------------------------------------------------------------
-- Check 3: Orphaned approvals
-- ------------------------------------------------------------
SELECT
    a.id AS approval_id,
    a.reference_type,
    a.reference_id
FROM approvals a
LEFT JOIN timesheets t
  ON a.reference_type = 'TIMESHEET'
 AND a.reference_id = t.id
WHERE a.reference_type = 'TIMESHEET'
  AND t.id IS NULL;

