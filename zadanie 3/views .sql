-- -- -------------------------------------------------------------------------------
-- -- Zadanie 3
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

-- zadanie 1

CREATE VIEW v_who_and_when_rent_car_and_at_what_time AS
SELECT customer.name, customer.surname, rental.start_rental_date,
rental.regiving_date, car.model, car.automobile
FROM customer
INNER JOIN rental ON customer.id= rental.client_id
INNER JOIN car ON rental.id= car.id;
  
select * from who_and_when_rent_car_and_at_what_time;

-- zadanie 2
 -- 2.	Stwórz zapytanie, które pozwoli Ci znaleźć klientów, którzy zapłacili najwięcej za wypożyczenia w bieżącym roku. 
 
CREATE VIEW v_clients_who_paid_highest_for_rent AS
SELECT c.name, c.surname, SUM(r.cost) AS totals
FROM customer c
INNER JOIN rental r ON c.id= r.client_id
GROUP BY c.name , c.surname
ORDER BY totals DESC 
LIMIT 1;

select * from clients_who_paid_highest_for_rent;


