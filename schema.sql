
CREATE TABLE users (
id SERIAL PRIMARY KEY,
first_name VARCHAR(50), 
last_name VARCHAR(50), 
email VARCHAR(30), 
password TEXT
);

CREATE TABLE posts (
id SERIAL,
user_id INT,
title VARCHAR(100),
image_url TEXT,
message TEXT, 
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(id),
CONSTRAINT fk_users
FOREIGN KEY(user_id)
REFERENCES users(id)
ON DELETE SET NULL
);