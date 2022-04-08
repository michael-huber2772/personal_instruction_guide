# Postgres

## Common Commands and Actions

### Creating a Role
```sql
CREATE ROLE demo_role WITH LOGIN, CREATE, SELECT, INSERT, UPDATE, DELETE;
```

#### List of Privilieges (Not Comprehensive)
SELECT,
INSERT,
UPDATE,
DELETE,
TRUNCATE,
REFERENCES,
TRIGGER,
CREATE,
CONNECT,
TEMPORARY,
EXECUTE,
USAGE,
LOGIN,


### Creating a user for an application
```sql
CREATE USER test WITH PASSWORD 'test123';
```

### psql Commands
* `\du` = Lists all user accounts (or roles)
* `\l` = show all databases on the server
* `\c <db_name>` = switch to that database
    * `\dt` = show tables in the database you are connected to
* `\d` = details about a sequence

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

### Changing Sequence Start Value
SELECT setval('public.app_customer_id_seq', 100001, true);


# REFERENCES
* [List of Postgres Data Modeling Tools](https://dbmstools.com/categories/data-modeling-tools/postgresql)
I need to look at the rest of the tools. But so far my favorite has been 
GenMyModel
* [Connect Oracle Data Modeler to Postgres](https://aus800.com.au/using-oracle-sql-developer-data-modeller-sddm-for-postgresql/)
