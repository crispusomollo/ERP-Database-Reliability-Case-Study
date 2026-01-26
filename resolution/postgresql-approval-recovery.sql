BEGIN;

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
    NOW(),
    'Approval restored during integrity recovery'
FROM timesheets t
LEFT JOIN approvals a
  ON a.reference_type = 'TIMESHEET'
 AND a.reference_id = t.id
 AND a.approval_status = 'APPROVED'
WHERE t.status = 'APPROVED'
  AND a.id IS NULL;

COMMIT;
-- ROLLBACK;

