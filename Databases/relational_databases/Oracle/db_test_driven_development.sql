-- Code taken from the following link: https://docs.oracle.com/cd/E55747_01/appdev.41/e55591/sql-developer-unit-testing.htm#RPTUG45065

-- Connect as the database user that will be used to run the unit tests.
-- Then, enter the following statements:
 
CREATE TABLE employees (employee_id NUMBER PRIMARY KEY, commission_pct NUMBER, salary NUMBER);
INSERT INTO employees VALUES (1001, 0.2, 8400);
INSERT INTO employees VALUES (1002, 0.25, 6000);
INSERT INTO employees VALUES (1003, 0.3, 5000);
-- Next employee is not in the Sales department, thus is not on commission.
INSERT INTO employees VALUES (1004, null, 10000);
commit;

SELECT *
FROM employees
;

-- Create the award bonus procedure
create or replace
PROCEDURE award_bonus (
  emp_id NUMBER, sales_amt NUMBER) AS
  commission    REAL;
  comm_missing  EXCEPTION;
BEGIN
  SELECT commission_pct INTO commission
    FROM employees
      WHERE employee_id = emp_id;
 
  IF commission IS NULL THEN
    RAISE comm_missing;
  ELSE
    UPDATE employees
      SET salary = salary + sales_amt*commission
        WHERE employee_id = emp_id;
  END IF;
END award_bonus;
/