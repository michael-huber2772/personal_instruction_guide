# Explain Plans

## Cost
Cost column in an explain plan is not a reliable way to judge the real costs of a SQL statements response time. refer
to reference 1 below. The cost column is supposed to be a guess of the number of single block disk reads required,
but it is not very useful for SQL tuning.


# SQL Tuning

## Use EXISTS rather than DISTINCT
```sql
--BAD
SELECT DISTINCT pe.student_id, pe.name
FROM person pe, purchases pu
WHERE pe.student_id = pu.student_id
;
```
Better
```sql
SELECT student_id, name
FROM student outer
WHERE EXISTS
    (SELECT 1
     FROM purchases inner
     WHERE inner.student_id = outer.student_id)
     ;
```


# References
1. [Cost in explain Plans](http://www.dba-oracle.com/t_sql_execution_plan_cost_column.htm)