/* ============================================================
   MySQL 8.x Prevention Guardrails
   ============================================================ */

-- ------------------------------------------------------------
-- Rule 1: One active asset assignment per asset
-- Strategy:
-- Use a generated column to model "active assignment"
-- ------------------------------------------------------------

ALTER TABLE asset_assignments
ADD COLUMN active_asset_id BIGINT
GENERATED ALWAYS AS (
    CASE
        WHEN return_date IS NULL THEN asset_id
        ELSE NULL
    END
) STORED;

CREATE UNIQUE INDEX ux_asset_one_active_assignment
ON asset_assignments(active_asset_id);

-- ------------------------------------------------------------
-- Rule 2: Approved timesheets must have approval history
-- Strategy:
-- Enforced through FK + application transaction discipline
-- ------------------------------------------------------------

ALTER TABLE approvals
ADD CONSTRAINT fk_timesheet_approval
FOREIGN KEY (reference_id)
REFERENCES timesheets(id);

