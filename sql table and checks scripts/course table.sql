CREATE TABLE courses (
  course_id   VARCHAR2(50)   PRIMARY KEY,
  course_name VARCHAR2(100) UNIQUE NOT NULL,
  dept_id     NUMBER REFERENCES uni_departments(dept_id) NOT NULL,
  credits     NUMBER (1) not null
);
insert into courses (course_id, course_name,dept_id,credits)
values
('CIT660','Statistical Analysis for Bioinforamtics',4,3);
insert into courses (course_id, course_name,dept_id,credits)
values
('CIT570','NGS',4,4);
insert into courses (course_id, course_name,dept_id,credits)
values
('CSN370','Networks Fundementals',3,2);
insert into courses (course_id, course_name,dept_id,credits)
values
('CSN720','Ethical Hacking',3,5);
insert into courses (course_id, course_name,dept_id,credits)
values
('SE213','Java script',2,4);
insert into courses (course_id, course_name,dept_id,credits)
values
('SE165','C++',2,3);
insert into courses (course_id, course_name,dept_id,credits)
values
('SE732','Python',2,3);
insert into courses (course_id, course_name,dept_id,credits)
values
('IT487','Cloud computing',1,4);
insert into courses (course_id, course_name,dept_id,credits)
values
('IT847','Data Warehousing',1,3);
insert into courses (course_id, course_name,dept_id,credits)
values
('CIT132','ML for Bioinformatics',4,4);
insert into courses (course_id, course_name,dept_id,credits)
values
('CIT670','Programming with R',4,5);