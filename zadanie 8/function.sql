-- -- -------------------------------------------------------------------------------
-- -- Zadanie 8
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -----------------------------------------------------------------------------
2.	Stwórz funkcję, która dla podanego klienta, znajdzie string „YYYY-MM’ odpowiadający „rok-miesiąc” w którym klient miał największą liczbę wypożyczeń.
Przygotuj zapytanie, które pokaże dane klienta oraz wyświetli dla niego rezultat w/w funkcji.

-- Section: USE
-- -- -------------------------------------------------------------------------------
USE jsk_db_list;

-- -- -------------------------------------------------------------------------------
-- Section: rozwiazanie zadania
-- -- -------------------------------------------------------------------------------
-- functions

-- 1)
DROP FUNCTION IF EXISTS amount_of_rent;

DELIMITER $$

CREATE FUNCTION amount_of_rent(customer_id INT)
	RETURNS INT DETERMINISTIC 
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM rental r 
    WHERE customer_id= r.client_id;
    
	RETURN total;
END
$$

DELIMITER ;

SELECT  amount_of_rent('5');

SELECT c.id, c.name, c.surname,
	amount_of_rent(c.id) AS amount
FROM customer c
ORDER BY c.name ASC;

-- 2)
DROP FUNCTION IF EXISTS amount_of_rent;

DELIMITER $$

CREATE FUNCTION amount_of_max_rent_month(customer_id INT)
	RETURNS VARCHAR (20) DETERMINISTIC
BEGIN
    DECLARE month_of_max_value VARCHAR (20);

	SELECT DATE_FORMAT(r.start_rental_date, '%M %Y') INTO month_of_max_value
    FROM rental r 
    WHERE customer_id= r.client_id
    GROUP BY r.start_rental_date
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    
	RETURN month_of_max_value;
END
$$

DELIMITER ;

SELECT amount_of_max_rent_month('2');

SELECT c.id, c.name, c.surname,
	amount_of_max_rent_month(c.id) AS amount
FROM customer c
ORDER BY c.name ASC;

DROP FUNCTION IF EXISTS amount_of_max_rent_month;