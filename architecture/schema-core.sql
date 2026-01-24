/* ============================================================
   CORE SCHEMA DEFINITIONS
   Purpose: Establish ERP master and transactional entities
   ============================================================ */

-- =========================
-- Assets (Static Master Data)
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
);

-- =========================
-- Employees (Static Master)
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
-- Projects (Static Master)
-- =========================
CREATE TABLE projects (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    project_code VARCHAR(50) NOT NULL UNIQUE,
    project_name VARCHAR(255) NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

