-- Timesheets
CREATE TABLE timesheets (
    id BIGSERIAL PRIMARY KEY,
    employee_id BIGINT NOT NULL,
    project_id BIGINT NOT NULL,
    work_date DATE NOT NULL,
    hours NUMERIC(5,2) NOT NULL CHECK (hours >= 0),
    status VARCHAR(30) NOT NULL DEFAULT 'SUBMITTED',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Approvals
CREATE TABLE approvals (
    id BIGSERIAL PRIMARY KEY,
    reference_type VARCHAR(50) NOT NULL,
    reference_id BIGINT NOT NULL,
    approved_by BIGINT NOT NULL,
    approval_status VARCHAR(30) NOT NULL,
    approved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments VARCHAR(255)
);

-- Foreign Keys
ALTER TABLE asset_assignments
ADD CONSTRAINT fk_asset_assignment_asset
FOREIGN KEY (asset_id) REFERENCES assets(id);

ALTER TABLE asset_assignments
ADD CONSTRAINT fk_asset_assignment_employee
FOREIGN KEY (assigned_to) REFERENCES employees(id);

ALTER TABLE timesheets
ADD CONSTRAINT fk_timesheet_employee
FOREIGN KEY (employee_id) REFERENCES employees(id);

ALTER TABLE timesheets
ADD CONSTRAINT fk_timesheet_project
FOREIGN KEY (project_id) REFERENCES projects(id);

ALTER TABLE approvals
ADD CONSTRAINT fk_approval_timesheet
FOREIGN KEY (reference_id) REFERENCES timesheets(id);

