DROP DATABASE IF EXISTS university;
CREATE DATABASE university;
USE university;

DROP TABLE IF EXISTS university;
SET foreign_key_checks = 0;

DROP TABLE IF EXISTS faculties;
CREATE TABLE faculties(
id_faculty INT NOT NULL AUTO_INCREMENT,
faculty_name VARCHAR(60),
PRIMARY KEY (id_faculty)
);
INSERT INTO faculties (faculty_name)
VALUES ('РТС'), ('ИКСС'), ('ИСИТ'), ('СЦТ');

DROP TABLE IF EXISTS specialties;
CREATE TABLE specialties(
id_faculty INT NOT NULL,
specialty VARCHAR(10),
places INT NOT NULL, -- кол-во мест на направлении
PRIMARY KEY (specialty),
FOREIGN KEY (id_faculty) REFERENCES faculties(id_faculty) 
);
INSERT INTO specialties 
VALUES (1, 'ЭБТ', 200), (1, 'ЦТРВ', 212), (1, 'КПРС', 195), (1, 'ТВИМ', 198), (1, 'РОС', 186), (1, 'РСИВ', 150), (2, 'ЗСС', 170),
(2, 'ПИВТ', 227), (2, 'ИКС', 90), (3, 'БИС', 287), (3, 'ИКД', 143), (3, 'ИСАУ', 128), (3, 'ИУС', 199), (4, 'ИЯ', 110), (4, 'ФК', 70);

DROP TABLE IF EXISTS students;
CREATE TABLE students(
id_student BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
student_firstname VARCHAR(50),
student_lastname VARCHAR(50),
course INT NOT NULL,
specialty VARCHAR(10), -- специальность
id_group VARCHAR(15), -- номер группы студента
avg_score INT NOT NULL, 
FOREIGN KEY (specialty) REFERENCES specialties(specialty)
);
INSERT INTO `students` VALUES (1,'Damien','Russel',4,'БИС',' Tus',4),(2,'Assunta','O\'Reilly',4,'ЗСС',' Wekk',4),
(3,'Gerald','Haley',2,'ИКД',' Foma',3),(4,'Alana','Bode',4,'ИКС',' Kiff',4),(5,'Eliseo','Steuber',1,'ИСАУ',' Sot',4),
(6,'Eldora','Fay',1,'ИУС',' Hef',4),(7,'Alva','Lowe',4,'ИЯ',' Koda',3),(8,'Rex','Gottlieb',2,'КПРС',' Tus',4),
(9,'Hans','Heathcote',1,'ПИВТ',' Nemo',5),(10,'Jefferey','Murray',4,'РОС','Etc',4),(11,'Darwin','King',1,'РСИВ',' Hef',4),
(12,'Crystel','Lynch',2,'ТВИМ',' Nemo',3),(13,'Kenny','Treutel',5,'ФК','Etc',4),(14,'Kiel','Stehr',5,'ЦТРВ',' Foma',4),
(15,'Zelda','O\'Kon',5,'ЭБТ',' Nemo',4),(16,'Haylie','Willms',5,'БИС',' Sot',3),(17,'Torrey','Kuphal',5,'ЗСС',' Pop',3),
(18,'Filiberto','Jenkins',2,'ИКД',' Nemo',4),(19,'Marcelino','Nitzsche',1,'ИКС',' Sot',3),(20,'Meggie','Pfeffer',3,'ИСАУ',' Wekk',3),
(21,'Rebekah','Hermann',2,'ИУС',' Roro',4),(22,'Brant','Schiller',1,'ИЯ',' Wekk',3),(23,'Odell','Dickens',1,'КПРС',' Sot',5),
(24,'Alisha','Rowe',2,'ПИВТ',' Hef',3),(25,'Nora','Bergnaum',3,'РОС',' Koda',3),(26,'Pink','Hodkiewicz',4,'РСИВ',' Pop',3),
(27,'Hobart','Green',3,'ТВИМ',' Pop',3),(28,'Shana','Rogahn',2,'ФК',' Hef',4),(29,'Reece','Blick',4,'ЦТРВ',' Wekk',4),
(30,'Evelyn','D\'Amore',1,'ЭБТ',' Bup',5),(31,'Ryley','Kertzmann',1,'БИС',' Wekk',3),(32,'Julia','Hettinger',4,'ЗСС',' Koda',3),
(33,'Kari','Zulauf',3,'ИКД',' Bup',3),(34,'Alexandro','Stiedemann',4,'ИКС',' Nemo',5),(35,'Alexane','Batz',3,'ИСАУ',' Tus',5),
(36,'Adelia','Kemmer',5,'ИУС',' Pop',5),(37,'Lori','Kulas',2,'ИЯ',' Nemo',3),(38,'Elmer','Stokes',1,'КПРС',' Sot',4),
(39,'Clyde','Beahan',5,'ПИВТ',' Tus',5),(40,'Santa','Hammes',2,'РОС',' Mile',4),(41,'Derick','Turcotte',4,'РСИВ',' Kiff',3),
(42,'Valentina','Boyer',3,'ТВИМ',' Pop',5),(43,'Juana','Hayes',4,'ФК',' Wekk',5),(44,'Kelvin','Barton',1,'ЦТРВ',' Kiff',5),
(45,'Aniyah','Kilback',1,'ЭБТ',' Mile',5),(46,'Skye','Lubowitz',2,'БИС',' Mile',5),(47,'Ashly','Bechtelar',3,'ЗСС',' Koda',5),
(48,'Gloria','McKenzie',4,'ИКД',' Foma',3),(49,'Ismael','Bernhard',3,'ИКС',' Mile',3),(50,'Lindsey','Herman',5,'ИСАУ',' Koda',3);


