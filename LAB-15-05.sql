USE my_guitar_shop;

DROP PROCEDURE IF EXISTS update_product_discount;

DELIMITER //

CREATE PROCEDURE update_product_discount
(
	product_id_pram			INT, 
	discount_percent_pram	INT
)
BEGIN
	DECLARE product_id_var			 INT;
	DECLARE discount_percent_var	 INT;

	-- Validate parameters
	IF product_id_pram < 0 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 'The category_id column must have a positive number.',
		MYSQL_ERRNO = 1264;
	ELSEIF product_id_pram >= 1000000 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 'The category_id colum must be less than 1,000,000.',
		MYSQL_ERRNO = 1264;
	END IF;

	IF discount_percent_pram < 0 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 'The category_id column must have a positive number.',
		MYSQL_ERRNO = 1264;
	ELSEIF discount_percent_pram >= 1000000 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 'The category_id colum must be less than 1,000,000.',
		MYSQL_ERRNO = 1264;
	END IF;
	
	-- Values for parameters
	IF product_id_pram IS NULL THEN
		SELECT default_list_price INTO product_id_var
		FROM products 
		WHERE product_id = product_id_var;
	ELSE
		SET product_id_var = product_id_pram;
	END IF;

	IF discount_percent_pram IS NULL THEN
		SELECT discount_percent_f INTO discount_percent_var
		FROM products
		WHERE discount_percent = discount_percent_var;
	ELSE 
		SET discount_percent_var = discount_percent_pram;
	END IF;

	-- Update
	UPDATE products
	SET discount_percent = discount_percent_pram
	WHERE product_id = product_id_pram;

END//

DELIMITER ;

CALL update_product_discount(41, 535);
CALL update_product_discount(78, 467);