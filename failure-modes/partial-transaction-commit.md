# Failure Mode: Partial Transaction Commit

## Scenario
A multi-step workflow partially commits
due to application interruption or timeout.

## Risk
- Inconsistent business state
- Downstream reporting errors

## Detection
- Integrity checks across related tables

## Prevention
- Transaction boundaries enforced
- Deferred constraints where supported

## Recovery
- Transactional recovery scripts

## Residual Risk
Medium

## Owner
Application & DBA Joint

## Review Cadence
Annual

