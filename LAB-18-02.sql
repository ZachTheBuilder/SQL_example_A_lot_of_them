-- This code ran fine
SELECT product_id
FROM products;

-- This code would not let me delete anything.
DELETE FROM products
WHERE products_id = 3;