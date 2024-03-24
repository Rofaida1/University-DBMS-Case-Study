-- checking for the right email format
ALTER TABLE students
ADD CONSTRAINT chk_email_format
CHECK (REGEXP_LIKE(email, '^[A-Za-z]+[A-Za-z.-]+@gmail\.com$'));

--checking if grade entered correctly 
ALTER TABLE Courses_taken
ADD CONSTRAINT chck_grade
CHECK (UPPER(grade) IN ('A', 'B', 'C', 'D', 'F'));
