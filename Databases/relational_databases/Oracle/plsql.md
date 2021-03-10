# PL/SQL
+ Declaration Section
  - Anonymous block: DECLARE
  - Cretae Function: IS
  - Create Procedure: IS 


## Procedures
+ Does not have a return value and therefore cannot be called from a SELECT 
  statement.
+ Methods to call a stored procedure
  - Can be called with an EXEC or CALL statement
  - EXEC from SQL*Plus, SQLcli, or SQL Developer
  - CALL from a SQL Language Interface
  - An anonymous procedure block
+ Can modify and return the OUT arguments in the argument list


## Functions
+ Can be called from a SELECT statement and has a RETURN value.