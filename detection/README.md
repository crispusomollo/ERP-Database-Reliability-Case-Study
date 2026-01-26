# Integrity Validation Queries

This directory contains read-only SQL queries used to detect
ERP data integrity violations.

These queries:
- NEVER modify data
- Are safe to run in production
- Return rows ONLY when a violation exists

Zero rows = healthy system.

