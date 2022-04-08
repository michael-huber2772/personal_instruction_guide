# Graph Databases
Graph databases come from Graph theory which is a branch of mathematics. Graph
theory has many application in physics, medicine, computer science, and
sociology.

* Vertices, or “nodes,” represent distinct objects.
* Edges, or “relationships” or “arcs,” connect these objects.
    * Properties of relationships might include the type, strength, or history
      of the relationship.
* Both vertices and edges can have properties.
-Database Ref 2: Guy Harrison (Chapter 5)

Graph databases work well in helping to find long chained connections, or
complicated patterns and interactions in your data.

**Triple Store:** Subject-Predicate-Object (Subject-Verb-Object). Some
 examples of this are: "Kevin-Owns-Discount Tire" or "Michael-works at-Wendys".
 Each item of information can be represented in this fashion.

 These can be represented as
 * Kevin(Vertex/node)-Owns(Edge/relationship)-Discount Tire(Vertex/node)
 -Database Ref 3: David Mizell

 ## When to not use a graph database?
**Cases where graph databases are NOT a good choice**
* If the data is highly disconnected, and relationships between the data don’t 
  matter (for example, customer transaction data), you don't need a graph 
  database.
* If the requirement is to just store the data and you are using only simple 
  queries, a graph database is not needed.
* If your data structure is fixed and consistent then there is no need of going 
  for graph databases as graph databases are best suited for storing all types 
  of data and changing business needs.
* Graph databases are not suited if you are querying for bulk data scans as they
  are not optimized for such operations.
* If the requirement is to store and retrieve entity properties that contain 
  extremely large values (such as BLOBs, CLOBs, etc), then a graph database is 
  not an ideal solution.
* They do not do well with aggregating data.
-Database Ref 5

 ## When should you use a graph database?
**Cases where graph databases are a good choice**
If you are dealing with highly connected data such as Facebook friend 
connections etc. then you should go for the database as graph databases are 
purposely built to handle the highly connected data.
-Database Ref 5

**Graph Database Use cases**
* Fraud or Anomaly Detection
* Real-Time Recommendations
* Graph-Based Search
* Social Networks
* Machine Learning
* Identity and Access Management, etc.
-Database Ref 5

# Questions
+ I wonder if Graph Databases would be good for documenting relational database
  diagrams? Especially in a datawarehouse with ETL information. It seems like
  you could track data lineage well and store information on all of your models
  as well.