DROP TABLE IF EXISTS passing_scores; -- проходный баллы
CREATE TABLE passing_scores(
specialty VARCHAR(10) PRIMARY KEY,
math INT(3),
physics INT(3),
computer_science INT(3),
russian INT(3),
FOREIGN KEY (specialty) REFERENCES specialties(specialty),
FOREIGN KEY (specialty) REFERENCES students(specialty)
);
INSERT INTO `passing_scores` VALUES ('БИС',79,40,59,42),('ЗСС',34,48,40,79),('ИКД',84,37,16,90),('ИКС',57,45,84,57),
('ИСАУ',34,1,16,60),('ИУС',51,37,60,40),('ИЯ',50,46,30,79),('КПРС',32,4,8,68),('ПИВТ',27,55,84,73),
('РОС',43,63,86,72),('РСИВ',31,41,85,74),('ТВИМ',75,62,13,76),('ФК',66,50,22,55),('ЦТРВ',56,16,36,84),('ЭБТ',27,70,47,82);

DROP TABLE IF EXISTS electives; -- факультативы
CREATE TABLE electives(
id_elective INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
elective_name VARCHAR(60),
lecturer_firstname VARCHAR(50),
lecturer_lastname VARCHAR(50)
);
INSERT INTO `electives` VALUES (1,'Введение в Java','Sim','Aufderhar'),(2,'Тренинг публичного выступления','Rodrigo','Runte'),
(3,'Основы взаимодействия сетевых условий Cisco','Gwendolyn','Kohler'),(4,'Основы компьютерного зрения','Joshua','Heller'),
(5,'Основы типографики и компьютерной вёрстки','Silas','Lemke'),(6,'Программирование баз данных на SQL','Camron','Kutch'),
(7,'Английский язык','Mathilde','Doyle'),(8,'Радиотехника','Hildegard','Cormier'),(9,'Основы Photoshop','Gretchen','Mosciski'),
(10,'Электротехника','Alisha','Rath'),(11,'Основы интернет-предпринимательства','Isabell','Hagenes'),(12,'Исторический клуб','Claudine','Gerlach'),
(13,'Программирование python','Chandler','Walker'),(14,'Интернет вещей','Virgie','Homenick');

