SHOW EVENTS;

SET GLOBAL event_scheduler = ON;

DELIMITER //

CREATE EVENT one_week_products_audit
ON SCHEDULE AT NOW() + INTERVAL 1 WEEK
DO BEGIN
	DELETE FROM  products_audit 
	WHERE date_updated < NOW() - INTERVAL 1 WEEK; 
END //
