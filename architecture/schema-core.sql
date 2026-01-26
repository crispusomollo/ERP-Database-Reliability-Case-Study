/* ============================================================
   CORE SCHEMA DEFINITIONS
   Purpose: Establish ERP master and transactional entities
            Define authoritative ERP data structures
   ============================================================ */

-- =========================
-- Employees
-- =========================
CREATE TABLE employees (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    employee_number VARCHAR(50) NOT NULL UNIQUE,
    full_name VARCHAR(255) NOT NULL,
    department VARCHAR(100),
    status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- Assets
-- =========================
CREATE TABLE assets (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    asset_tag VARCHAR(50) NOT NULL UNIQUE,
    asset_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    acquisition_date DATE NOT NULL,
    acquisition_cost DECIMAL(12,2) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==================================
-- Asset Assignment History (Lifecycle)
-- ==================================
CREATE TABLE asset_assignments (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    asset_id BIGINT NOT NULL,
    assigned_to BIGINT NOT NULL,
    assigned_at TIMESTAMP NOT NULL,
    return_date TIMESTAMP NULL,
    notes VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

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
    id              BIGINT PRIMARY KEY AUTO_INCREMENT,
    employee_id     BIGINT NOT NULL,
    work_date       DATE NOT NULL,
    hours           DECIMAL(5,2) NOT NULL,
    status          VARCHAR(20) NOT NULL DEFAULT 'DRAFT',
    created_at      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_timesheet_employee
        FOREIGN KEY (employee_id)
        REFERENCES employees(id)
);

-- ========================
-- Approvals (Generic Workflow)
-- ========================
CREATE TABLE approvals (
    id              BIGINT PRIMARY KEY AUTO_INCREMENT,
    reference_type  VARCHAR(50) NOT NULL,
    reference_id    BIGINT NOT NULL,
    approved_by     BIGINT NOT NULL,
    approval_status VARCHAR(20) NOT NULL,
    approved_at     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comments        VARCHAR(500),

    CONSTRAINT fk_approval_approver
        FOREIGN KEY (approved_by)
        REFERENCES employees(id)
);

-- =========================
-- Projects
-- =========================
CREATE TABLE projects (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    project_code VARCHAR(50) NOT NULL UNIQUE,
    project_name VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

