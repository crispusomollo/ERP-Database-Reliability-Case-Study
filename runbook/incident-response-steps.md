# Standard Incident Response Steps

Follow these steps in order.
Do not skip steps.

---

## Step 1: Acknowledge & Stabilize

- Acknowledge the alert
- Identify the Incident Commander
- Pause non-essential writes if integrity risk exists

Goal: Prevent further data drift.

---

## Step 2: Validate (Read-Only)

- Run detection queries
- Confirm scope and affected modules
- Do NOT modify data

Goal: Understand before acting.

---

## Step 3: Contain

- Restrict write access to affected modules
- Notify ERP Systems and Finance if applicable
- Pause downstream reporting if required

Goal: Stop propagation.

---

## Step 4: Communicate

- Use approved communication templates
- Share facts only
- Avoid speculation or technical detail

Goal: Maintain trust.

---

## Step 5: Recover (Controlled)

- Execute approved recovery scripts
- Use explicit transactions
- Preserve audit history

Goal: Restore correctness safely.

---

## Step 6: Validate Post-Recovery

- Re-run integrity checks
- Confirm zero violations
- Gradually re-enable operations

Goal: Confirm correctness.

---

## Step 7: Close & Review

- Update incident timeline
- Record root cause
- Trigger prevention and automation review

Goal: Institutional learning.

