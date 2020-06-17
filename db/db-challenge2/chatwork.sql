CREATE TABLE users(
    user_id INT(11) NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    introduce VARCHAR(1000),
    tel_mobile VARCHAR(13),
    tel_work VARCHAR(13),
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    primary key(user_id)
);

CREATE TABLE chat_members(
    chatroom_id INT(11) NOT NULL REFERENCES chatrooms(chatroom_id),
    user_id INT(11) NOT NULL REFERENCES users(users),
    joined_at DATETIME NOT NULL,
    primary key(chatroom_id, user_id)
);

CREATE TABLE chatrooms(
    chatroom_id INT(11) NOT NULL AUTO_INCREMENT,
    chatroom_name VARCHAR(100) NOT NULL,
    about VARCHAR(1000),
    is_send_permission TINYINT(1) NOT NULL DEFAULT 1,
    is_direct_chat TINYINT(1) NOT NULL DEFAULT 0,
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME,
    created_by_user_id INT(11) NOT NULL,
    updated_at DATETIME,
    updated_by_user_id INT(11) NOT NULL,
    primary key(chatroom_id)
);

CREATE TABLE chats(
    chat_id INT(11) NOT NULL AUTO_INCREMENT,
    chatroom_id INT(11) NOT NULL REFERENCES chatrooms(chatroom_id),
    message VARCHAR(1000) NOT NULL,
    file_name VARCHAR(100),
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    created_by_user_id INT(11) NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by_user_id INT(11) NOT NULL,
    primary key(chat_id)
);

CREATE TABLE tasks(
    task_id INT(11) NOT NULL AUTO_INCREMENT,
    chatroom_id INT(11) NOT NULL REFERENCES chatrooms(chatroom_id),
    assign_user_id INT(11) NOT NULL,
    task_content VARCHAR(1000) NOT NULL,
    deadline DATETIME NOT NULL,
    is_completed TINYINT(1) NOT NULL DEFAULT 0,
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    created_by_user_id INT(11) NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by_user_id INT(11) NOT NULL,
    primary key(task_id)
);
