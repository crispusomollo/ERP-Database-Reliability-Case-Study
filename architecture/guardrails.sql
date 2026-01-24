/* ============================================================
   ARCHITECTURAL GUARDRAILS
   Purpose: Enforce ERP correctness at the data layer
   ============================================================ */

-- ============================================================
-- Rule: One active assignment per asset
-- ============================================================
-- An asset may only have ONE assignment where return_date IS NULL

CREATE UNIQUE INDEX ux_asset_active_assignment
ON asset_assignments (asset_id)
WHERE return_date IS NULL;

-- ============================================================
-- Rule: Approved timesheets must have approval records
-- ============================================================
-- Enforced through foreign key + workflow validation
-- (Application sets status; DB guarantees relationship exists)

-- Optional supporting index for performance
CREATE INDEX idx_timesheet_status
ON timesheets(status);

-- ============================================================
-- Rule: Prevent negative or excessive hours
-- ============================================================
ALTER TABLE timesheets
ADD CONSTRAINT chk_timesheet_hours
CHECK (hours >= 0 AND hours <= 24);

