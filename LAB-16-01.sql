DELIMITER //

CREATE TRIGGER products_before_update
	BEFORE UPDATE ON products
	FOR EACH ROW
BEGIN
	DECLARE precent_item DECIMAL(9,2);

	SELECT discount_percent
	INTO precent_item
	FROM products;

	IF precent_item < 0 THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = 'Discout percent should be over 0';
	ELSEIF precent_item > 100 THEN
		SIGNAL SQLSTATE 'HY000'
			SET MESSAGE_TEXT = 'Discount percent should be under 100';
	END IF;

	IF NEW.discount_percent > 0 THEN
		IF NEW.discount_percent < 1 THEN
			SET NEW.discount_percent = NEW.discount_percent * 100;
		END IF;
	END IF;

	UPDATE products
	SET precent_item = 1;

END//

