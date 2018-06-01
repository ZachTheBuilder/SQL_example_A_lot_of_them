USE my_guitar_shop;

DROP PROCEDURE IF EXISTS insert_products;

DELIMITER //

CREATE PROCEDURE insert_products
(
	category_id_pram		INT, 
	product_code_pram		INT, 
	product_name_pram		VARCHAR(50), 
	list_price_pram			INT,
	discount_percent_pram	INT
)
BEGIN
	DECLARE discount_percent_var 	DATE;
	DECLARE list_price_var 			INT;
	DECLARE category_id_var			INT DEFAULT 1;
	DECLARE product_code_var		INT; 
	DECLARE product_name_var		VARCHAR(50);
	DECLARE description_emypt_var	VARCHAR(100);

	-- Validate parameters
	IF list_price_pram < 0 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 'The category_id column must have a positive number.',
		MYSQL_ERRNO = 1264;
	ELSEIF list_price_pram >= 1000000 THEN
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
	IF list_price_pram IS NULL THEN
		SELECT default_list_price INTO list_price_var
		FROM products 
		WHERE list_price = list_price_var;
	ELSE
		SET list_price_var = list_price_pram;
	END IF;

	IF discount_percent_pram IS NULL THEN
		SELECT discount_percent_f INTO discount_percent_var
		FROM products
		WHERE discount_percent = discount_percent_var;
	ELSE 
		SET discount_percent_var = discount_percent_pram;
	END IF;

	IF product_name_pram IS NULL THEN
		SELECT default_product_name INTO product_name_var
		FROM products
		WHERE discount_percent = product_name_var;
	ELSE 
		SET product_name_var = product_name_pram;
	END IF;

	IF product_code_pram IS NULL THEN
		SELECT default_product_code INTO product_code_var
		FROM products
		WHERE product_code = product_code_var;
	ELSE 
		SET product_code_var = product_code_pram;
	END IF;

	IF category_id_pram IS NULL THEN
		SELECT category_id INTO category_id_var
		FROM products
		WHERE category_id = category_id_var;
	ELSE 
		SET category_id_var = category_id_pram;
	END IF;

	-- Insert
	INSERT INTO products
		(description, date_added)
	VALUES (description_emypt_var, current_date);

END//

DELIMITER ;

CALL insert_products(1, 300, 90, 50, 500);
CALL insert_products(78, 467, 43, 22, 20);