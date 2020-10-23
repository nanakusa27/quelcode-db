BEGIN;
UPDATE chatrooms
SET is_sendable = 0, updated_by_user_id = 1, updated_at = NOW()
WHERE is_deleted = 0
AND is_sendable = 1
AND chatroom_id NOT IN (
    SELECT chatroom_id
    FROM chat_members
    WHERE user_id = 1
);
COMMIT;
