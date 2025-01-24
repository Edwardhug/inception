-- Set root user password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpwd';

-- Create database
CREATE DATABASE IF NOT EXISTS wordpress;

-- Create a new user and grant privileges
CREATE USER IF NOT EXISTS 'lgabet'@'%' IDENTIFIED BY 'pwd';
GRANT ALL PRIVILEGES ON wordpress.* TO 'lgabet'@'%';

-- Apply changes
FLUSH PRIVILEGES;
