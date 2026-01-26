/* ============================================================
   PostgreSQL Asset Assignment Recovery
   ============================================================ */

-- SAFETY CHECK
SELECT asset_id, COUNT(*)
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

BEGIN;

-- Lock only affected rows to prevent race conditions
WITH duplicates AS (
    SELECT asset_id, MIN(id) AS keep_id
    FROM asset_assignments
    WHERE return_date IS NULL
    GROUP BY asset_id
    HAVING COUNT(*) > 1
)
UPDATE asset_assignments aa
SET return_date = NOW()
FROM duplicates d
WHERE aa.asset_id = d.asset_id
  AND aa.id <> d.keep_id
  AND aa.return_date IS NULL;

-- POST-VALIDATION
SELECT asset_id
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

COMMIT;
-- ROLLBACK;

