SELECT user_name, chats.created_at, chatroom_name
FROM chats
JOIN users ON chats.created_by_user_id = users.user_id
JOIN chatrooms ON chats.chatroom_id = chatrooms.chatroom_id
WHERE chats.created_at IN (
    SELECT MAX(chats.created_at)
    FROM chats
    JOIN users ON chats.created_by_user_id = users.user_id
    WHERE chats.is_deleted = 0
    AND users.is_deleted = 0
    GROUP BY chats.chatroom_id
)
ORDER BY chats.chatroom_id ASC
;
