CREATE DATABASE blog;

USE blog;

-- User Table
CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(250) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

);

-- Posts Table

CREATE TABLE posts(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Comments Table
CREATE TABLE comments(
    id INT PRIMARY KEY AUTO_INCREMENT,
    comment TEXT NOT NULL,
    user_id INT NOT NULL,
    post_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert Data ito users
INSERT INTO users(email,password) VALUES ('talha@gmail.com','talha');

-- Insert Data ito posts
INSERT INTO posts(title,content,user_id) VALUES ('My First Post','My First Post Content',1);

-- Insert  data into comments
INSERT INTO comments(comment, user_id, post_id) VALUES ('This is my comment on the first post.', 1, 1);


SELECT user.id AS UserID, user.email AS UserEmail,
       post.id AS PostID, post.title As PostTitle,
       comment.id AS COmment.id comment.comment as COMMENT

FROM users AS user
JOIN posts AS post ON user.id = post.user_id
JOIN comments AS comment ON post.id = comment.post_id
WHERE comment.user_id= user.id;