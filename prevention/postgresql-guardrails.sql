/* ============================================================
   PostgreSQL Prevention Guardrails
   ============================================================ */

-- ------------------------------------------------------------
-- Rule 1: One active asset assignment per asset
-- Enforced via partial unique index
-- ------------------------------------------------------------
CREATE UNIQUE INDEX ux_asset_one_active_assignment
ON asset_assignments(asset_id)
WHERE return_date IS NULL;

-- ------------------------------------------------------------
-- Rule 2: Approved timesheets must have approval history
-- Enforced via deferred foreign key
-- ------------------------------------------------------------
ALTER TABLE approvals
ADD CONSTRAINT fk_timesheet_approval
FOREIGN KEY (reference_id)
REFERENCES timesheets(id)
DEFERRABLE INITIALLY DEFERRED;

