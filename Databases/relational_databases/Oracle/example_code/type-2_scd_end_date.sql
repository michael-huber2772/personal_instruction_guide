/*
Type 2 Slowly Changing Dimension with start and end dates

The data for advisors is stored in its raw format in the table ds_advisor_assignments. Advisor assignments will be added to the 
table but not all old records will be removed. So to find a students current advisor you must look for the advisor that 
has the highest EFFECTIVE_TERM_CODE. 

Some students may have two advisors assigned in the same term. If that is the case you should determine the current 
advisor using the highest ACTIVITY_DATE. If the activity dates are the same, you should select the MAX SOURCE_VERSION. 
If the versions are the same you should use the MAX SURROGATE_ID. If the surrogate_id's were unique you could determine 
the current advisor for a student using that value. But there are duplicate surrogate_id's in the data. Following the 
steps listed above should keep you from having issues with the duplicates. (Note no duplicates appear in the sample data)

The end result of your query should return a student's list of current advisors with start and end dates for each 
advisor. The activity date will be the start date while the end date should be 31-DEC-2999 for current records or the
start date of the next record minus 1 day for old records.


TABLES & COLUMNS NEEDED
-----------------------
+ DS_ADVISOR_ASSIGNMENTS(DS_BAN_SGRADVR) = ADVISOR ASSIGNMENTS TO STUDENTS
    - You locate advisors using max_term_code_eff
    - Original data contained primary and secondary advisors that is excluded here.
    - Adding a tracking_id which is a combination of the advisor id and code (Other schools excluded)
    COLUMNS:
        * ADVISOR_ID
        * EFFECTIVE_TERM_CODE - Term codes are the year with the number 1-3 added to the end. E.g. 20191, 20192, 20193
            - 1 = Spring, 2 = Summer, 3 = Fall
        * ADVISOR_TYPE - Possible advisor types in the example will only be 'ADVSR'=Advisor 
        * ACTIVITY_DATE - Date the source data was updated
        * TRACKING_ID - Concatenation of student_id and advisor_type (This helps in processing, in a data warehouse we are not worried about repeat values)
        * SOURCE_VERSION - Every time a record is updated the version has 1 added to it
        * SURROGATE_ID - Identification record for the row. I will make this value 100 or greater
        * PROCESSING_HASH - Concatenation of the values that uniquely identify a row - Used for incremental loading. In this instance it is the GUID concatenated with the source_version
        * DS_UPDATE_TIME - Date the row was last updated
        * DS_CREATE_TIME - Date the row was created

DATA
----
+ 4 Students
    - 1
    - 2
    - 3
    - 4
+ 4 Advisors
    - 1
    - 2
    - 3
    - 4

SAMPLE DATA DDL
---------------
*/
CREATE TABLE ds_advisor_assignments (
    student_id NUMBER,
    advisor_id NUMBER,
    effective_term_code NUMBER,
    advisor_type VARCHAR2(50 CHAR) DEFAULT 'ADVSR',
    activity_date DATE,
    tracking_id VARCHAR2(2000 CHAR),
    source_version NUMBER,
    surrogate_id NUMBER,
    processing_hash VARCHAR2(2000 CHAR),
    ds_update_time DATE,
    ds_create_time DATE
)
;

--DROP TABLE ds_advisor_assignments
-- ;
--TRUNCATE TABLE ds_advisor_assignments
--;


CREATE TABLE current_advisors
    AS
        SELECT
            student_id,
            advisor_id,
            effective_term_code,
            activity_date start_date,
            CAST(TO_DATE('31-DEC-2999','DD-MON-YYYY') AS DATE) AS end_date,
            tracking_id,
            source_version,
            processing_hash,
            ds_update_time,
            ds_create_time
        FROM
            ds_advisor_assignments
;

ALTER TABLE current_advisors MODIFY end_date DEFAULT TO_DATE('31-DEC-2999','DD-MON-YYYY')
;

--DROP TABLE current_advisors
--;
-- TRUNCATE TABLE current_advisors
-- ;

