/* ============================================================
   Asset Assignment Recovery
   Purpose:
   Resolve multiple active assignments per asset
   ============================================================ */

-- SAFETY CHECK (MUST RETURN ROWS BEFORE PROCEEDING)
SELECT asset_id, COUNT(*) AS active_count
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- ============================================================
-- BEGIN TRANSACTION
-- ============================================================
START TRANSACTION;

-- Strategy:
-- Keep the earliest active assignment
-- Close all others by setting return_date

UPDATE asset_assignments aa
JOIN (
    SELECT asset_id, MIN(id) AS keep_id
    FROM asset_assignments
    WHERE return_date IS NULL
    GROUP BY asset_id
    HAVING COUNT(*) > 1
) v
  ON aa.asset_id = v.asset_id
SET aa.return_date = CURRENT_TIMESTAMP
WHERE aa.id <> v.keep_id
  AND aa.return_date IS NULL;

-- ============================================================
-- POST-UPDATE VERIFICATION (MUST RETURN ZERO ROWS)
-- ============================================================
SELECT asset_id
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

-- ============================================================
-- COMMIT OR ROLLBACK
-- ============================================================
COMMIT;
-- ROLLBACK;  -- Use if verification fails