DROP TABLE IF EXISTS electives_timetable;
CREATE TABLE electives_timetable(
id_elective INT NOT NULL PRIMARY KEY,
start_time TIME(0),
finish_time TIME(0),
day_of_week VARCHAR(10),
FOREIGN KEY (id_elective) REFERENCES electives(id_elective)
);
INSERT INTO `electives_timetable` VALUES (1,'17:00:00','19:20:00','Tuesday'),(2,'18:30:00','20:30:00','Monday'),
(3,'18:30:00','20:30:00','Monday'),(4,'17:00:05','19:00:00','Thursday'),(5,'18:15:00','19:30:00','Friday'),
(6,'18:15:00','19:30:00','Friday'),(7,'18:15:00','19:30:00','Friday'),(8,'18:30:00','20:30:00','Monday'),
(9,'17:00:05','19:00:00','Thursday'),(10,'17:00:00','19:20:00','Tuesday'),(11,'18:15:00','19:30:00','Friday'),
(12,'17:00:00','19:20:00','Wednesday'),(13,'17:00:05','19:00:00','Thursday'),(14,'18:15:00','19:30:00','Sunday');

DROP TABLE IF EXISTS elective_students; -- список студентов на факультативах
CREATE TABLE elective_students(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_elective INT NOT NULL,
id_student BIGINT UNSIGNED NOT NULL,
FOREIGN KEY (id_elective) REFERENCES electives(id_elective),
FOREIGN KEY (id_student) REFERENCES students(id_student)
);
INSERT INTO `elective_students` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),
(10,10,10),(11,11,11),(12,12,12),(13,13,13),(14,14,14),(15,1,15),(16,2,16),(17,3,17),(18,4,18),(19,5,19),(20,6,20),
(21,7,1),(22,8,2),(23,9,3),(24,10,4),(25,11,5),(26,12,6),(27,13,7),(28,14,8),(29,1,9),(30,2,10),(31,3,11),(32,4,12),
(33,5,13),(34,6,14),(35,7,15),(36,8,16),(37,9,17),(38,10,18),(39,11,19),(40,12,20);

DROP TABLE IF EXISTS group_leaders; -- список старост групп
CREATE TABLE group_leaders(
id_leader INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_student BIGINT UNSIGNED NOT NULL,
FOREIGN KEY (id_student) REFERENCES students(id_student)
);
INSERT INTO `group_leaders` VALUES (1,1),(2,14),(3,23),(4,11),(5,2),(6,3),
(7,5),(8,6),(9,21),(10,20),(11,24),(12,7),(13,10),(14,9),(15,13),(16,29),(17,17),(18,4);

