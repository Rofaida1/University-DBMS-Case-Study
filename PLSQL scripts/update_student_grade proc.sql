
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE update_student_grade(
    p_student_id IN NUMBER,
    p_course_id  IN VARCHAR2,
    p_new_grade  IN VARCHAR2
)
IS
    v_rows_updated NUMBER;
BEGIN
    UPDATE courses_taken
    SET grade = p_new_grade
    WHERE st_id = p_student_id AND course_id = p_course_id;

    v_rows_updated := SQL%ROWCOUNT;

    IF v_rows_updated = 0 THEN
        -- No rows were updated
        RAISE_APPLICATION_ERROR(-20001, 'No matching student or course found.');
    ELSE
        -- Rows were updated
        DBMS_OUTPUT.PUT_LINE('Grade updated successfully.');
    END IF;
EXCEPTION
   WHEN OTHERS THEN
       DBMS_OUTPUT.PUT_LINE('Error updating grade: No matching record, check your data ');
END;
/

