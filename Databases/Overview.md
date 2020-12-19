# Database Overview
The two main categories of databases are **Relational** and **Non-Realtional(NoSQL)**
databases.

_"All relational databases can be used to manage transaction-oriented 
applications (OLTP), and most non-relational databases, in the categories of 
Document Stores and Column Stores, can also be used for OLTP"_ -Ref 1: Keith D.
Foote


# Relational Database
**Advantages:**
 * Structured Data
 * ACID transactions and JOIN support.
 * built-in data integrity
 * Relationships with constraints
 * Limitless indexing
**Disadvantages:**
* Do not scale horizontally very well without sharding.
* Do not work well with semi-structured data.
### List of Relational Databases
* Oracle
* MySQL
* Microsoft SQL Server
* PostgreSQL
* DB2

# NoSQL/Non-Relational Databases
Some databases in this category may fall into more than one type of database.
E.g. Couchbase is a key-value store and a document database.
**Advantages:**
* "They scale out horizontally and work with unstructured and semi-structured 
  data. Some support ACID transactional consistency." -Ref 1
* Schema Free
**Disadvantages:**
* BASE instead of ACID
* Not much support for JOINs
* Denormalized data requires mass updates.
* Data integrity must be done in your code it is not built in.
* Limited indexing
### Types of NoSQL databases
* Key-Value Stores
* Column-Oriented Store (Wide Column Stores, Columnar Database)
* Document Stores
    * XML Databases
    * JSON Document Databases
* Graph Databases
    * Best when used with highly connected data.

### List of NoSQL Databases
* Hadoop - Poritions of hadoop could be considered a NoSQL database, but Hadoop
  as whole is not a database. It is better classified as an alternative file
  system with a processing library.