/*
I have used the for loop in PL/SQL for a few different applicathions. In the below example I used it to find an error
in our data.

We were getting the error ORA-01830: date format picture ends before converting entire input string. This was occurring
because 1 record had added milliseconds to its date record. So in order to find the record causing the issue. 
I created a for loop that would create a dynamic sql statement and iterate over each student_id until it found the 
record that was failing. Before running the for loop I did not know that milliseconds was the issue. Once I pinpointed
the record causing the error I was able to inspect it and find the issue.

Another application of a similar for loop is I switched our procedure updating materialized views from hardcoded values
to dynamic sql that would query our metadata to retrieve the object name and refresh it.

TABLE: load_orientations
COLUMNS:
    - student_id - VARCHAR2
    - activity_date - VARCHAR2

TODO
----
- [ ] Create a test data set for this code
*/


SET SERVEROUTPUT ON;
DECLARE
  l_output VARCHAR2 (300);
  date_out VARCHAR2 (300);
  sql_stmt VARCHAR2 (300);
BEGIN
   FOR c IN (SELECT studentid
             FROM wsrpmgr.load_orientations) LOOP
    sql_stmt := 'SELECT student_id , to_date(regexp_replace(activity_date, ''T'', '' ''), ''YYYY-MM-DD HH24:MI:SS'') FROM wsrpmgr.load_orientations WHERE studentid = '''
                 || TO_CHAR(c.studentid)
                 || '''' ;
      DBMS_OUTPUT.PUT_LINE ('Result: ' || sql_stmt);
      EXECUTE IMMEDIATE sql_stmt INTO l_output, date_out;
      DBMS_OUTPUT.PUT_LINE('RETURN:' || l_output);
   END LOOP;
END;
/