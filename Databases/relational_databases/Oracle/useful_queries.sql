-- Quick way to generate the code to drop all tables in your schema
select 'drop table '||table_name||' cascade constraints;' from user_tables;