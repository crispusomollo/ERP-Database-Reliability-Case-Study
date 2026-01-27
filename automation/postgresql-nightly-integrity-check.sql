/* ============================================================
   PostgreSQL Nightly Integrity Check
   ============================================================ */

-- Multiple active asset assignments
SELECT asset_id
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- Approved timesheets missing approval record
SELECT t.id
FROM timesheets t
LEFT JOIN approvals a
  ON a.reference_type = 'TIMESHEET'
 AND a.reference_id = t.id
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

