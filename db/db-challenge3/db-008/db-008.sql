SELECT user_name, chatroom_name, LEFT (joined_at, 10)
FROM chat_members
JOIN users ON chat_members.user_id = users.user_id
JOIN chatrooms ON chat_members.chatroom_id = chatrooms.chatroom_id
WHERE users.is_deleted = 0
AND chatrooms.is_deleted = 0
ORDER BY joined_at ASC
;
