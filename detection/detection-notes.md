# Detection Philosophy

Detection queries are designed to answer one question:

> Is the system currently in an invalid business state?

Principles:
- Detection must be deterministic
- Detection must be safe in production
- Detection must be easy to reason about
- Detection must precede recovery

Detection queries are reused across:
- Manual investigation
- Automation
- Pre-deploy validation
- Audit evidence

