 
In oracle SQL @<filename>.sql will call a sql file and run the contents of it and give you output. I am still working on how to use that output in a query within my file though. 
 
 
Explain Plan 
Cardinality - The number of records it thinks it will return 
Bit Map Indexes will index nulls but normal b tree indexes may not index nulls. 
Lower cost is better 
Put the three rows into one row by concatenating 
Hash Joins are Ideal 
Changing Not in to not exist 
You can hint but it is not always the best in production. 
We could move the data to a temporary table 
 
 
How to Return rows that are duplicated between two tables that violate a unique constrainst