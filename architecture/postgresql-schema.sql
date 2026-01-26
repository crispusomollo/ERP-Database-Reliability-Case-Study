/* ============================================================
   PostgreSQL ERP Core Schema
   ============================================================ */

-- ========================
-- Employees
-- ========================
CREATE TABLE employees (
    id              BIGSERIAL PRIMARY KEY,
    employee_number VARCHAR(50) UNIQUE NOT NULL,
    full_name       VARCHAR(255) NOT NULL,
    department      VARCHAR(100),
    status          VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_employee_status
        CHECK (status IN ('ACTIVE', 'INACTIVE'))
);

-- ========================
-- Assets
-- ========================
CREATE TABLE assets (
    id              BIGSERIAL PRIMARY KEY,
    asset_tag       VARCHAR(100) UNIQUE NOT NULL,
    asset_name      VARCHAR(255) NOT NULL,
    asset_type      VARCHAR(100),
    purchase_date   DATE,
    cost            NUMERIC(12,2),
    status          VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CONSTRAINT chk_asset_status
        CHECK (status IN ('ACTIVE', 'RETIRED'))
);

-- ========================
-- Asset Assignments
-- ========================
CREATE TABLE asset_assignments (
    id              BIGSERIAL PRIMARY KEY,
    asset_id        BIGINT NOT NULL,
    employee_id     BIGINT NOT NULL,
    assigned_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    return_date     TIMESTAMPTZ,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_assignment_asset
        FOREIGN KEY (asset_id)
        REFERENCES assets(id),

    CONSTRAINT fk_assignment_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(id)
);

-- ========================
-- Timesheets
-- ========================
CREATE TABLE timesheets (
    id              BIGSERIAL PRIMARY KEY,
    employee_id     BIGINT NOT NULL,
    work_date       DATE NOT NULL,
    hours           NUMERIC(5,2) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'DRAFT',
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CONSTRAINT fk_timesheet_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(id),

    CONSTRAINT chk_timesheet_hours
        CHECK (hours >= 0 AND hours <= 24),

    CONSTRAINT uq_timesheet_per_day
        UNIQUE (employee_id, work_date)
);

-- ========================
-- Approvals
-- ========================
CREATE TABLE approvals (
    id              BIGSERIAL PRIMARY KEY,
    reference_type  VARCHAR(50) NOT NULL,
    reference_id    BIGINT NOT NULL,
    approved_by     BIGINT NOT NULL,
    approval_status VARCHAR(20) NOT NULL,
    approved_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    comments        VARCHAR(500),

    CONSTRAINT fk_approval_approver
        FOREIGN KEY (approved_by)
        REFERENCES employees(id),

    CONSTRAINT chk_approval_status
        CHECK (approval_status IN ('APPROVED', 'REJECTED'))
);

-- ========================
-- Indexing Strategy
-- ========================
CREATE INDEX idx_assets_status
    ON assets(status);

CREATE INDEX idx_asset_assignments_active
    ON asset_assignments(asset_id, return_date);

CREATE INDEX idx_timesheets_employee_date
    ON timesheets(employee_id, work_date);

CREATE INDEX idx_timesheets_status
    ON timesheets(status);

CREATE INDEX idx_approvals_reference
    ON approvals(reference_type, reference_id);

CREATE INDEX idx_approvals_status
    ON approvals(approval_status);

