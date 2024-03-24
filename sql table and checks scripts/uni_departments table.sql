create table uni_departments 
(
dept_id number (4) constraint dept_id primary key ,
dept_name varchar2 (50) constraint dept_name not null,
constraint unique_dept unique (dept_name)
);
INSERT INTO uni_departments (dept_id, dept_name)
VALUES
   (1, 'IT');
   INSERT INTO uni_departments (dept_id, dept_name)
VALUES
   (2, 'Software Engineering');
   INSERT INTO uni_departments (dept_id, dept_name)
VALUES
   (3, 'Cyber Security');
   INSERT INTO uni_departments (dept_id, dept_name)
VALUES
   (4, 'Bioinformatics');