DROP TABLE IF EXISTS enrollees; -- абитуриенты
CREATE TABLE enrollees(
id_enrollee INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
enrollee_firstname VARCHAR(50),
enrollee_lastname VARCHAR(50),
math INT(3),
physics INT(3),
computer_science INT(3),
russian INT(3),
extra_points INT(2)
);
INSERT INTO `enrollees` VALUES (1,'Alvina','Maggio',62,93,48,59,7),(2,'Rick','Trantow',89,7,17,76,2),
(3,'Jonatan','Bradtke',40,82,10,41,1),(4,'Ollie','Schaden',80,57,81,92,5),(5,'Kamryn','Hahn',86,19,42,77,10),
(6,'Delores','Keebler',48,86,6,95,8),(7,'Nigel','Kub',77,38,27,92,1),(8,'Ryley','Toy',77,35,66,39,5),
(9,'Tabitha','Bartoletti',82,20,100,94,6),(10,'Pierre','Swaniawski',23,91,43,89,1),(11,'Freeda','Nienow',39,38,63,90,2),
(12,'Domenick','Bayer',73,93,18,86,5),(13,'Cassie','Heaney',26,18,93,61,10),(14,'Idell','Nitzsche',43,74,10,93,6),
(15,'Adonis','Leuschke',35,11,45,100,5),(16,'Mossie','Huel',22,79,61,91,3),(17,'Leanna','Schumm',67,95,57,69,1),
(18,'Princess','Crist',57,87,91,64,7),(19,'Kristopher','Klocko',31,81,0,83,2),(20,'Lorenza','Stehr',70,69,72,71,1),
(21,'Julia','Botsford',46,57,75,99,10),(22,'Sonya','Effertz',60,76,52,78,5),(23,'Otto','Waters',23,93,71,44,3),
(24,'Corene','Thompson',71,19,63,84,8),(25,'Johnnie','Borer',77,98,1,93,5),(26,'Vincenzo','Wintheiser',96,75,56,71,8),
(27,'Reese','Kassulke',26,11,36,94,1),(28,'Keanu','Johnson',24,46,9,100,9),(29,'Andreanne','Gutkowski',60,67,57,71,2),
(30,'Rubie','Carroll',66,35,60,80,9),(31,'Stella','Wisozk',41,74,50,43,7),(32,'Quinton','Torp',84,53,16,98,9),
(33,'Bulah','Schuster',91,76,94,51,4),(34,'Robin','Jenkins',45,84,37,90,8),(35,'Shaylee','Lindgren',23,81,51,49,0),
(36,'Rosie','Balistreri',100,12,18,75,2),(37,'Bud','Cronin',93,84,17,62,9),
(38,'Lee','O\'Keefe',54,43,40,61,3),(39,'Kathlyn','Swift',88,64,63,99,0),(40,'Oral','Wisoky',64,62,8,85,9),
(41,'Graciela','Larkin',74,52,55,97,9),(42,'Dora','Oberbrunner',62,73,8,85,9),(43,'Darrel','Russel',61,47,72,96,10),
(44,'Fanny','Hudson',33,27,84,66,4),(45,'Allie','Denesik',51,27,83,38,3),(46,'Koby','Haag',54,51,91,81,2),
(47,'Queenie','Marquardt',44,87,58,64,6),(48,'Brisa','Streich',30,29,49,77,4),(49,'D\'angelo','Thompson',90,4,77,36,6),
(50,'Vincenza','Wehner',23,91,53,71,9);


DROP TABLE IF EXISTS enrollees_documents; -- документы абитуриентов
CREATE TABLE enrollees_documents(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_enrollee INT NOT NULL,
specialty VARCHAR(10),
original_document TINYINT,
FOREIGN KEY (id_enrollee) REFERENCES enrollees(id_enrollee),
FOREIGN KEY (specialty) REFERENCES specialties(specialty)
);
INSERT INTO `enrollees_documents` VALUES (1,1,'БИС',0),(2,2,'ЗСС',1),(3,3,'ИКД',1),(4,4,'ИКС',0),(5,5,'ИСАУ',0),
(6,6,'ИУС',0),(7,7,'ИЯ',0),(8,8,'КПРС',1),(9,9,'ПИВТ',1),(10,10,'РОС',0),(11,11,'РСИВ',1),(12,12,'ТВИМ',1),
(13,13,'ФК',0),(14,14,'ЦТРВ',0),(15,15,'ЭБТ',0),(16,16,'БИС',0),(17,17,'ЗСС',0),(18,18,'ИКД',1),(19,19,'ИКС',1),
(20,20,'ИСАУ',1),(21,21,'ИУС',1),(22,22,'ИЯ',1),(23,23,'КПРС',0),(24,24,'ПИВТ',1),(25,25,'РОС',1),(26,26,'РСИВ',1),
(27,27,'ТВИМ',1),(28,28,'ФК',0),(29,29,'ЦТРВ',1),(30,30,'ЭБТ',1),(31,31,'БИС',0),(32,32,'ЗСС',1),(33,33,'ИКД',0),
(34,34,'ИКС',0),(35,35,'ИСАУ',0),(36,36,'ИУС',1),(37,37,'ИЯ',0),(38,38,'КПРС',1),(39,39,'ПИВТ',0),(40,40,'РОС',0),
(41,41,'РСИВ',1),(42,42,'ТВИМ',0),(43,43,'ФК',1),(44,44,'ЦТРВ',0),(45,45,'ЭБТ',1),(46,46,'БИС',1),(47,47,'ЗСС',0),
(48,48,'ИКД',1),(49,49,'ИКС',1),(50,50,'ИСАУ',1);

SET foreign_key_checks = 1;

