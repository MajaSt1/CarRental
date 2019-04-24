-- -- -------------------------------------------------------------------------------
-- -- Zadanie 7
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
-- a)
SELECT * FROM mysql.user;

CREATE USER 'user_ro'@'localhost' IDENTIFIED BY 'user_ro_password';
GRANT SELECT ON jsk_db_list.* TO 'user_ro'@'localhost';

SHOW GRANTS FOR 'user_ro'@'localhost';
-- b)
CREATE USER 'user_rw_adres'@'localhost' IDENTIFIED BY 'user_rw_adress_password';
GRANT SELECT ON jsk_db_list.* TO 'user_rw_adres'@'localhost';
GRANT ALL PRIVILEGES ON jsk_db_list.adress TO 'user_rw_adres'@'localhost';

-- c)
CREATE USER 'user_admin'@'localhost' IDENTIFIED BY 'user_admin_password';
GRANT ALL PRIVILEGES ON jsk_db_list.* TO 'user_admin'@'localhost';