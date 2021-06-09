# Errors and Solutions
----------------------

## ERROR 0RA-65096: INVALID COMMON USER OR ROLE NAME when attempting to Create a User
If you get the following error: `ORA-65096: invalid common user or role name`
when attempting to create a user in the database.
### Solution
Run the following code to alter your session `ALTER SESSION SET
"_ORACLE_SCRIPT"=true;` and it will allow
you to run the code to create the user without getting an error.
[Link to Solution](https://www.youtube.com/watch?v=LkNbjAXkOWg)
