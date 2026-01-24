-- Timesheets
CREATE TABLE timesheets (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_id NUMBER NOT NULL,
    project_id NUMBER NOT NULL,
    work_date DATE NOT NULL,
    hours NUMBER(5,2) CHECK (hours >= 0),
    status VARCHAR2(30) DEFAULT 'SUBMITTED' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Approvals
CREATE TABLE approvals (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    reference_type VARCHAR2(50) NOT NULL,
    reference_id NUMBER NOT NULL,
    approved_by NUMBER NOT NULL,
    approval_status VARCHAR2(30) NOT NULL,
    approved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    comments VARCHAR2(255)
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

