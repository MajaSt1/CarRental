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
WHERE a.email REGEXP '^.[^a-zA-Z].*@[a-zA-Z0-9\-]*(.pl|.eu)$';

-- zadanie 7
SELECT c.name, c.surname, a.email FROM customer c 
JOIN adress a ON a.id= c.adress_id
WHERE a.email NOT REGEXP '^[a-z\d]+[\w\d.-]*@(?:[a-z\d]+[a-z\d-]+\.){1,5}[a-z]{2,6}$';     

-- zadanie 8
SELECT COUNT(*) AS total_of_cars_with_mileage_above_200000
FROM car c
WHERE c.mileage BETWEEN '200000' AND '300000'
ORDER BY total_of_cars_with_mileage_above_200000 DESC;

-- zadanie 9

SELECT * FROM position p 
INNER JOIN employee e ON p.id=e.position_id
WHERE p.positon_name = 'supervisor';

-- zadanie 10

SELECT * FROM customer c
WHERE REGEXP_LIKE(name, '^A')
LIMIT 1;

-- zadanie 11
SELECT SUBSTR(a.email FROM LOCATE('@', a.email) + 1) AS most_frequent_domain, COUNT(*)
FROM adress a
GROUP BY most_frequent_domain
ORDER BY COUNT(*) DESC;
  
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

-- OR 
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
WHERE start_rental_date <'2018-10-23' AND 
regiving_date > '2005-09-22'
HAVING automobile = 'Audi';

-- zadanie 17
SELECT MONTH( r.start_rental_date) AS unique_month, 
COUNT(r.client_id) AS clients_rents, COUNT(DISTINCT r.client_id) AS amount_of_rent_car,
(COUNT(DISTINCT r.client_id) / COUNT(r.client_id)) AS average_amount_of_rent
FROM rental r
GROUP BY unique_month;
-- zadanie 18

SELECT * FROM car 
WHERE mileage = (SELECT MAX(mileage) FROM car);

-- zadanie 19 

SELECT customer.name , COUNT(*) AS maximum_rent
FROM customer 
INNER JOIN rental ON customer.id= rental.client_id
GROUP BY rental.client_id 
ORDER BY maximum_rent DESC 
LIMIT 1;

-- zadanie 20
WITH maximum_cars_rent_depends_on_brand AS (
SELECT r.client_id, customer.name, customer.surname,
DENSE_RANK () OVER (ORDER BY COUNT(DISTINCT car.id) DESC) AS v_rank
FROM rental r
JOIN customer ON r.client_id=customer.id
JOIN car ON r.car_id=car.id
 )  
SELECT m.name , m.surname , v_rank
FROM maximum_cars_rent_depends_on_brand m
GROUP BY v_rank=(SELECT MAX(v_rank) FROM maximum_cars_rent_depends_on_brand)
HAVING COUNT(v_rank = 1);

-- zadanie 21
SELECT DISTINCT car.model,DENSE_RANK() OVER(ORDER BY COUNT(car.model)) AS most_rent_car
FROM car
INNER JOIN rental ON car.id= rental.car_id
GROUP BY car.model
ORDER BY most_rent_car DESC;