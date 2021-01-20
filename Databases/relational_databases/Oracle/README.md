# Oracle Notes


* [SQL Developer Unit Test Walk Through](https://docs.oracle.com/cd/E55747_01/appdev.41/e55591/sql-developer-unit-testing.htm#RPTUG45072)


# Practical Oracle SQL: Mastering the Full Power of Oracle Database

Author: Kim Berg Hansen



Chapter 2:

Study Set Theory

The three set operations are union, intersect and minus.

"what often isn’t explained as well is that set theory in principle works on 
distinct sets – sets that have no duplicates. In fact the function set in Oracle 
SQL removes duplicates from a nested table turning it into a proper “set” 
according to set theory."

In order to not just return distinct values in a union for example, I would need 
to use UNION ALL.
