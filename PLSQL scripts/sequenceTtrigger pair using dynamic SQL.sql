--creating Sequence/Trigger pairs for all non-composite, numeric primary keys in this schema
DECLARE
  cursor seq_curs is 
    SELECT sequence_name FROM USER_SEQUENCES;

  cursor pk_curs is 
    SELECT
      distinct ucc.column_name, ucc.table_name
    FROM
      user_constraints uc
    JOIN
      user_cons_columns ucc ON uc.constraint_name = ucc.constraint_name
    JOIN
      user_TAB_COLUMNS utc ON ucc.column_name = utc.column_name
    JOIN
      user_tables ut ON ucc.TABLE_NAME = ut.table_name
    LEFT JOIN
      user_cons_columns ucc2 ON ucc2.TABLE_NAME = ucc.TABLE_NAME AND ucc2.position = 2
    WHERE
      uc.constraint_type = 'P'
      AND utc.data_type = 'NUMBER'
      AND ucc2.TABLE_NAME IS NULL;
  
  seqname VARCHAR2(50); -- has the sequence name for each table
  max_id NUMBER(6);      -- has the maximum value for each table's primary key column

BEGIN

  -- Drop existing sequences
  FOR seq_rec IN seq_curs LOOP
    EXECUTE IMMEDIATE 'DROP SEQUENCE ' || seq_rec.sequence_name;
  END LOOP;

  -- Create sequences based on primary key columns
  FOR pk_rec IN pk_curs LOOP
    seqname := pk_rec.TABLE_NAME || '_seq';
    
    -- Find the maximum value for the column
    EXECUTE IMMEDIATE 'SELECT MAX(' ||pk_rec.COLUMN_NAME|| ') FROM ' || pk_rec.TABLE_NAME INTO max_id;
    max_id := max_id + 1; 
    
    -- Create a sequence with the maximum value as the starting point and increment by 1
    EXECUTE IMMEDIATE 'CREATE SEQUENCE ' || seqname ||' START WITH ' || max_id || ' INCREMENT BY   1 NOCACHE NOCYCLE';
 
    -- Create a trigger for each table
    EXECUTE IMMEDIATE 'CREATE OR REPLACE TRIGGER ' || pk_rec.COLUMN_NAME || '_TRIG
                      BEFORE INSERT
                      ON ' || pk_rec.TABLE_NAME || '
                      REFERENCING NEW AS New OLD AS Old
                      FOR EACH ROW
                      BEGIN
                        :new.' || pk_rec.COLUMN_NAME || ' := ' || seqname || '.nextval;
                      END;';
         
  END LOOP;

END;
/