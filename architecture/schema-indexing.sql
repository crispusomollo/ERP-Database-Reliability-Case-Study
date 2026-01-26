/* ============================================================
   ERP INDEXING STRATEGY
   Purpose:
   Support common access patterns and lifecycle queries
   ============================================================ */

-- ========================
-- Asset lookup
-- ========================
CREATE INDEX idx_assets_status
ON assets(status);

-- ========================
-- Active asset assignments
-- (Used heavily by ERP UI and reports)
-- ========================
CREATE INDEX idx_asset_assignments_active
ON asset_assignments(asset_id, return_date);

-- ========================
-- Timesheet reporting
-- ========================
CREATE INDEX idx_timesheets_employee_date
ON timesheets(employee_id, work_date);

CREATE INDEX idx_timesheets_status
ON timesheets(status);

-- ========================
-- Approval lookups
-- ========================
CREATE INDEX idx_approvals_reference
ON approvals(reference_type, reference_id);

CREATE INDEX idx_approvals_status
ON approvals(approval_status);

