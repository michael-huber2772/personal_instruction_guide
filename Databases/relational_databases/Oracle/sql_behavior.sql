/*==============================================================================
                MINUS STATEMENT APPLIED TO MULTIPLE UNIONS
================================================================================
The goal of this code was to show that a minus statement at the bottom of a list
of UNION ALL's would remove data from an earlier union without needing
parenthesis to specify the order of operations.

OUTPUT
-------
1
3

Which proved that a parenthesis was not needed around all of the select
statements being UNIONed together.
*/
SELECT 1
FROM DUAL

UNION ALL

SELECT 2
FROM DUAL

UNION ALL

SELECT 3
FROM DUAL

MINUS

SELECT 2
FROM DUAL
;

/*==============================================================================
                MINUS AS A DISTINCT
================================================================================
If you already have query that is using a MINUS statment you don't have to use
a DISTINCT because the MINUS will perform like a DISTINCT on the data
*/

SELECT
    column_value
FROM
    TABLE(sys.odcivarchar2list('baseball', 'basketball', 'basketball', 'football', 'football'))

MINUS

SELECT
    column_value
FROM
    TABLE(sys.odcivarchar2list('tennis ball'))
;
/*
OUTPUT
------
baseball
basketall
football
*/
