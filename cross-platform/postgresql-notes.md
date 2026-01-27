# PostgreSQL Design Notes

## Strengths
- Partial indexes express lifecycle rules clearly
- DEFERRABLE constraints support multi-step workflows
- MVCC allows non-blocking detection queries

## Trade-Offs
- Requires discipline around constraint deferral
- Slightly more complex migration planning

PostgreSQL is ideal for declarative integrity enforcement.

