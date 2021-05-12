SELECT * FROM enrollees_documents -- Кто подал оригиналы документов
WHERE original_document = True
GROUP BY specialty
ORDER BY id;

-- Общее кол-во баллов абитуриента и специальность, на которую от претендует
SELECT enrollees.id_enrollee, (math + physics + computer_science + russian + extra_points) as total_score, 
enrollees_documents.specialty FROM enrollees
JOIN enrollees_documents ON enrollees_documents.id_enrollee = enrollees.id_enrollee;

SELECT passing_scores.specialty, (math + physics + computer_science + russian) as passing_score, specialties.places FROM passing_scores
JOIN specialties ON passing_scores.specialty = specialties.specialty; -- общий проходной балл на специальность и кол-во мест

-- Абитуриенты, которые набрали больше 270 баллов
SELECT * FROM (SELECT enrollees.id_enrollee, enrollees.enrollee_firstname, enrollees.enrollee_lastname, 
(math + physics + computer_science + russian + extra_points) as total_score, 
enrollees_documents.specialty FROM enrollees
JOIN enrollees_documents ON enrollees_documents.id_enrollee = enrollees.id_enrollee) as enrollees_info
WHERE enrollees_info.total_score > 270
ORDER BY enrollees_info.total_score DESC, enrollees_info.id_enrollee;