/*
CURRENT_ADVISORS DATA
======================
STUDENT 1
----------
END_DATE for the below record after processing the new records should be 09-DEC-16.
*/
INSERT INTO current_advisors (student_id, advisor_id, effective_term_code, start_date, tracking_id, source_version, processing_hash, ds_update_time, ds_create_time) VALUES (1, 4, 20163, TO_DATE('10-MAY-16','DD-MON-YYYY'), '1ADVSR', 1, 'xxxx1', TO_DATE('09-MAY-16','DD-MON-YYYY'), TO_DATE('10-MAY-16','DD-MON-YYYY'));
/*
STUDENT 4
----------
Processing hash already exists in this table so a duplicate record should not be inserted for this individual
*/
INSERT INTO current_advisors (student_id, advisor_id, effective_term_code, start_date, tracking_id, source_version, processing_hash, ds_update_time, ds_create_time) VALUES (4, 4, 20172, TO_DATE('10-MAY-2017','DD-MON-YYYY'), '4ADVSR', 2, 'bccc2', TO_DATE('11-MAY-2017','DD-MON-YYYY'), TO_DATE('11-MAY-2017','DD-MON-YYYY'));

SELECT *
FROM current_advisors
;





/*
DS_ADVISOR_ASSIGNMENTS DATA
============================
Student 1
---------
Everything is the same between the two records except the advisor_id and the surrogate_id. Per our requirements for the data 
only the second record with the advisor_id of 2 and the surrogate_id of 101 should be returned.
*/
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (1, 1, 20171, TO_DATE('10-DEC-16','DD-MON-YYYY'), '1ADVSR', 1, 100, 'aaaa1', TO_DATE('11-DEC-16','DD-MON-YYYY'), TO_DATE('11-DEC-16','DD-MON-YYYY'));
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (1, 2, 20171, TO_DATE('10-DEC-16','DD-MON-YYYY'), '1ADVSR', 1, 101, 'aaab1', TO_DATE('11-DEC-16','DD-MON-YYYY'), TO_DATE('11-DEC-16','DD-MON-YYYY'));

/*
Student 2
----------
This student has an advisor assigned in 20172 and 20173. This means that the current advisor is advisor 1 who was assigned in 
20173. This is the advisor we would want assigned in the final data set.
*/
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (2, 4, 20172, TO_DATE('10-MAY-2017','DD-MON-YYYY'), '2ADVSR', 1, 102, 'aabb1', TO_DATE('11-MAY-2017','DD-MON-YYYY'), TO_DATE('11-MAY-2017','DD-MON-YYYY'));
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (2, 1, 20173, TO_DATE('10-MAY-2017','DD-MON-YYYY'), '2ADVSR', 2, 103, 'abbb2', TO_DATE('11-MAY-2017','DD-MON-YYYY'), TO_DATE('11-MAY-2017','DD-MON-YYYY'));

/*
Student 3
----------
This student's current advisor is Advisor 3. This is determined by the activity date.
*/
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (3, 2, 20172, TO_DATE('10-MAY-2017','DD-MON-YYYY'), '3ADVSR', 1, 104, 'bbbb1', TO_DATE('11-MAY-2017','DD-MON-YYYY'), TO_DATE('11-MAY-2017','DD-MON-YYYY'));
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (3, 3, 20172, TO_DATE('11-MAY-2017','DD-MON-YYYY'), '3ADVSR', 1, 105, 'bbbc2', TO_DATE('12-MAY-2017','DD-MON-YYYY'), TO_DATE('12-MAY-2017','DD-MON-YYYY'));

/*
Student 4
----------
This student's current advisor is Advisor 4. This is determined by the version.
*/
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (4, 1, 20172, TO_DATE('10-MAY-2017','DD-MON-YYYY'), '4ADVSR', 1, 106, 'bbcc1', TO_DATE('11-MAY-2017','DD-MON-YYYY'), TO_DATE('11-MAY-2017','DD-MON-YYYY'));
INSERT INTO DS_ADVISOR_ASSIGNMENTS (student_id, advisor_id, effective_term_code, activity_date, tracking_id, source_version, surrogate_id, processing_hash, ds_update_time, ds_create_time) VALUES (4, 4, 20172, TO_DATE('10-MAY-2017','DD-MON-YYYY'), '4ADVSR', 2, 107, 'bccc2', TO_DATE('11-MAY-2017','DD-MON-YYYY'), TO_DATE('11-MAY-2017','DD-MON-YYYY'));


