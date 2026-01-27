/* ============================================================
   Oracle Integrity Enforcement
   ============================================================ */

-- One active asset assignment per asset
CREATE UNIQUE INDEX ux_asset_one_active_assignment
ON asset_assignments (
  CASE
    WHEN return_date IS NULL THEN asset_id
  END
);

-- Approved timesheets must have approval history
ALTER TABLE approvals
ADD CONSTRAINT fk_timesheet_approval
FOREIGN KEY (reference_id)
REFERENCES timesheets(id)
DEFERRABLE INITIALLY DEFERRED;

