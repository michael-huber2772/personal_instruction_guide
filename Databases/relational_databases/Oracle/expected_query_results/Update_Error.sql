--TEST DATA FOR UPDATE THEORY'

CREATE TABLE source_table (
 part_id NUMBER,
 part_color varchar2(50)
);

INSERT INTO source_table (part_id, part_color) VALUES (1, 'red');
INSERT INTO source_table (part_id, part_color) VALUES (2, 'blue');
INSERT INTO source_table (part_id, part_color) VALUES (3, 'yellow');
INSERT INTO source_table (part_id, part_color) VALUES (4, 'green');

SELECT *
FROM source_table
;

CREATE TABLE target_table
AS
SELECT *
FROM source_table
;

SELECT *
FROM target_table
;

INSERT INTO source_table (part_id, part_color) VALUES (4, 'orange');
DELETE FROM source_table WHERE part_id = 4 AND part_color = 'orange';

INSERT INTO source_table (part_id, part_color) VALUES (5, 'black');
INSERT INTO source_table (part_id, part_color) VALUES (5, 'grey');

-- UPDATE STATEMENT
-------------------
UPDATE target_table
SET (
    part_id
    , part_color
)
= (
    SELECT part_id
        , part_color
    FROM source_table
    WHERE target_table.part_id = source_table.part_id -- The error originates here.
  )
WHERE (target_table.part_id) IN
    (
    SELECT part_id
    FROM
        (
        SELECT part_id
            , part_color
        FROM source_table
        MINUS
        SELECT part_id
            , part_color
        FROM target_table
        )
    )
;

/*
Having one row with an id of 4 and the color green, along with another row with the id of 4 but the color orange gives me the 
same error ORA-01427: single-row subquery returns more than one row.

So looking at this it appears that because my stage table has the eleven repeat rows it will fail.

I need a way to correct for this

Do I want distinct rows in the data store or do I want an exact copy of the data source/

Okay what do I do now if the item does not show up in the target table.
*/