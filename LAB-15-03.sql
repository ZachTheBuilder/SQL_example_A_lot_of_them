USE my_guitar_shop;

DROP FUNCTION IF EXISTS item_total;

DELIMITER //

CREATE FUNCTION item_total
(
	item_id_pram	INT
)
RETURNS INT
BEGIN
	DECLARE the_var 	INT;
	
	SELECT SUM(discount_price * quantity) AS quantity_total
	INTO the_var
	FROM order_items
	WHERE item_id = item_id_pram;

	RETURN(the_var);
END//

DELIMITER ;