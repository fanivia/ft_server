CREATE DATABASE wordpress;
CREATE USER 'fanivia'@'localhost' IDENTIFIED BY 'mypass';
GRANT ALL ON *.* TO 'fanivia'@'localhost' IDENTIFIED BY 'mypass' WITH GRANT OPTION;
FLUSH PRIVILEGES;
