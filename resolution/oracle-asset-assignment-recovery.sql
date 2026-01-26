/* ============================================================
   Oracle Asset Assignment Recovery
   ============================================================ */

-- SAFETY CHECK
SELECT asset_id, COUNT(*)
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

SAVEPOINT before_fix;

MERGE INTO asset_assignments aa
USING (
    SELECT asset_id, MIN(id) AS keep_id
    FROM asset_assignments
    WHERE return_date IS NULL
    GROUP BY asset_id
    HAVING COUNT(*) > 1
) d
ON (
    aa.asset_id = d.asset_id
    AND aa.id <> d.keep_id
    AND aa.return_date IS NULL
)
WHEN MATCHED THEN
UPDATE SET aa.return_date = SYSTIMESTAMP;

-- POST-VALIDATION
SELECT asset_id
FROM asset_assignments
WHERE return_date IS NULL
GROUP BY asset_id
HAVING COUNT(*) > 1;

COMMIT;
-- ROLLBACK TO before_fix;