SELECT *
FROM ds_advisor_assignments
;





-- PROCEDURE TO EXTRACT THE CURRENT ADVISORS AND INSERT IT INTO THE CURRENT ADVISOR TABLE
-----------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE insert_current_advisors
IS
    --=====================================================
    -- Variables
    --=====================================================
    v_step            integer := 100;
    v_insert_count    integer := 0;   -- no of records inserted
    v_dss_create_time       date;         -- Used for date insert
    v_dss_update_time       date;         -- Used for date insert
    

BEGIN
    v_step := 200;
    v_dss_create_time := SYSDATE;
    v_dss_update_time := SYSDATE;
    
BEGIN
    --============================================================================
    -- Update expiring rows for Advisors and set End Dates
    --============================================================================
    UPDATE current_advisors target
    SET (
          target.end_date
        , target.ds_update_time
    ) = (
    SELECT temp_source.end_date
        , temp_source.ds_update_time
    FROM (
        WITH current_adv_filter
            AS ( SELECT   student_id
                        , advisor_id
                        , effective_term_code
                        , advisor_type
                        , activity_date
                        , tracking_id
                        , source_version
                        , surrogate_id
                        , processing_hash
                 FROM ds_advisor_assignments a
                 -- As soon as the code hits a value that is greater it will exit out. So if the term_codes are the same
                 -- but one activity date is greater than the other it will select the record with the higher date
                 WHERE TO_CHAR(a.effective_term_code) || TO_CHAR(a.activity_date, 'YYYYMMDD') || TO_CHAR(a.source_version) || TO_CHAR(a.surrogate_id) = 
                 (SELECT MAX(TO_CHAR(b.effective_term_code) || TO_CHAR(b.activity_date, 'YYYYMMDD') || TO_CHAR(b.source_version) || TO_CHAR(b.surrogate_id))
                                                FROM ds_advisor_assignments b
                                                WHERE a.tracking_id = b.tracking_id)
                ),
        combined_records AS (
            SELECT    current_adv_filter.tracking_id
                    , current_adv_filter.activity_date start_date
                    , current_adv_filter.processing_hash
            FROM current_adv_filter
            
            UNION ALL
            
            SELECT    current_advisors.tracking_id
                    , current_advisors.start_date
                    , current_advisors.processing_hash
            FROM current_advisors
            LEFT JOIN current_adv_filter ON current_adv_filter.tracking_id = current_advisors.tracking_id
            WHERE current_advisors.end_date = TO_DATE('31-DEC-2999','DD-MON-YYYY')
                AND current_adv_filter.tracking_id IS NOT NULL
                AND current_adv_filter.processing_hash <> current_advisors.processing_hash
        ),
        calculate_end_date AS (
            SELECT   tracking_id
                   , start_date
                   , LEAD(start_date) OVER (PARTITION BY tracking_id ORDER BY start_date) - 1 end_date
            FROM combined_records
        )
        SELECT tracking_id
            , CASE WHEN calculate_end_date.end_date < calculate_end_date.start_date THEN calculate_end_date.start_date
              ELSE calculate_end_date.end_date
              END end_date
            , sysdate ds_update_time
        FROM calculate_end_date
    ) temp_source
    WHERE temp_source.end_date IS NOT NULL
    AND target.tracking_id = temp_source.tracking_id
    )
     --WHERE CLAUSE FOR THE UPDATE STATEMENT: THIS CLAUSE IS USED TO CHOOSE THE ROWS THAT WILL BE UPDATED; IT FILTERS THE
     -- TARGET TABLE TO CURRENT RECORDS AND THEN MATCHES THE TRACKING_ID'S OF THESE RECORDS TO THE TRACKING_ID'S RETURNED
     -- BY THE END_DATE_KEYS QUERY ABOVE. THE SAME LOGIC IS REPEATED TO DETERMINE WHAT ROWS NEED UPDATED
     --------------------------------------------------------------------------------------------------------------------
    WHERE target.end_date = TO_DATE('31-DEC-2999','DD-MON-YYYY')
    AND (target.tracking_id) IN (
        WITH current_adv_filter
            AS ( SELECT   student_id
                        , advisor_id
                        , effective_term_code
                        , advisor_type
                        , activity_date
                        , tracking_id
                        , source_version
                        , surrogate_id
                        , processing_hash
                 FROM ds_advisor_assignments a
                 -- As soon as the code hits a value that is greater it will exit out. So if the term_codes are the same
                 -- but one activity date is greater than the other it will select the record with the higher date
                 WHERE TO_CHAR(a.effective_term_code) || TO_CHAR(a.activity_date, 'YYYYMMDD') || TO_CHAR(a.source_version) || TO_CHAR(a.surrogate_id) = 
                 (SELECT MAX(TO_CHAR(b.effective_term_code) || TO_CHAR(b.activity_date, 'YYYYMMDD') || TO_CHAR(b.source_version) || TO_CHAR(b.surrogate_id))
                                                FROM ds_advisor_assignments b
                                                WHERE a.tracking_id = b.tracking_id)
                ),
        combined_records AS (
            SELECT    current_adv_filter.tracking_id
                    , current_adv_filter.activity_date start_date
                    , current_adv_filter.processing_hash
            FROM current_adv_filter
            
            UNION ALL
            
            SELECT    current_advisors.tracking_id
                    , current_advisors.start_date
                    , current_advisors.processing_hash
            FROM current_advisors
            LEFT JOIN current_adv_filter ON current_adv_filter.tracking_id = current_advisors.tracking_id
            WHERE current_advisors.end_date = TO_DATE('31-DEC-2999','DD-MON-YYYY')
                AND current_adv_filter.tracking_id IS NOT NULL
                AND current_adv_filter.processing_hash <> current_advisors.processing_hash
        ),
        calculate_end_date AS (
            SELECT   tracking_id
                   , start_date
                   , LEAD(start_date) OVER (PARTITION BY tracking_id ORDER BY start_date) - 1 end_date
            FROM combined_records
        )
        SELECT tracking_id
        FROM calculate_end_date
        WHERE calculate_end_date.end_date IS NOT NULL
    )
    ;


    COMMIT;
