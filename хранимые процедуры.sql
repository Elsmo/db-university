USE university;
DELIMITER //
CREATE PROCEDURE new_student (id BIGINT, firstname VARCHAR(50), lastname VARCHAR(50), course INT, specialty VARCHAR(10), 
id_group VARCHAR(15), avg_score INT) 
        INSERT INTO students  (id_student, student_firstname, student_lastname, course, specialty, id_group, avg_score) 
        VALUE (id, firstname, lastname, course, specialty, id_group, avg_score)
//

USE university;
GO
CREATE PROCEDURE avg_score_students AS
BEGIN
   SELECT id_student, student_firstname, student_lastname, avg_score
   FROM students
END;

