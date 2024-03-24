create table course_history (
  st_id  number (15) references STUDENTS (st_id),
  course_id    varchar2(50)  references COURSES
 (course_id),
 old_grade varchar2 (1) not null,
 primary key (st_id,course_id,old_grade)
);

  create or replace trigger courses_audit 
after update of grade on students
for each row 
begin
insert into courses_history 
(st_id, course_id,old_grade)
values 
(:old.st_id,course_id,:old.grade);
end;
