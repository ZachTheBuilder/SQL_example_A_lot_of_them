USE my_guitar_shop;

DROP FUNCTION IF EXISTS discount_price;

DELIMITER //

CREATE FUNCTION discount_price
(
	item_id_pram	INT
)
RETURNS INT
BEGIN
	DECLARE discount_var 	INT;
	

	SELECT SUM(discount_amount - item_price) AS Discount
	INTO discount_var
	FROM order_items
	WHERE item_id = item_id_pram;

	RETURN(discount_var);
	
END//

DELIMITER ;

