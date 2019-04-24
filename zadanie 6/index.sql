-- -- -------------------------------------------------------------------------------
-- -- Zadanie 6
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
EXPLAIN SELECT name, surname, position_id FROM employee 
WHERE name = '';

CREATE INDEX name_of_employee ON employee(name);

SHOW INDEXES FROM employee;

DROP INDEX name_of_employee ON employee;
-- a ) 
-- database search engine can use to speed up data retrieval.
-- An index helps to speed up SELECT queries and WHERE clauses, 
-- but it slows down data input, with the UPDATE and the INSERT statements.

CREATE INDEX name_of_customer ON customer(name);

SHOW INDEXES FROM customer;

DROP INDEX name_of_customer ON customer;

-- NEGATIVE ONES 
-- Indexes should not be used on small tables.
-- Tables that have frequent, large batch updates or insert operations.
-- Indexes should not be used on columns that contain a high number of NULL values.
-- Columns that are frequently manipulated should not be indexed.
    

