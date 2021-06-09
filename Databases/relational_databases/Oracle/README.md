# Explanation

Concepts click with different people in different ways. I am writing this guide
for myself in the easiest way for me to remember and learn. I hope that others
will be able to benefit from this information. If it doesn't help you, just
keep searching your answer is out there.


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

# TODO
- [ ] Do a write up on "New Row identification method". Minus or NOT Exists
included in wherescape red.
- [ ] Processing method, Insert/Update vs. Merge also included in Wherescape red
- [ ] Sql Developer has a scheduler built into the program tree
on the left side. Review to see if I can schedule ETL processes
using Oracle.
- [ ] Go through this Docker Python tutorial to learn how to
build apps with Docker
- [ ] I need to add instructions here of how I maintain the file using git. I
    want to set it up so that every change I create through a fork which I then
    merge back into the master branch after I make the change.


# References
* [Github Forking Help](https://akrabat.com/the-beginners-guide-to-contributing-to-a-github-project/)
This explains when to use the master or development branch.
* SQL Style Guides
    * [Gitlab SQL Style Guide](https://about.gitlab.com/handbook/business-ops/data-team/sql-style-guide/)
    * [SQL Style Guide](https://www.sqlstyle.guide/)
    * [Kickstarter SQL Style Guide](https://gist.github.com/fredbenenson/7bb92718e19138c20591)
    * [Oracle SQL and PL/SQL Coding Guidelines](https://bitbucket.org/databaseline/docs/src/master/oracle/guidelines.md)
* [Unit Testing PL/SQL Code](https://databaseline.tech/unit-testing-plsql-code/)