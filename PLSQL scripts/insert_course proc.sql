CREATE OR REPLACE PROCEDURE insert_course(
    p_course_id   IN varchar2,
    p_course_name IN VARCHAR2,
    p_dept_id IN number,
    p_credits IN number
)
IS
BEGIN
    -- Insert the new department
    INSERT INTO courses (course_id, course_name,dept_id,credits)
    VALUES (p_course_id, p_course_name,p_dept_id,p_credits);

    DBMS_OUTPUT.PUT_LINE('Course inserted successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate course ID. Please choose a different ID.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting course: ' || SQLERRM);
END;
/