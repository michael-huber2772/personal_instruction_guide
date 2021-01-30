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
#### Key-Value Stores
* you have a key you can query by, and the value at that key
* drawback: you usually can't query by anything other than the key
* some key-value stores let you define more than one key
* sometimes used alongside relational databases for caching
#### Column-Oriented Store (Wide Column Stores, Columnar Database)

#### BigTable/tabular
* named after Google's proprietary "BigTable" implementation
* each row can have a different set of columns
* designed for large numbers of columns
* rows are typically versioned

#### Wide Column Database 
is a category of NoSQL databases that works well
at storing enormous amounts of data. Over Petabytes. Not good for 
applications with ad-hoc query patterns, high level aggregations, and
changing database requirements. It also does not have good Data Lineage.s
* Wide Column Use Cases
  * Sensor Logs
  * User Preferences
  * Geographic Information
  * Reporting systems
  * Time Series Data
  * Logging and other write heavy applications.
#### Document Stores
* documents are stored in a structured format (XML, JSON, etc.)
* usually organized into "collections" or "databases"
* individual documents can have unique structures
* each document usually has a specific key
* it is possible to query a document by fields
* XML Databases
* JSON Document Databases
#### Graph Databases
* Best when used with highly connected data
* designed for data best represented as interconnected nodes
* example: a series of road intersections

#### Blockchain
I am not sure on this but I am adding it here for now.

#### Object Database
* Tightly integrated with the object-oriented programming language used
* Act as a persistence layer: store objects from your program directly
* You can link objects together through pointers

### Possibilities with NoSQL
* Easily create web applications with customizable fields.
* Use as a caching layer - write code to pull data from your relational database
  and then store it in NoSQL to be accessed using an API.
* Store binary files
* NoSQL many times stores metadata about the file and will allow you to query by
  it.
* Serve full web applications - Your html, style sheets and javascript can be
  served directly from NoSQL. Then you can use the permissions in NoSQL to
  control who can read and write data.

### List of NoSQL Databases
* Hadoop - Poritions of hadoop could be considered a NoSQL database, but Hadoop
  as whole is not a database. It is better classified as an alternative file
  system with a processing library.
+ **MongoDB** - Consistent, Partition-tolerant
  - You should always get the same data back from MongoDB
  - Documents are partitioned through sharding
+ **Cassandra** - Available, partition-tolerant
+ **Riak** - Available, partition-tolerant
  - Does not run easily on Windows
+ **Redis** - consistent, partition-tolerant


# Partitioning in Relational Databases vs. NoSQL
+ Relational database can be partitioned horizontally or vertically.
+ Horizontal partitioning puts different rows on different partitions.
+ Vertical partitioning puts different columns on different partitions.
+ Partitioning non-relational databases depends on type.
