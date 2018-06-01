CREATE USER 'darth'@'localhost' IDENTIFIED BY 'badguy';

GRANT SELECT, INSERT
ON my_guitar_shop.*
TO'yoda'@'localhost';

SHOW GRANTS FOR 'darth'@'localhost';
