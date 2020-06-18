CREATE TABLE users(
    user_id INT(11) NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    introduce VARCHAR(1000),
    tel_mobile VARCHAR(13),
    tel_work VARCHAR(13),
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE chat_members(
    chatroom_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    joined_at DATETIME NOT NULL,
    PRIMARY KEY(chatroom_id, user_id),
    FOREIGN KEY (chatroom_id) REFERENCES chatrooms(chatroom_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE chatrooms(
    chatroom_id INT(11) NOT NULL AUTO_INCREMENT,
    chatroom_name VARCHAR(100) NOT NULL,
    about VARCHAR(1000),
    is_sendable TINYINT(1) NOT NULL DEFAULT 1,
    is_direct_chat TINYINT(1) NOT NULL DEFAULT 0,
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME,
    created_by_user_id INT(11) NOT NULL,
    updated_at DATETIME,
    updated_by_user_id INT(11) NOT NULL,
    PRIMARY KEY (chatroom_id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(user_id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(user_id)
);

CREATE TABLE chats(
    chat_id INT(11) NOT NULL AUTO_INCREMENT,
    chatroom_id INT(11) NOT NULL,
    message VARCHAR(1000) NOT NULL,
    file_name VARCHAR(100),
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    created_by_user_id INT(11) NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by_user_id INT(11) NOT NULL,
    PRIMARY KEY (chat_id),
    FOREIGN KEY (chatroom_id) REFERENCES chatrooms(chatroom_id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(user_id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users(user_id)
);

CREATE TABLE tasks(
    task_id INT(11) NOT NULL AUTO_INCREMENT,
    chatroom_id INT(11) NOT NULL,
    assign_user_id INT(11) NOT NULL,
    task_content VARCHAR(1000) NOT NULL,
    deadline DATETIME NOT NULL,
    is_completed TINYINT(1) NOT NULL DEFAULT 0,
    is_deleted TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    created_by_user_id INT(11) NOT NULL,
    updated_at DATETIME NOT NULL,
    updated_by_user_id INT(11) NOT NULL,
    PRIMARY KEY (task_id),
    FOREIGN KEY (chatroom_id) REFERENCES chatrooms (chatroom_id),
    FOREIGN KEY (created_by_user_id) REFERENCES users (user_id),
    FOREIGN KEY (updated_by_user_id) REFERENCES users (user_id)
);
