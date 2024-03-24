CREATE TABLE courses_taken
(
  st_id  number (15) references students (st_id),
  course_id    varchar2(50)  references courses (course_id),
 grade varchar2 (1) not null,
 primary key (st_id,course_id)
);

insert into courses_taken (st_id, course_id,grade)
values 
(1,'IT847','A');
insert into courses_taken (st_id, course_id,grade)
values 
(3,'CIT132','B');
insert into courses_taken (st_id, course_id,grade)
values 
(2,'CIT670','C');
insert into courses_taken (st_id, course_id,grade)
values 
(3,'IT847','B');
insert into courses_taken (st_id, course_id,grade)
values 
(7,'SE165','A');
insert into courses_taken (st_id, course_id,grade)
values 
(6,'SE732','D');
insert into courses_taken (st_id, course_id,grade)
values 
(2,'SE213','C');
insert into courses_taken (st_id, course_id,grade)
values 
(8,'IT847','B');
insert into courses_taken (st_id, course_id,grade)
values 
(1,'CSN720','A');
insert into courses_taken (st_id, course_id,grade)
values 
(4,'CSN370','B');
insert into courses_taken (st_id, course_id,grade)
values 
(8,'CIT670','A');
insert into courses_taken (st_id, course_id,grade)
values 
(10,'IT847','B');





