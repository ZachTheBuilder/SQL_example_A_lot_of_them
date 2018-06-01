-- create a table
DROP TABLE IF EXISTS products_audit;

CREATE TABLE products_audit
(	
	audit_id		INT				NOT NULL UNIQUE PRIMARY KEY,
	product_id		INT				NOT NULL UNIQUE,
	category_id		INT				NOT NULL UNIQUE,
	product_code	VARCHAR(10)		NOT NULL,
	product_name	VARCHAR(255)	NOT NULL,
	list_price		DECIMAL(10,2)	NOT NULL,
	discount_percet	DECIMAL(10,2)	NOT NULL,
	date_updated	DATETIME		NOT NULL
);

DELIMITER //

-- create a trigger
CREATE TRIGGER products_after_update
	AFTER UPDATE ON products
	FOR EACH ROW
BEGIN	
	DECLARE alls VARCHAR(255);

	SELECT *
	INTO alls
	FROM products
	WHERE product_id != New.product_id;


	UPDATE products_audit
	SET products_audit = alls;

END//