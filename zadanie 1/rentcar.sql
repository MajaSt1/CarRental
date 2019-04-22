-- -- -------------------------------------------------------------------------------
-- -- Zadanie 1
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------
-- Key settings:
-- ONLY_FULL_GROUP_BY = gwarantuje swiadome deklarowanie sekcji GROUP BY
-- STRICT_ALL_TABLES = gwarantuje, że wstawicie odpowiednie typy/długości danych w odpowiednie miejsca
-- 	DB automatycznie nie będzie konwertował typów ani nie ucinał długości znaków.
-- 	Czyli nie bedzie mozliwe wstawienie stringa '10/24' do pola INT(10) ani stringa
-- 	o dlugosci 100 znakow w pole VARCHAR(10). Przy wlaczonym STRICT_ALL_TABLES pojawi sie Error
-- 	a nie Warning.
-- SQL Modes: https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html
-- -- -------------------------------------------------------------------------------

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -- -------------------------------------------------------------------------------
-- Section: DROP DATABASE lub DROP TABLEs
-- -- -------------------------------------------------------------------------------
-- Tutaj usuwamy całą bazę przed jej zadeklarowaniem. To pozwoli Wam łatwo resetować
-- bazę danych w trakcie testów.
-- -- -------------------------------------------------------------------------------

DROP DATABASE IF EXISTS jsk_db_list;

-- -- -------------------------------------------------------------------------------
-- Section: CREATE DATABASE/SCHEMA
-- -- -------------------------------------------------------------------------------
CREATE DATABASE jsk_db_list DEFAULT CHARACTER SET UTF8MB4 ;

-- -- -------------------------------------------------------------------------------
-- Section: USE
-- -- -------------------------------------------------------------------------------
USE jsk_db_list;

-- -- -------------------------------------------------------------------------------
-- Section: CREATE
-- -- -------------------------------------------------------------------------------
-- Tutaj tworzymy nasze tabele bez kluczy obcych. Definiujemy tylko i wyłącznie tabele.
-- W sekcji niżej należy pododawać relacje między tabelami. To daje większą przejrzystość.
-- Pola, do ktorych dodamy klucze w sekcji 'ALTER TABLE', powinny znalezc sie juz w naszych DDL
-- -- -------------------------------------------------------------------------------
CREATE TABLE adress (
id INT NOT NULL AUTO_INCREMENT,

street VARCHAR(40) NOT NULL,
postcode VARCHAR (6) NOT NULL,
country VARCHAR (40) NOT NULL,
city VARCHAR(40) NOT NULL, 
email VARCHAR (100) NOT NULL,
phone_number VARCHAR (12) NOT NULL,

PRIMARY KEY (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE establishment (
id INT NOT NULL AUTO_INCREMENT,
adress_id INT NOT NULL,

PRIMARY KEY (id)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE position (
id INT NOT NULL AUTO_INCREMENT,

positon_name ENUM ('seller', 'supervisor', 'accountant') NOT NULL COMMENT 'You must choose one of the given position',

PRIMARY KEY (id)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE customer(
id INT NOT NULL AUTO_INCREMENT,

name VARCHAR (40) NOT NULL,
surname VARCHAR (40) NOT NULL,
card_number VARCHAR(16) NOT NULL,
date_birth DATE NOT NULL,

adress_id INT NOT NULL,
PRIMARY KEY (id)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE employee(
id INT NOT NULL AUTO_INCREMENT,
establishment_id INT NOT NULL,
position_id INT NOT NULL,

name VARCHAR (40) NOT NULL,
surname VARCHAR (40) NOT NULL,
date_birth DATE NOT NULL,
number_of_identity_document VARCHAR (20) DEFAULT NULL COMMENT 'number of passport or your identity document',

UNIQUE INDEX uq_employee_id_number (number_of_identity_document ASC),
PRIMARY KEY (id)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE car(
id INT NOT NULL AUTO_INCREMENT,
mileage VARCHAR (40) NOT NULL,
model VARCHAR (40) NOT NULL,
year_production INT(4) NOT NULL,
automobile VARCHAR (40) NOT NULL,
color VARCHAR(20),
capacity VARCHAR (20),
horse_power VARCHAR (20),

PRIMARY KEY (id)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE rental(
id INT NOT NULL AUTO_INCREMENT,
start_rental_establishment_id INT NOT NULL,
regiving_establishment_id INT NOT NULL,
car_id INT NOT NULL,
client_id INT NOT NULL,
start_rental_date DATE NOT NULL,
regiving_date DATE NOT NULL,
cost VARCHAR(50) NOT NULL,

PRIMARY KEY (id),
UNIQUE INDEX uq_rental_start_rental_date (start_rental_date ASC)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE charge(
id INT NOT NULL AUTO_INCREMENT,
employee_id INT NOT NULL,
car_id INT NOT NULL,

PRIMARY KEY (id)
);

-- -- -------------------------------------------------------------------------------
-- Section: ALTER TABLE
-- -- -------------------------------------------------------------------------------
-- Tutaj możesz dodać klucze obce (ALE nie pola - te powinny znalexc sie w sekcji 'CREATE').
-- Jesli potrzebujesz - mozesz dodac tutaj dodatkowe zmiany w tabelach
-- -- -------------------------------------------------------------------------------
ALTER TABLE establishment 
	ADD CONSTRAINT fk_establishment_adress 
			FOREIGN KEY (adress_id) 
			REFERENCES  adress(id)
			ON DELETE CASCADE;
                
ALTER TABLE customer 
	ADD CONSTRAINT fk_customer_adress 
		  FOREIGN KEY (adress_id)
		  REFERENCES adress(id)
		  ON DELETE CASCADE;
           
ALTER TABLE employee
	ADD CONSTRAINT fk_employee_establishment 
        FOREIGN KEY (establishment_id) 
        REFERENCES establishment (id)
        ON DELETE CASCADE,
ADD CONSTRAINT fk_employee_position 
        FOREIGN KEY (position_id) 
        REFERENCES position (id)
        ON DELETE CASCADE;
        
ALTER TABLE rental 
       ADD CONSTRAINT fk_rental_establishment_regiving
       FOREIGN KEY (regiving_establishment_id) 
       REFERENCES establishment(id)
       ON DELETE CASCADE,
ADD CONSTRAINT fk_rental_establishment_start 
	   FOREIGN KEY (start_rental_establishment_id)
       REFERENCES establishment(id)
       ON DELETE CASCADE,
ADD CONSTRAINT fk_charge_car
       FOREIGN KEY (car_id)
       REFERENCES car(id)
       ON DELETE CASCADE,
ADD CONSTRAINT fk_charge_client
       FOREIGN KEY (client_id)
       REFERENCES customer(id)
       ON DELETE CASCADE;
       
ALTER TABLE charge
       ADD CONSTRAINT fk_charge_establishment 
       FOREIGN KEY (employee_id) 
       REFERENCES establishment(id)
       ON DELETE CASCADE,
ADD CONSTRAINT fk_charge_position 
	   FOREIGN KEY (car_id) 
       REFERENCES jsk_db_list.position(id)
       ON DELETE CASCADE;




