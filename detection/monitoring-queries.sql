/* ============================================================
   ERP MONITORING QUERIES
   Purpose:
   Support alerting and automation
   ============================================================ */

-- ------------------------------------------------------------
-- Metric 1: Count of assets with invalid active assignments
-- ------------------------------------------------------------
SELECT
    COUNT(*) AS invalid_asset_count
FROM (
    SELECT asset_id
    FROM asset_assignments
    WHERE return_date IS NULL
    GROUP BY asset_id
    HAVING COUNT(*) > 1
) v;

-- ------------------------------------------------------------
-- Metric 2: Count of approved timesheets without approvals
-- ------------------------------------------------------------
SELECT
    COUNT(*) AS unapproved_timesheets
FROM timesheets t
LEFT JOIN approvals a
    ON a.reference_type = 'TIMESHEET'
   AND a.reference_id = t.id
   AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

