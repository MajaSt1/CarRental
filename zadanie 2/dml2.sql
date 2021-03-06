-- -- -------------------------------------------------------------------------------
-- -- Zadanie 2
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

 INSERT INTO adress (street, postcode, country, city, email, phone_number) VALUES 
('Jastrzębia 107','11-041', 'Poland', 'Olsztyn', 'D1ug_Hunt@bretoux.pl','41-366-354-708'),
('Strasse','65-831','Poland','Wroclaw','Maxwell@elnee.tech','43-048-821-806'),
('Byland  Way','54-999','England','Koslan','D5ane@eirey.eu','45-874-416-884'),
('Biernackiego','34-222','Poland','Koszalin','_John_Bell@brety.com','56-882-672-6157'),
('Koszykowa','34-919','Poland','Grylk','R2dwell4193extex.com.','61-124-245-622'),
('Remmsteinowska','56-399','Saint Paul','Saint Paul','@infotech44.pl','61-830-877-007'),
('JaTrasse','333-2','Honolulu','Yajja','Allen7539@hourpy','45-360-648-515'),
('Balfe   Crossroad','555-4','Otawa','Phasta','-Brad_Weston7468@brety.com','56-325-602-343'),
('Bales  Hill','2000-1','England','Eusanns','Adali@supunk.com','60-211-864-621'),
('Kraszewskiego','54-000','Poland','Gizycko','A1a@infotech44.pl','48-545-128-432'),
('Koszyczkowa','43-999','Poland','Gizycko','Allen7539@hourpy','47-264-552-250'),
('Greyppa','3299-1','Santa Ana','Focley','Sofia_Foxley8403@zorer.pl','45-784-317-063'),
('Hojnackiego','23-990','Poland','Sopot','M3ribel_Purvis7307@eirey.pl','47-216-543-323'),
('Bacon  Pass','6142-1','Baltimore','Hokalita','Alan_Robertson4232@nanoff.com','8-570-332-021'),
('Kwiatowa','32-880','Poland','Sopot','Fred_Uttridge3980@sheye.org','43-084-158-013'),
('Arbutus Hill','45-222','England','Edynrah','Rosemary_M@acrit.org','48-177-317-814'),
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

INSERT INTO position (positon_name) VALUES 
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
('5','1','Apolonia','Bor','1889-01-26','JUH23343'),
('5','1','Rodzisława','Bednarczyk','1993-08-06','HYT89094'),
('3','1','Kalina','Kupiec','1998-10-06','TRA82003'),
('3','2','Świętosława','Kamiński','1985-10-28','TRD569000');


INSERT INTO car (mileage, model, year_production, automobile, color, capacity, horse_power) VALUES 
('260 000','e60','2006','BMW','silver metalic','30 d','230 HP'),
('120 000','a6','2012','Audi','grey metalic','2.0 d','140 HP'),
('100 000','a4','2015','Audi','blue','1.9 d','140 HP'),
('120 000','passat','2013','Volkswagen','black','2.0 i','115 HP'),
('150 000','accord','2005','Honda','blue','2.4 gasoline','160 HP'),
('250 000','corsa','2002','Opel','silver','1.4 gasoline','90 HP'),
('160 000','Yaris','2006','Toyota','red','1.3 gasoline','87 HP');

INSERT INTO charge (employee_id, car_id) VALUES 
('1','1'),
('1','2'),
('2','3'),
('2','4'),
('3','5'),
('4','6'),
('5','7'),
('5','2'),
('3','2'),
('3','5'),
('7','5'),
('6','6'),
('6','7');

INSERT INTO rental (start_rental_establishment_id, regiving_establishment_id, car_id, client_id, start_rental_date, regiving_date, cost) VALUES
('1','5','6','5','2018-11-02','2018-11-24','100.12'),
('5','5','2','1','2014-12-14','2014-12-17','10.51'),
('2','2','3','5','2005-12-21','2005-12-22','10.9'),
('5','5','4','6','2008-03-20','2008-09-11','100.92'),
('3','3','1','5','2005-04-23','2005-11-22','200.67'),
('1','1','5','6','2005-09-22','2005-12-17','80.2'),
('3','3','1','2','2018-02-21','2018-10-23','600.63'),
('2','2','5','7','2007-07-24','2007-09-16','200.22'),
('3','3','1','2','2016-11-01','2016-12-01','50.01'),
('3','3','1','2','2015-11-21','2015-11-23','20.63'),
('1','1','3','3','2009-01-23','2009-02-19','100.62'),
('3','3','1','7','2011-02-21','2011-10-23','600.63'),
('2','2','4','8','2004-07-24','2004-09-16','200.22'),
('3','3','5','8','2010-11-01','2010-12-01','50.01'),
('3','3','1','8','2011-11-21','2011-11-23','20.63');
