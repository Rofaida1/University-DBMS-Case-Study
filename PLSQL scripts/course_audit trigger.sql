  create or replace trigger courses_audit 
after update of grade on courses_taken
for each row 
begin
insert into course_history 
(st_id, course_id,old_grade)
values 
(:old.st_id,:old.course_id,:old.grade);
end;
show errors