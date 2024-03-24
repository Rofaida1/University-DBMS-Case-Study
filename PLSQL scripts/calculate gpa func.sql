CREATE OR REPLACE FUNCTION calculate_students_gpa(
    p_st_id IN NUMBER
) RETURN NUMBER
IS
    v_total_credits NUMBER := 0;
    v_total_grade_points NUMBER := 0;
    v_course_count NUMBER := 0;
    v_gpa NUMBER;
BEGIN
    -- Cursor to fetch courses for the given student
    FOR course_rec IN (SELECT courses.course_id,UPPER(courses_taken.grade) AS grade, credits FROM courses, courses_taken WHERE courses.course_id = courses_taken.course_id AND st_id = p_st_id) 
    LOOP
        -- Check for valid grades and calculate grade points
        CASE course_rec.grade
            WHEN 'A' THEN
                v_total_grade_points := v_total_grade_points + (4 * course_rec.credits);
            WHEN 'B' THEN
                v_total_grade_points := v_total_grade_points + (3 * course_rec.credits);
            WHEN 'C' THEN
                v_total_grade_points := v_total_grade_points + (2 * course_rec.credits);
            WHEN 'D' THEN
                v_total_grade_points := v_total_grade_points + (1 * course_rec.credits);
            WHEN 'F' THEN
                -- Failed, no grade points
                NULL;
            ELSE
                -- Handle other grades or invalid grades
                DBMS_OUTPUT.PUT_LINE('Invalid grade for course_id ' || course_rec.course_id);
        END CASE;

        -- Accumulate total credits
        v_total_credits := v_total_credits + course_rec.credits;
        v_course_count := v_course_count + 1;
    END LOOP;

    -- Calculate GPA
    IF v_course_count > 0 THEN
        v_gpa := v_total_grade_points / v_total_credits;
        RETURN v_gpa;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No courses found for the student.');
        RETURN NULL;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error calculating GPA: ' || SQLERRM);
        RETURN NULL;
END;
/
-- Execute the function for a specific student ID
DECLARE
    v_student_gpa NUMBER;
BEGIN
    v_student_gpa := calculate_students_gpa(3);
    IF v_student_gpa IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Student GPA: ' || TO_CHAR(v_student_gpa, '0.00'));
    END IF;
END;
/
show errors