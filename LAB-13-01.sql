USE my_guitar_shop;

DROP PROCEDURE IF EXISTS test;

DELIMITER //

CREATE PROCEDURE test()
BEGIN
	DECLARE count_of_products INT;
	
	SELECT COUNT(*)
	INTO count_of_products
	FROM products;

	IF count_of_products >= 7 THEN
			SELECT 'The number of products is greater than or equal to 7.';
	ELSE 
			SELECT 'The number of products is less than 7.';
	END IF;
END//

DELIMITER ;

CALL test;