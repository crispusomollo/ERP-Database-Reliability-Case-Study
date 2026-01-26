# Lessons Learned

## What Worked Well

- Automated detection prevented silent failure
- Clear ownership enabled fast response
- Transactional recovery avoided data loss

## What Needed Improvement

- Preventive enforcement at the database layer
- Earlier detection outside reconciliation windows
- Formalized incident documentation

## Changes Initiated

- Database-level integrity constraints introduced
- Scheduled and pre-deploy integrity checks added
- Runbook and tabletop exercises created

## Key Lesson

> Systems should be designed to fail early and visibly,
> not quietly and later.

