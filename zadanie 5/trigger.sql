-- -- -------------------------------------------------------------------------------
-- -- Zadanie 5
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -------------------------------------------------------------------------------
-- Section: USE
-- -- -------------------------------------------------------------------------------
USE jsk_db_list;

-- -- -------------------------------------------------------------------------------
-- Section: rozwiazanie zadania
-- -- -------------------------------------------------------------------------------

DROP TRIGGER IF EXISTS `jsk_db_list`.`rental_BEFORE_INSERT_1`;

DELIMITER $$
USE `jsk_db_list`$$
CREATE DEFINER=`root`@`localhost` TRIGGER `rental_BEFORE_INSERT_1` BEFORE INSERT ON `rental` FOR EACH ROW BEGIN
     IF NEW.cost < 100 THEN SET NEW.cost = 100;
     END IF;
     
END$$
DELIMITER ;

-- OR 
DELIMITER $$
USE `jsk_db_list`$$
CREATE DEFINER = CURRENT_USER TRIGGER `jsk_db_list`.`rental_BEFORE_UPDATE` BEFORE UPDATE ON `rental` FOR EACH ROW
BEGIN
   IF NEW.cost < 100 THEN SET NEW.cost = 100;
     END IF;
     
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS `jsk_db_list`.`rental_BEFORE_UPDATE`;

INSERT INTO rental (start_rental_establishment_id, regiving_establishment_id, car_id, client_id, start_rental_date, regiving_date, cost) VALUES
('1','5','5','5','2018-11-02','2018-11-24','10');

UPDATE rent 
SET cost= 10
WHERE id=1;

SELECT *
FROM  rental;

