WHERE Clause  
Only return the needed rows that way you are not trying to return large quantities of unneeded data. 
 
Use Table JOINs Rather than multiple Queries (Pg. 585) 
It is more efficient to use a join in a query to retrieve the data then write two separate queries to retrieve the data. 
 
"You should choose the join order in your query so that you join fewer rows to tables later in the join order. For example, ,say you were joining three related tables named tab1, tab2, and tab3. Assume tab1 contains 1,000 rows, tab2 100 rows, and tab3 10 rows. You should join tab1 with tab2 first, followed by tab2 and tab3." 
Essentially this is saying put the table with the most rows first. 
"Avoid joining complex views in your queries, because doing so cases the queries for the views to be run first, followed by your actual query. Instead, write your query using the tables rather than the views. 
 
Use Fully Qualified Column References When Performing Joins 
"Always include table aliases in your queries and use the alias for each column in your query (this is known as "fully qualifying" your column references). That way, the database doesn't have to search for each column in the tables used in your query." (Pg. 586) 
 
Use CASE Expressions Rather than Multiple Queries (pg. 587) 
Refer to the examples given in the book.  
 
Add Indexes to Tables 
Types of Indexes 
B-tree indexes 
Bitmap indexes 
Research indexes to learn more about when it is best to use them, and which indexes work best. 
Summaries of when to use which index. 
 
When to Create a B-Tree Index 
"… you should create a b-tree index on a column when you are retrieving a small number of rows from a table containing many rows." 
"Create a b-tree index when a query retrieves <= 10 percent of the total rows in a table" 
The column should contain a wide range of values.  
"A good candidate for a b-tree indexing would be a column containing a unique value for each row" 
"A poor candidate for a b-tree indexing would be a collumn that contains onlly a small range of values (for example, N, S, E, W…)." 
Oracle automatically creates a b-tree index for the primary key and for columns in a unique constraint. 
"… if your database is accessed using a lot of hierarchical queries (tha is, a query containing a CONNECT BY), you should add b-tree indexes to the columns referenced in the START WITH and CONNECT BY clauses" 
Study Hierarchical queries (Chapter 7 in the book) 
 
When to Create a Bitmap Index 
Use a bitmap index on columns that contain a small range of values and are frequently used in the WHERE clause of queries.  
"BITMAP INDEXES ARE TYPICALLY USED IN DATA WAREHOUSES" 
 
Use WHERE Rather than HAVING (pg. 588) 
WHERE is used to filter rows. HAVING is used to filter groups of rows. "Because the HAVING clause fitlers groups of rrows after they have been grouped together (which takes some time to do), you should first filter rows using a WHERE clause whenever possible…" 
 
 
Use UNION ALL Rather than UNION 
"You use UNION ALL to get all the rows retrieved by tow queries, including duplicate rows; you use UNION to get all non-duplicate rows retrieved by the queries. Because UNION removes duplicate rows (which takes some time to do), you should use UNION ALL whenever possible. 
 
Use EXISTS Rather than IN (pg. 591 read example) 
IN tells you if a value is contained in a list. EXISTS checks for the existence of rows returned by a subquery. EXISTS will generally perform better than IN because once a row is returned it evaluates to TRUE. 
 
Use EXISTS Rather than DISTINCT (pg. 591 read example)