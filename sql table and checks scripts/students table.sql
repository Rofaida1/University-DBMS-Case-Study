CREATE TABLE students
(
  st_id    NUMBER(15) CONSTRAINT st_id_pk PRIMARY KEY,
  st_name  VARCHAR2(100)  not null,
  email    VARCHAR2(100) unique not null,
  DOB      DATE not null,
  dept_id  NUMBER REFERENCES uni_departments(dept_id) not null
);

INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
   (1, 'Ahmed salama', 'Ahmed.salama@gmail.com', TO_DATE('1996-05-15', 'YYYY-MM-DD'), 1);
   INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (2, 'Mohamed Hassan', 'Mohamed.hassan@gmail.com', TO_DATE('1998-08-22', 'YYYY-MM-DD'), 2);
    INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (3, 'Tia Maged', 'Tia.maged@gmail.com', TO_DATE('1997-03-10', 'YYYY-MM-DD'), 3);
    INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (4, 'Maged Ali', 'Maged.Ali@gmail.com', TO_DATE('2001-03-10', 'YYYY-MM-DD'), 4);
        INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (5, 'laila Ali', 'Laila.Ali@gmail.com', TO_DATE('1999-03-5', 'YYYY-MM-DD'), 3);
        INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (6, 'Aida Ahmed', 'Aida@gmail.com', TO_DATE('1998-5-10', 'YYYY-MM-DD'), 2);
        INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (7, 'Malek Mahmoud', 'MalekM@gmail.com', TO_DATE('1999-05-29', 'YYYY-MM-DD'), 1);
        INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (8, 'Nada Hamed', 'NadaH@gmail.com', TO_DATE('1997-03-8', 'YYYY-MM-DD'), 4);
        INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (9, 'Amira  Ali', 'Amira.Ali@gmail.com', TO_DATE('2001-07-10', 'YYYY-MM-DD'), 1);
        INSERT INTO students (st_id, st_name, email, DOB, dept_id)
VALUES
    (10, 'Ahmed Zaki', 'Ahmed.Zakii@gmail.com', TO_DATE('1999-03-19', 'YYYY-MM-DD'), 3);
