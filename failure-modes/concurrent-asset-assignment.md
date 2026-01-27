# Failure Mode: Concurrent Asset Assignment

## Scenario
Two users attempt to assign the same asset simultaneously
during a high-activity period.

## Risk
- Duplicate active custody records
- Loss of authoritative ownership state

## Detection
- Integrity validation queries
- Automated nightly checks

## Prevention
- Database-level conditional uniqueness enforcement

## Recovery
- Transactional recovery scripts close duplicate assignments

## Residual Risk
Low

## Owner
ERP / DBA Lead

## Review Cadence
Annual

