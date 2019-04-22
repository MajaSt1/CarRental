-- -- -------------------------------------------------------------------------------
-- -- Zadanie 3
-- -- -------------------------------------------------------------------------------

-- -- -------------------------------------------------------------------------------
-- Section: setting sql_mode
-- -- -------------------------------------------------------------------------------

SET sql_mode='ONLY_FULL_GROUP_BY,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS jsk_db_list;

CREATE DATABASE jsk_db_list DEFAULT CHARACTER SET UTF8MB4 ;

-- -- -------------------------------------------------------------------------------
-- Section: USE
-- -- -------------------------------------------------------------------------------
USE jsk_db_list;

-- -- -------------------------------------------------------------------------------
-- Section: rozwiazanie zadania
-- -- -------------------------------------------------------------------------------

-- zadanie 1

CREATE TABLE adress (
id INT NOT NULL AUTO_INCREMENT,

street VARCHAR(40) NOT NULL,
postcode VARCHAR (6) NOT NULL,
country VARCHAR (40) NOT NULL,
city VARCHAR(40) NOT NULL, 
email VARCHAR (100) NOT NULL,
phone_number VARCHAR (20) NOT NULL,

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
card_number VARCHAR(20) NOT NULL,
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

-- zadanie 2

INSERT INTO adress (street, postcode, country, city, email, phone_number) VALUES 
('Jastrzębia 107','11-041', 'Poland', 'Olsztyn', 'Doug_Hunt443@bretoux.com','41-366-354-708'),
('Strasse','65-831','Poland','Wroclaw','Maxwell_Lewis2477@elnee.tech','43-048-821-806'),
('Byland  Way','54-999','England','Koslan','Diane_Booth3598@eirey.tech','45-874-416-884'),
('Biernackiego','34-222','Poland','Koszalin','John_Bell5693@brety.com','56-882-672-6157'),
('Koszykowa','34-919','Poland','Grylk','Chelsea_Rodwell4193@extex.com','61-124-245-622'),
('Remmsteinowska','56-399','Saint Paul','Saint Paul','Denis_Franks4658@eirey.com','61-830-877-007'),
('JaTrasse','333-2','Honolulu','Yajja','Tyson_Swan7063@extex.com','45-360-648-515'),
('Balfe   Crossroad','555-4','Otawa','Phasta','Brad_Weston7468@brety.com','56-325-602-343'),
('Bales  Hill','2000-1','England','Eusanns','Adalind_Mills8633@supunk.com','60-211-864-621'),
('Kraszewskiego','54-000','Poland','Gizycko','Rowan_Reynolds1807@infotech44.pl','48-545-128-432'),
('Koszyczkowa','43-999','Poland','Gizycko','Roger_Allen7539@hourpy.pl','47-264-552-250'),
('Greyppa','3299-1','Santa Ana','Focley','Sofia_Foxley8403@zorer.pl','45-784-317-063'),
('Hojnackiego','23-990','Poland','Sopot','Maribel_Purvis7307@eirey.pl','47-216-543-323'),
('Bacon  Pass','6142-1','Baltimore','Hokalita','Alan_Robertson4232@nanoff.com','8-570-332-021'),
('Kwiatowa','32-880','Poland','Sopot','Fred_Uttridge3980@sheye.org','43-084-158-013'),
('Arbutus Hill','45-222','England','Edynrah','Rosemary_Moss1143@acrit.org','48-177-317-814'),
('Kwiatowa','32-333','Poland','Warszawa','Elijah_Hall4058@ovock.com','41-727-478-424');
 
 INSERT INTO establishment (adress_id) VALUES
('1'),
('2'),
('3'),
('4'),
('5');

INSERT INTO customer (name , surname, card_number, date_birth, adress_id) VALUES 
('Bolesława','Czerwinska','4539 9845 2709 1232','1938-04-17','1'),
('Jacek','Kamiński','5173 0428 1659 4719','1976-11-11', '2'),
('Zosia', 'Woźniak', '4485 1150 9312 8082', '1936-05-26', '3'),
('Kazia' ,'Sobczak','941 374 63 5297 336', '1984-02-08',' 4'),
('Dorofiej', 'Kowalczyk', '4716 1305 3594 2140', '1959-12-19', '5'),
('Radosława', 'Sokołowska','V91 5W6 77 6207 055', '1979-08-23',' 6'),
('Antoni', 'Nowicki', '5506 3969 6133 8936', '1975-06-15', '8'),
('Martyn', 'Gorski', '4916 7285 7773 7357', '1938-04-26', '7');

INSERT INTO jsk_db_list.position (positon_name) VALUES 
 ('seller'),
 ('supervisor'),
 ('accountant');
  
INSERT INTO employee (establishment_id, position_id, name , surname, date_birth, number_of_identity_document ) VALUES 
('1','1','Jadwiga','Serafin','1991-08-08','XCZ3211'),
('2','1','Tatiana','Kwiecień','1991-10-28','ACS6152'),
('5','2','Aldona','Matuszak','1995-10-30','BHS06324'),
('5','2','Ludolfa','Frączek','1989-02-07','JKL42478'),
('4','3','Beatrycze','Śmigielski','1991-05-19','YHA9263'),
('5','1','Edeltrauda','Stachurski','1997-08-16','KOP67238'),
('3','1','Amalia','Kubicki','1998-10-16','KOP98723'),
('5','1','Apolonia','Borowiec','1889-01-26','JUH23343'),
('5','1','Rodzisława','Bednarczyk','1993-08-06','HYT89094'),
('3','1','Kalina','Kupiec','1998-10-06','TRA82003'),
('3','2','Świętosława','Kamiński','1985-10-28','TRD569000');

INSERT INTO car (mileage, model, year_production, automobile, color, capacity, horse_power) VALUES 
('155 000','e60','2006','BMW','silver metalic','30 d','230 HP'),
('120 000','a6','2012','Audi','grey metalic','2.0 d','140 HP'),
('100 000','a4','2015','Audi','blue','1.9 d','140 HP'),
('120 000','passat','2013','Volkswagen','black','2.0 i','115 HP'),
('150 000','accord','2005','Honda','blue','2.4 gasoline','160 HP'),
('200 000','corsa','2002','Opel','silver','1.4 gasoline','90 HP'),
('160 000','Yaris','2006','Toyota','red','1.3 gasoline','87 HP');

INSERT INTO rental (start_rental_establishment_id, regiving_establishment_id, car_id, client_id, start_rental_date, regiving_date, cost) VALUES
('1','5','5','5','2014-11-02','2014-11-24','100.12'),
('5','5','1','1','2014-12-14','2014-12-17','10.51'),
('2','2','3','5','2005-12-21','2005-01-20','50.9'),
('5','5','4','4','2008-03-20','2008-09-11','100.92'),
('3','3','1','5','2005-04-23','2005-11-22','200.67'),
('1','1','2','6','2005-09-22','2005-12-17','80.2'),
('1','1','3','3','2009-01-23','2009-02-19','100.62'),
('3','3','2','2','2006-02-21','2007-10-23','600.63'),
('2','2','5','7','2007-07-24','2007-09-16','200.22'),
('3','3','4','5','2007-11-01','2007-12-01','50.01');



create view who_and_when_rent_car_and_at_what_time as
select customer.name, rental.start_rental_date, rental.regiving_date
from customer, rental
where customer.id= rental.client_id
group by rental.client_id, rental.start_rental_date;
  
select * from who_and_when_rent_car_and_at_what_time;
