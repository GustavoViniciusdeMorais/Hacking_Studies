CREATE TABLE accounts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL
);
INSERT INTO accounts (username,password) VALUES ('test','test');
INSERT INTO accounts (username,password) VALUES ('test2','test2');
INSERT INTO accounts (username,password) VALUES ('test3','test3');