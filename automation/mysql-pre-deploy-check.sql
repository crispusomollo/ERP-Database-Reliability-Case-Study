/* ============================================================
   MySQL Pre-Deploy Integrity Gate
   Purpose:
   Block deployment if known violations exist
   ============================================================ */

-- Deployment MUST fail if this returns rows
SELECT asset_id
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- Deployment MUST fail if this returns rows
SELECT t.id
FROM timesheets t
LEFT JOIN approvals a
  ON a.reference_type = 'TIMESHEET'
 AND a.reference_id = t.id
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

