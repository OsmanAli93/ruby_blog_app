
CREATE TABLE users (
user_id INT GENERATED ALWAYS AS IDENTITY,
first_name VARCHAR(50), 
last_name VARCHAR(50), 
email VARCHAR(30), 
password TEXT,
PRIMARY KEY(user_id)
);

CREATE TABLE posts (
post_id INT GENERATED ALWAYS AS IDENTITY,
user_id INT,
title VARCHAR(100),
image_url TEXT,
message TEXT, 
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(post_id),
CONSTRAINT fk_users
FOREIGN KEY(user_id)
REFERENCES users(user_id)
ON DELETE SET NULL

);