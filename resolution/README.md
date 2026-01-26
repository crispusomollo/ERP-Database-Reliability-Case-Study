# Transactional Recovery Scripts

This directory contains approved SQL scripts used to correct
confirmed ERP data integrity violations.

These scripts:
- Modify data only after validation
- Run inside explicit transactions
- Preserve audit history
- Require post-recovery verification

They must NEVER be automated.

