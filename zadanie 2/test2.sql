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

 INSERT INTO adress (street, postcode, country, city, email, phone_number) VALUES (
 ('Jastrzębia, 107','11-041', 'Poland', 'Olsztyn', 'Doug_Hunt443@bretoux.com','41-366-354-708'),
('Strasse','65-831','Poland','Wroclaw','Maxwell_Lewis2477@elnee.tech','42-048-821-806'),
('Byland  Way','54-999','England','Koslan','Diane_Booth3598@eirey.tech','44-874-416-884'),
('Biernackiego','34-2222','Poland','Koszalin','John_Bell5693@brety.com','42-882-672-6157'),
('Koszykowa','34-919','Poland','Grylk','Chelsea_Rodwell4193@extex.com','41-124-245-622'),
('Remmsteinowska','56-399300','Saint Paul','Saint Paul','Denis_Franks4658@eirey.com','46-830-877-007'),
('JaTrasse','333-2','Honolulu','Yajja','Tyson_Swan7063@extex.com','47-360-648-515'),
('Balfe   Crossroad','555-4','Otawa','Phasta','Brad_Weston7468@brety.com','42-325-602-343'),
('Bales  Hill','2000-1','England''Eusanns','Adalind_Mills8633@supunk.com','47-211-864-621'),
('Kraszewskiego','54-0092','Poland','Gizycko','Rowan_Reynolds1807@infotech44.pl','48-545-128-432'),
('Koszyczkowa','43-999','Poland','Gizycko','Roger_Allen7539@hourpy.pl','47-264-552-250'),
('Greyppa','3299-1','Santa Ana','Focley','Sofia_Foxley8403@zorer.pl','45-784-317-063'),
('Hojnackiego','23-9909','Poland','Sopot','Maribel_Purvis7307@eirey.pl','47-216-543-323'),
('Bacon  Pass','6142-1','Baltimore','Hokalita','Alan_Robertson4232@nanoff.com','8-570-332-021'),
('Kwiatowa','32-880','Poland','Sopot','Fred_Uttridge3980@sheye.org','43-084-158-013'),
('Arbutus Hill','45-2222','England','Edynrah','Rosemary_Moss1143@acrit.org','48-177-317-814'),
('Kwiatowa','32-333','Poland','Warszawa','Elijah_Hall4058@ovock.com','41-727-478-424'));
 
 INSERT INTO establishment (adress_id) VALUES (
('1'),
('2'),
('3'),
('4'),
('5')
);

INSERT INTO customer (name , surname, card_number, date_birth, adress_id) VALUES (
('Bolesława','Czerwinska','4539 9845 2709 1232','1938-04-17','1'),
('Jacek','Kamiński','5173 0428 1659 4719','1976-11-11', '2'),
('Zosia', 'Woźniak', '4485 1150 9312 8082', '1936-05-26', '3'),
('Kazia' ,'Sobczak',' 1Z 941 374 63 5297 336 3', '1984-02-08',' 4'),
('Dorofiej', 'Kowalczyk', '4716 1305 3594 2140', '1959-12-19', '5'),
('Radosława', 'Sokołowska',' 1Z V91 5W6 77 6207 055 4', '1979-08-23',' 6'),
('Antoni', 'Nowicki', '5506 3969 6133 8936', '1975-06-15', '8'),
('Martyn', 'Gorski', '4916 7285 7773 7357', '1938-04-26', '7'));

INSERT INTO position (position) VALUES (
 ('seller'),
 ('supervisor'),
 ('accountant'));
  
INSERT INTO employee (establishment_id, position_id, name , surname, date_birth, number_of_identity_document ) VALUES (
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
('3','2','Świętosława','Kamiński','1985-10-28','TRD569000'));


INSERT INTO rental (start_rental_establishment_id, regiving_establishment_id, car_id, client_id, start_rental_date, regiving_date, cost) VALUES ();
('1','5','9','9','2014-11-02','2014-11-24','100.12'),
('5','5','1','1','2014-12-14','2014-12-17','10.51'),
('2','2,'3,'8','2005-12-21','2005-01-20','50.9'),
('5','5','7','4','2008-03-20','2008-09-11','100.92'),
('3'.'3','1','5','2005-04-23','2005-11-22','200.67'),
('1','1','9','6','2005-09-22','2005-12-17','80.2'),
('1','1','8','3','2009-01-23','2009-02-19','100.62'),
('3','3','2','2','2006-02-21','2007-10-23','600.63'),
('2','2','5','7','2007-07-24','2007-09-16','200.22'),
('3','3','4','10','2007-11-01','2007-12-01','50.01'));

INSERT INTO car (mileage, model, year_production, automobile, color, capacity, horse_power) VALUES (
);
