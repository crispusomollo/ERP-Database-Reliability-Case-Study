-- =========================
-- Assets
-- =========================
CREATE TABLE assets (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    asset_tag VARCHAR2(50) UNIQUE NOT NULL,
    asset_name VARCHAR2(255) NOT NULL,
    category VARCHAR2(100) NOT NULL,
    acquisition_date DATE NOT NULL,
    acquisition_cost NUMBER(12,2) NOT NULL,
    status VARCHAR2(30) DEFAULT 'ACTIVE' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ==================================
-- Asset Assignment History
-- ==================================
CREATE TABLE asset_assignments (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    asset_id NUMBER NOT NULL,
    assigned_to NUMBER NOT NULL,
    assigned_at TIMESTAMP NOT NULL,
    return_date TIMESTAMP NULL,
    notes VARCHAR2(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- Employees
-- =========================
CREATE TABLE employees (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    employee_number VARCHAR2(50) UNIQUE NOT NULL,
    full_name VARCHAR2(255) NOT NULL,
    department VARCHAR2(100),
    status VARCHAR2(30) DEFAULT 'ACTIVE' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- Projects
-- =========================
CREATE TABLE projects (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    project_code VARCHAR2(50) UNIQUE NOT NULL,
    project_name VARCHAR2(255) NOT NULL,
    status VARCHAR2(30) DEFAULT 'ACTIVE' NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

