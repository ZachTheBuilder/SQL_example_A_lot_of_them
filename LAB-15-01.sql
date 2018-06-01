USE my_guitar_shop;

DROP PROCEDURE IF EXISTS insert_category;

DELIMITER //

CREATE PROCEDURE insert_category
(
IN	category_id_pram 	INT,
IN	category_name_pram 	VARCHAR(50)
)
BEGIN
	DECLARE category_id_var		INT;
	DECLARE category_name_var	VARCHAR(50);


	-- Validate parameters
	IF category_id_pram < 0 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 'The category_id column must have a positive number.',
		MYSQL_ERRNO = 1264;
	ELSEIF category_id_pram >= 1000000 THEN
		SIGNAL SQLSTATE '22003'
			SET MESSAGE_TEXT = 'The category_id colum must be less than 1,000,000.',
		MYSQL_ERRNO = 1264;
	END IF;
	
	-- Values for parameters
	IF category_id_pram IS NULL THEN
		SELECT default_category_id INTO category_id_var
		FROM categories 
		WHERE category_id = category_id_var;
	ELSE
		SET category_id_var = category_id_pram;
	END IF;
	IF category_name_pram IS NULL THEN
		SELECT category_name_f INTO category_name_var
		FROM categories
		WHERE category_name = category_name_var;
	ELSE 
		SET category_name_var = category_name_pram;
	END IF;

	-- Isert
	INSERT INTO categories
		(category_name, category_id)
	VALUES (category_name_pram, category_id_var);

END//

DELIMITER ;

CALL insert_category(45, 100);
CALL insert_category(60, 350);
