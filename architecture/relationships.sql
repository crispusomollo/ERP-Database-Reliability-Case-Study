/* ============================================================
   RELATIONSHIPS & REFERENTIAL INTEGRITY
   Purpose: Enforce ERP workflow correctness
   ============================================================ */

-- =========================
-- Timesheets (Transactional)
-- =========================
CREATE TABLE timesheets (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    employee_id BIGINT NOT NULL,
    project_id BIGINT NOT NULL,
    work_date DATE NOT NULL,
    hours DECIMAL(5,2) NOT NULL CHECK (hours >= 0),
    status VARCHAR(30) NOT NULL DEFAULT 'SUBMITTED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- Approvals (Workflow Audit)
-- =========================
CREATE TABLE approvals (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    reference_type VARCHAR(50) NOT NULL,
    reference_id BIGINT NOT NULL,
    approved_by BIGINT NOT NULL,
    approval_status VARCHAR(30) NOT NULL,
    approved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments VARCHAR(255)
);

-- =========================
-- Foreign Key Constraints
-- =========================

-- Asset → Assignment
ALTER TABLE asset_assignments
ADD CONSTRAINT fk_asset_assignment_asset
FOREIGN KEY (asset_id) REFERENCES assets(id);

-- Employee → Assignment
ALTER TABLE asset_assignments
ADD CONSTRAINT fk_asset_assignment_employee
FOREIGN KEY (assigned_to) REFERENCES employees(id);

-- Employee → Timesheet
ALTER TABLE timesheets
ADD CONSTRAINT fk_timesheet_employee
FOREIGN KEY (employee_id) REFERENCES employees(id);

-- Project → Timesheet
ALTER TABLE timesheets
ADD CONSTRAINT fk_timesheet_project
FOREIGN KEY (project_id) REFERENCES projects(id);

-- Timesheet → Approval
ALTER TABLE approvals
ADD CONSTRAINT fk_approval_timesheet
FOREIGN KEY (reference_id) REFERENCES timesheets(id);

