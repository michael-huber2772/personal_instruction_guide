# Postgres

## Common Commands and Actions

### Creating a user for an application

### psql Commands
* `\du` = Lists all user accounts (or roles)
* `\l` = show all databases on the server
* `\c <db_name>` = switch to that database
    * `\dt` = show tables in the database you are connected to

### Useful Sequence Commands
* Command to update the sequence value to a different number
```sql
SELECT setval('public.products_customer_id_seq', 10001, true);
```
* Look at the current value from a sequence
```sql
SELECT last_value FROM sequence_name;
```
* List all sequences in the database
```sql
SELECT
    relname sequence_name
FROM 
    pg_class 
WHERE 
    relkind = 'S';
```


# REFERENCES
* [List of Postgres Data Modeling Tools](https://dbmstools.com/categories/data-modeling-tools/postgresql)
I need to look at the rest of the tools. But so far my favorite has been 
GenMyModel
