set serveroutput on;
CREATE OR REPLACE FUNCTION calculate_department_gpa(
    p_dept_id IN NUMBER
) RETURN NUMBER
IS
    v_total_gpa NUMBER := 0;
    v_student_count NUMBER := 0;
    v_average_gpa NUMBER;
BEGIN
    -- Cursor to fetch students in the specified department
    FOR student_rec IN (SELECT st_id FROM courses,courses_taken WHERE courses.course_id = courses_taken.course_id and courses.dept_id = p_dept_id)
    LOOP
        -- Call the function to calculate GPA for each student
        v_total_gpa := v_total_gpa + calculate_students_gpa(student_rec.st_id);
        v_student_count := v_student_count + 1;
    END LOOP;

    -- Calculate average GPA for the department
    IF v_student_count > 0 THEN
        v_average_gpa := v_total_gpa / v_student_count;
        RETURN v_average_gpa;
    ELSE
        RETURN NULL; -- Return NULL if no students found in the department
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error calculating department GPA: ' || SQLERRM);
        RETURN NULL;
END;
/
show errors
DECLARE
    v_department_id NUMBER;
    v_average_gpa NUMBER;
BEGIN
    FOR dept_rec IN (SELECT DISTINCT dept_id FROM courses order by dept_id)
    LOOP
        v_department_id := dept_rec.dept_id;
        v_average_gpa := calculate_department_gpa(v_department_id);
        DBMS_OUTPUT.PUT_LINE('Department ' || v_department_id || ' Average GPA: ' || NVL(TO_CHAR(v_average_gpa, '0.00'), 'N/A'));
    END LOOP;
END;
/
