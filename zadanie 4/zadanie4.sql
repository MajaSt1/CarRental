-- -- -------------------------------------------------------------------------------
-- -- Zadanie 4
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------

SET sql_mode='STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -------------------------------------------------------------------------------
-- Section: USE
-- -- -------------------------------------------------------------------------------
USE jsk_db_list;

-- -- -------------------------------------------------------------------------------
-- Section: rozwiazanie zadania
-- -- -------------------------------------------------------------------------------

-- zadanie 1

SHOW TABLES;

-- zadanie 2

SHOW COLUMNS FROM employee;

-- zadanie 3

SELECT name, surname 
FROM employee
WHERE date_birth < DATE_SUB(CURDATE(), INTERVAL 25 YEAR);

-- zadanie 4

SELECT * FROM employee e WHERE char_length(e.surname) > 5;

-- zadanie 5

SELECT * FROM employee e WHERE REGEXP_LIKE(surname, '^.a');

-- zadanie 6

SELECT a.email, c.name FROM adress a  INNER JOIN customer c ON a.id=c.adress_id
WHERE a.email REGEXP '^(.)[^A-Za-z].*\1$'
-- '^[^A-Za-z]' 
AND a.email REGEXP '%[@]%';

-- zadanie 7

 CREATE TABLE tn (c1 INT)
	PARTITION BY LIST(1 DIV c1) (
    PARTITION p0 VALUES IN (NULL),
    PARTITION p1 VALUES IN (1)
     );
     
-- zadanie 8
-- !!
SELECT id, COUNT(*) AS total_of_cars
FROM car 
WHERE ( mileage BETWEEN 200000 AND 300000)
ORDER BY total_of_cars DESC;

-- zadanie 9

SELECT * FROM position p 
INNER JOIN employee e ON p.id=e.position_id
WHERE p.positon_name = 'supervisor';

-- zadanie 10

SELECT * FROM customer c
WHERE REGEXP_LIKE(name, '^A')
LIMIT 1;

-- zadanie 11

-- zadanie 12
SELECT model, automobile, COUNT(*) AS total_of_charge
FROM charge
JOIN car ON (charge.car_id=car.id)
GROUP BY charge.car_id 
HAVING total_of_charge >= 2
ORDER BY total_of_charge DESC;

-- zadanie 13	
SELECT employee.* FROM employee
LEFT JOIN charge
ON employee.id=charge.employee_id
WHERE charge.id IS NULL;

-- WHERE NOT EXISTS

-- zadanie 14
SELECT color 
FROM car 
WHERE car.id = 5;

UPDATE car 
SET color='red'
WHERE car.id=5;

SELECT color 
FROM car 
WHERE car.id =5;

-- zadanie 15
-- a)	Weź pod uwagę różne możliwości nakładania się terminów ??
SELECT customer.name , customer.surname, car.automobile, 
r.start_rental_date, r.regiving_date
FROM rental r
INNER JOIN customer ON (r.client_id = customer.id)
INNER JOIN car ON (r.car_id= car.id)
WHERE start_rental_date > '2005-09-22' AND 
regiving_date < '2018-10-23'
HAVING automobile = 'Audi';

-- zadanie 16 

SELECT customer.name , customer.surname, car.automobile, 
r.start_rental_date, r.regiving_date
FROM rental r
INNER JOIN customer ON (r.client_id = customer.id)
INNER JOIN car ON (r.car_id= car.id)
WHERE start_rental_date >='2005-09-22' AND 
regiving_date <= '2018-10-23'
HAVING automobile = 'Audi';

-- zadanie 17
SELECT extract(MONTH from rental.start_rental_date) AS ys, extract(
MONTH from rental.regiving_date) AS rs, SUM(rental.car_id), SUM(rental.client_id)
FROM rental 
JOIN customer ON (rental.client_id=customer.id)
JOIN car ON (rental.car_id = car.id)
WHERE ;
-- zadanie 18

SELECT * FROM car 
WHERE mileage = (SELECT MAX(mileage) FROM car);

-- zadanie 19 
-- znajdź klientów z największą liczbą wypożyczeń (może być więcej niż 1)
SELECT customer.id AS customer_id, customer.surname, COUNT(rental.id) AS num
FROM customer 
LEFT JOIN rental ON (rental.client_id=customer.id)
GROUP BY customer.id, customer_name
ORDER BY customer_name DESC;


-- zadanie 20
-- zadanie 21