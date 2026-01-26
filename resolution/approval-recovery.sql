/* ============================================================
   Approval Recovery
   Purpose:
   Restore missing approval records
   ============================================================ */

-- SAFETY CHECK
SELECT t.id AS timesheet_id
FROM timesheets t
LEFT JOIN approvals a
    ON a.reference_type = 'TIMESHEET'
   AND a.reference_id = t.id
   AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

-- ============================================================
-- BEGIN TRANSACTION
-- ============================================================
START TRANSACTION;

-- Strategy:
-- Insert missing approval records using system approver
-- Only for records already marked APPROVED

INSERT INTO approvals (
    reference_type,
    reference_id,
    approved_by,
    approval_status,
    approved_at,
    comments
)
SELECT
    'TIMESHEET',
    t.id,
    t.employee_id,
    'APPROVED',
    CURRENT_TIMESTAMP,
    'Approval restored during integrity recovery'
FROM timesheets t
LEFT JOIN approvals a
    ON a.reference_type = 'TIMESHEET'
   AND a.reference_id = t.id
   AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

-- ============================================================
-- POST-INSERT VERIFICATION (MUST RETURN ZERO ROWS)
-- ============================================================
SELECT t.id
FROM timesheets t
LEFT JOIN approvals a
    ON a.reference_type = 'TIMESHEET'
   AND a.reference_id = t.id
   AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

-- ============================================================
-- COMMIT OR ROLLBACK
-- ============================================================
COMMIT;
-- ROLLBACK;  -- Use if verification fails

