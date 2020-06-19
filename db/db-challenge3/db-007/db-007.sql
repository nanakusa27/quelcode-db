SELECT chatroom_id, chatroom_name, about, is_sendable, is_deleted, created_at, created_by_user_id, updated_at, updated_by_user_id, CASE WHEN 1 = is_sendable THEN '許可' ELSE '禁止' END
FROM chatrooms
WHERE about like '%ダイレクトチャット'
AND is_deleted = 0
ORDER BY chatroom_id ASC
;
