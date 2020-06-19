BEGIN;
UPDATE users
SET is_deleted = 1, updated_at = NOW()
WHERE tel_mobile IS NULL
AND tel_work IS NULL;
COMMIT;
