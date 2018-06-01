DELIMITER //

CREATE TRIGGER products_before_insert
	BEFORE UPDATE ON products
	FOR EACH ROW
BEGIN	
	IF date_added = NULL THEN
		INSERT INTO date_added
		VALUES (current_date);
	END IF;
END//


