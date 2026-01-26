/* ============================================================
   ERP BASELINE INTEGRITY RULES
   Purpose:
   Enforce fundamental correctness assumptions
   ============================================================ */

-- ========================
-- Timesheet validity
-- ========================
ALTER TABLE timesheets
ADD CONSTRAINT chk_timesheet_hours
CHECK (hours >= 0 AND hours <= 24);

ALTER TABLE timesheets
ADD CONSTRAINT uq_timesheet_per_day
UNIQUE (employee_id, work_date);

-- ========================
-- Approval status validity
-- ========================
ALTER TABLE approvals
ADD CONSTRAINT chk_approval_status
CHECK (approval_status IN ('APPROVED', 'REJECTED'));

-- ========================
-- Employee status validity
-- ========================
ALTER TABLE employees
ADD CONSTRAINT chk_employee_status
CHECK (status IN ('ACTIVE', 'INACTIVE'));

-- ========================
-- Asset status validity
-- ========================
ALTER TABLE assets
ADD CONSTRAINT chk_asset_status
CHECK (status IN ('ACTIVE', 'RETIRED'));