END;

  --=======================================================
  -- Insert input records into current advisors
  --=======================================================
BEGIN
    INSERT /*+ APPEND */ INTO current_advisors
        (
            student_id
          , advisor_id
          , effective_term_code
          , start_date
          , tracking_id
          , source_version
          , processing_hash
          , ds_update_time
          , ds_create_time
        )
    WITH current_adv_filter
            AS ( SELECT   student_id
                        , advisor_id
                        , effective_term_code
                        , advisor_type
                        , activity_date
                        , tracking_id
                        , source_version
                        , surrogate_id
                        , processing_hash
                 FROM ds_advisor_assignments a
                 -- As soon as the code hits a value that is greater it will exit out. So if the term_codes are the same
                 -- but one activity date is greater than the other it will select the record with the higher date
                 WHERE TO_CHAR(a.effective_term_code) || TO_CHAR(a.activity_date, 'YYYYMMDD') || TO_CHAR(a.source_version) || TO_CHAR(a.surrogate_id) = 
                 (SELECT MAX(TO_CHAR(b.effective_term_code) || TO_CHAR(b.activity_date, 'YYYYMMDD') || TO_CHAR(b.source_version) || TO_CHAR(b.surrogate_id))
                                                FROM ds_advisor_assignments b
                                                WHERE a.tracking_id = b.tracking_id)
                )
    SELECT  current_adv_filter.student_id
          , current_adv_filter.advisor_id
          , current_adv_filter.effective_term_code
          , current_adv_filter.activity_date
          , current_adv_filter.tracking_id
          , current_adv_filter.source_version
          , current_adv_filter.processing_hash
          , v_dss_create_time
          , v_dss_update_time
    FROM current_adv_filter
    -- USING THIS JOIN IN PLACE OF A MINUS
    LEFT JOIN current_advisors
        ON current_adv_filter.processing_hash = current_advisors.processing_hash
    WHERE current_advisors.processing_hash IS NULL
    ;
    
    COMMIT;
END;

END insert_current_advisors;


-- This will run the procedure from above. It will end_date expiring rows and insert new current advisors
EXECUTE insert_current_advisors;


SELECT *
FROM current_advisors
ORDER BY 1
;



