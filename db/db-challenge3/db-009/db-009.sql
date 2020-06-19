SELECT chatroom_name, count(*) AS '投稿数'
FROM chats
JOIN chatrooms ON chats.chatroom_id = chatrooms.chatroom_id
JOIN users ON chats.created_by_user_id = users.user_id
WHERE chats.is_deleted = 0
AND users.is_deleted = 0
GROUP BY chatroom_name
ORDER BY count(*) DESC
;
