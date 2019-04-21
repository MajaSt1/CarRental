USE rent_car;

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS rent_car;

CREATE DATABASE rent_car DEFAULT CHARACTER SET UTF8MB4 ;

USE rent_car;

-- drop table if it already exists
-- DROP TABLE IF EXISTS jsk_db.movie;
-- DROP TABLE IF EXISTS jsk_db.carrier;
-- DROP TABLE IF EXISTS jsk_db.movie2actor;
-- DROP TABLE IF EXISTS jsk_db.crew_member;

-- DDL
CREATE TABLE rent_car.adress (
id INT NOT NULL AUTO_INCREMENT,

street VARCHAR(40) NOT NULL,
flat_number int(10) NOT NULL,
venue_number int(10) NOT NULL, 
postcode VARCHAR (6) NOT NULL,
country VARCHAR (40) NOT NULL, 
email VARCHAR (100) NOT NULL,
phone_number VARCHAR (12) NOT NULL,

PRIMARY KEY (id)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE rent_car.establishment (
id INT NOT NULL AUTO_INCREMENT,
adress_id INT NOT NULL,

PRIMARY KEY (id)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE rent_car.position (
id INT NOT NULL AUTO_INCREMENT,

positon_name ENUM ('seller', 'supervisor', 'accountant') NOT NULL COMMENT 'You must choose one of the given position',

PRIMARY KEY (id)
)

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE rent_car.customer(
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

CREATE TABLE rent_car.employee(
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
-- enum ?
CREATE TABLE rent_car.car(
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

CREATE TABLE rent_car.rental(
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

CREATE TABLE rent_car.charge(
id INT NOT NULL AUTO_INCREMENT,
employee_id INT NOT NULL,
car_id INT NOT NULL,

PRIMARY KEY (id)
);
-- Section: ALTER TABLE

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
        REFERENCES rent_car.position (id)
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
       REFERENCES rent_car.position(id)
       ON DELETE CASCADE;