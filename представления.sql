CREATE VIEW original_documents AS SELECT * FROM enrollees_documents
WHERE original_document = True
GROUP BY specialty
ORDER BY id;

CREATE VIEW info_enrollees AS SELECT enrollees_documents.id_enrollee, enrollees_documents.specialty, enrollees.enrollee_firstname,
enrollees.enrollee_lastname FROM enrollees_documents
JOIN enrollees ON enrollees_documents.id_enrollee = enrollees.id_enrollee;