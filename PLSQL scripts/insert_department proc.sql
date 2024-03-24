set serveroutput on;
CREATE OR REPLACE PROCEDURE insert_department(
    p_dept_id   IN NUMBER,
    p_dept_name IN VARCHAR2
)
IS
BEGIN
    -- Insert the new department
    INSERT INTO uni_departments (dept_id, dept_name)
    VALUES (p_dept_id, p_dept_name);

    DBMS_OUTPUT.PUT_LINE('Department inserted successfully.');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate department ID. Please choose a different ID.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error inserting department: ' || SQLERRM);
END;
/
show errors;