# ERP Database Reliability Case Study

This repository documents a real-world ERP database integrity incident and demonstrates
how it was detected, resolved, prevented, and automated using production-grade DBA practices.

The focus is **database reliability engineering**, not application feature development.

---

## 🧰 Technologies Used

### Databases
- **MySQL** – Primary transactional database
- **PostgreSQL** – Integrity and automation variants
- **Oracle Database** – Enterprise-grade constraint patterns

### Database Concepts & Practices
- Relational data modeling & normalization
- Transaction management (ACID)
- Database constraints & indexes
- Partial and function-based indexes
- Referential integrity enforcement
- Auditability & historical data tracking

### SQL & Automation
- ANSI SQL
- Engine-specific SQL (MySQL / PostgreSQL / Oracle)
- Integrity validation queries
- Pre-deployment safety checks
- Nightly automated health checks

### Systems & Reliability
- Incident response & postmortems
- Failure-mode analysis
- Operational runbooks
- Preventive guardrails
- Metrics-driven reliability improvements

### Security & Compliance
- Role-Based Access Control (RBAC)
- Least privilege enforcement
- Audit trail design
- Public-sector / financial compliance alignment

---

## 🎯 What This Project Shows

- Defensive database design
- Transactional integrity and recovery
- Incident detection and response
- Automation and guardrails
- Failure-mode analysis
- Compliance and audit readiness
- Cross-platform thinking (MySQL, Oracle, PostgreSQL)

---

## 📁 Repository Structure

Each directory maps to a real operational responsibility:

- `architecture/`     – schema design and architectural decisions  
- `incident/`         – incident narrative and root cause analysis  
- `detection/`        – integrity validation queries  
- `resolution/`       – transactional recovery scripts  
- `prevention/`       – constraints and enforcement patterns  
- `automation/`       – scheduled and pre-deploy checks  
- `failure-modes/`    – documented what-if scenarios  
- `metrics/`          – before/after impact analysis  
- `compliance/`       – audit and control mapping  
- `cross-platform/`   – Oracle & PostgreSQL variants  
- `runbook/`          – production incident response steps  

---

---

## 🏗️ Where This Would Run in Production

### Scheduled Jobs (Cron)
- Nightly integrity checks
- Read-only execution
- Alerts on non-zero results

### CI / CD Pipelines (Jenkins / GitHub Actions)
- Pre-deploy database integrity gates
- Deployment blocked on violations

### Monitoring & Alerting
- Integrity violations trigger alerts
- Clear ownership and runbooks

### Access & Security
- Least-privileged database users
- Controlled write access for recovery

---

## 🧠 Core Engineering Principle

Design databases assuming applications will fail — and make recovery predictable.

---

## 📄 Disclaimer

All schemas, data, and scenarios are anonymized and simplified.

