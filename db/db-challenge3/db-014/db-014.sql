BEGIN;
DELETE FROM chat_members
WHERE user_id IN (
    SELECT user_id
    FROM users
    WHERE is_deleted = 1
)
COMMIT;
