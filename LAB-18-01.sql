CREATE USER 'yoda'@'localhost' IDENTIFIED BY 'chicken';

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.customers 
TO'yoda'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.addresses 
TO'yoda'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.orders 
TO'yoda'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE
ON my_guitar_shop.order_items 
TO'yoda'@'localhost';

GRANT SELECT
ON my_guitar_shop.products  
TO'yoda'@'localhost';

GRANT SELECT
ON my_guitar_shop.categories  
TO'yoda'@'localhost';

SHOW GRANTS FOR 'yoda'@'localhost';

REVOKE DELETE
ON my_guitar_shop.orders
FROM 'yoda'@'localhost';

REVOKE DELETE
ON my_guitar_shop.order_items
FROM 'yoda'@'localhost';