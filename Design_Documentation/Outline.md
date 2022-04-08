# Design/Maintenance Outline
As I study and grow in my career I have seen many ways of managing a project to ensure quality in the end product and
a timely completion. This directory of documents is my own personal constantly changing template for managing products
while ensuring to deliver a high quality product.

As teams grow enforcing bests practices and ensuring data quality, and creating standardized workflows becomes more
complex. An antidote to this complexity is **abstraction**. For data engineering you can enforce rules by identifying
and automating ETL pattersn that are common in peoples' workflows, and creating a data engineering framework.


---
# Design/Development Template
## Define Scope
+ Meet with business users to record their requirments
+ Note down business rules

## Data Exploration (Refer to Design_Documenation Notes)
+ Use this phase to explore the data and record accurate assumptions that can be used in your design. This is a time
  when you should try and test the data to make sure it complies with the business rules outlined in the previous step.
+ Once you have assumptions you can test those assumptions using hypothesis testing.
    - Use Z-test in your hypothesis testing
+ Identify problems with the data and fix those problems
  + [ ] Add Common problems and solutions to those problems here.
+ Employ data quality checks early in the exploratory process.

## Design

---
## Important Metrics
+ Pipeline Metrics/Application Metrics
  - Quality Metrics
+ Process Metrics
+ IT Metrics
+ People Metrics

### Process Metrics
+ Estimation Accuracy
+ Scope Variance
+ Schedule Variance
+ Productivity (hrs worked vs hrs billed)
+ Order processing time
+ Response time to RFQ (Request For Quote)
+ Product development Cycle Time
+ Prodcut Development Cost
+ On time delivery

### Quality Metrics
+ Supplier Defect Rate: How many errors are in the source data?
+ Final Product Defect Rate: How many errors are in the final data set?
+ Customer/End User Satisfaction
+ Number of Revisions

### IT Metrics
+ Computer/Software Uptime
+ Preventative Maintenance

### People Metrics
+ Hours Spent Studying: You could set a cap of 1 day a month or 1 hour a week. But this is a great way to keep them 
  engaged. It can be specified the study must benefit the business.

---
# Testing

## SQL/Database Testing
  1. Testing the DAO (data access object) class, making sure it's correctly marshaling the values/parameters being passed to the database, and correctly marshaling/transforming/packaging results retrieved from the database.
  In this case, you don't need to connect to the database at all; you just need a unit test that replaces the database (or intermediate layer, eg., JDBC, (N)Hibernate, iBatis) with a mock.
  2. Testing the syntactic correctness of (generated) SQL.
  In this case, because SQL dialects differ, you want to run the (possibly generated) SQL against the correct version of your RDBMS, rather than attempting to mock all quirks of your RDBMS (and so that any RDBMS upgrades that change functionality are caught by your tests).
  3. Testing the semantic correctness of your SQL, i.e, that for a given baseline dataset, your operations (accesses/selects and mutations/inserts and updates) produce the expected new dataset.
  For that, you want to use something like dbunit (which allows you to set up a baseline and compare a result set to an expected result set), or possibly do your testing wholly in the database, using the technique I outline here: [Best way to test SQL queries.](https://stackoverflow.com/questions/754527/best-way-to-test-sql-queries/754570#754570)
---
# References
+ [Engineering Metrics](http://ryeok.com/blog/2014/2/1/5-key-metrics-for-engineering-departments)
+ READ MORE [A Beginners Guide to Data Engineering](https://medium.com/@rchang/a-beginners-guide-to-data-engineering-the-series-finale-2cc92ff14b0)
+ [OKR Objectives and Key Results](https://en.wikipedia.org/wiki/OKR)
+ [SQL Testing](https://stackoverflow.com/questions/1217736/how-to-write-unit-tests-for-database-calls)
+ [One way to test SQL queries.](https://stackoverflow.com/questions/754527/best-way-to-test-sql-queries/754570#754570)