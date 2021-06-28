# Data Engineering Notes

+ Change Data Capture (CDC) - Software design patterns that are used to
  determine and track the data that has changed so that action can be taken
  using the changed data. (Relates to Data Engineering)

+ **Cloud**: Refers to servers that are accessed over the internet, and the
  software and databases that run on those servers.

# DATA ENGINEERING NOTES



## DATA MART/DATA WAREHOUSE STRUCTURE
"The data we use for business intelligence can be divided into four
categories: measures, dimensions, attributes, and hierarchies. These four
types of data help us to define the structure of the data mart. Let’s look at
each of these types of data and see how they are stored in the data mart."
[Ref 3](#ref3) (pg.30)

### Measures/Facts
Measure - "is a numeric quantity expressing some aspect of the organization’s
performance. The information represented by this quantity is used to support or
evaluate the decision making and performance of the organization. A measure
can also be called a fact." [Ref 3](#ref3)(pg.30)

### Dimensions
"Total sales is an example of a measure that is often required for effective
decision making. However, it is not often that decision makers want to see one
single aggregate representing the total sales for all products for all
salespersons for the entire lifetime of the organization. Instead, they are
more likely to want to slice and dice this total into smaller parts.
Dimensions are used to facilitate this slicing and dicing." [Ref 3](#ref3)
(pg.30)

Dimension - "A dimension is a categorization used to spread out an aggregate
measure to reveal its constituent parts"[Ref 3](#ref3) (pg.30)

### Attributes

### Hierarchies


## FACT TABLES
Fact tables present the facts and include surrogate keys that refer to each of
the associated dimension tables.

The columns in a fact table should store the facts we want to be tracked. For
example in an order fact table. You could have the columns `quantity_ordered`,
`cost_dollars`, and `order_dollars` as the facts to be tracked. You could then
also include the surrogate keys of the dimension tables to relate the two.
[Ref 2](#ref2) (pg. 12)
## DIMENSION TABLES

### Types of Dimensions
* Swappable Dimensions
    * "A member of a group of dimensions that organize attributes based on a
      defining type." [Ref 1](#ref1)
    * Examples
        * customer_dim, customer_organization_dim, customer_person_dim
        * dim_person, dim_student, dim_employee (I believe would be examples
          from the College Warehouse. But I need to verify this.)

## DESIGNING A DATA MART/DATA WAREHOUSE
For the best example and guide to designing a data warehouse with step by step
instructions, I would refer you to Chapter 6 of Brian Larson's book
Delivering Business Intelligence with Microsoft SQL Server 2016 4th Edition.
I am going to outline the suggested steps here and these may change as I learn
the most efficient way to do it in my own work. But Brian Larson takes an
actual manufacturing data set and walks you through the design process of
taking multiple data sources and combining them into a design that can be used
to provide business intelligence.

1. List the data requirements for effective decision making. (You may not be
    able to answer every question with the data currently available. But it
    will allow you to see what data is missing and make plans of how to
    collect it for the future.) [Ref 3](#ref3) (pg.99)
    Examples from book:
    * Number of accepted products by batch, by product, by machine, by day
    * Elapsed time for molding and hardening by product, by machine, by day
    * Day rolls up into month, which rolls up into quarter, which rolls up
    into year
2. Prepare a list of measures provided by the business user. Along with the
OLTP field that they relate to.

| Measure                     | OLTP Fields   |
|-----------------------------|---------------|
| Number of accepted products | Reject Flag   |
| Elapsed time for painting   | Not Available |

3. Resolve any problems with information that is unavailable. That may be
reducing the number of measures included or changing them for a similar metric
you do have data for.
4. Add data types and calculations to the list.

| Measure | OLTP Fields | Data Type | Formula |
|-|-|-|-|
| Number of accepted products | Reject Flag | Int | Count when reject flag is false |
1. Prepare a list of dimensions

... Finish filling this information out.

## DEFINITIONS

* Data Mart -  "is a body of historical data in an electronic repository that
does not participate in the daily operations of the organization. Instead,
this data is used to create business intelligence. The data in the data mart
usually applies to a specific area of the organization." [Ref 3](#ref3)

(In the below text I will be referring to a "data mart" and a "data warehouse"
interchangeably. I am including data mart here because in the book by Brian
Larson he refers to the structures as data marts because he sees data
warehouses as the following: "Data warehouses tend to be large,
onestop-shopping repositories where all the historical data for the
organization
would be stored. Nothing is wrong with this as a concept; however, attempting
to create a data warehouse often led to huge, multiyear technology projects
that
were never quite finished or were outdated when they finally did get done. In
this book, we concern ourselves with creating data marts—smaller
undertakings that focus on a particular aspect of an organization.")

* Dimension - "A dimension is a categorization used to spread out an
aggregate measure to reveal its constituent parts"[Ref 3](#ref3) (pg.30)

* Measure - "is a numeric quantity expressing some aspect of the
organization’s performance. The information represented by this quantity is
used to support or evaluate the decision making and performance of the
organization. A measure can also be called a fact." [Ref 3](#ref3)(pg.30)

## Cloud Hosts
* [Hostinger website host](https://www.hostinger.com/)
* [Postgresql Hosting](https://www.hostingadvice.com/how-to/free-postgresql-hosting/)
One website mentioned that mysql is generally the most highly supported
database for online hosting.

# Resources
* [Oreilly: Data engineering: a quick and simple definition](https://www.oreilly.com/content/data-engineering-a-quick-and-simple-definition/)  
* [Building Data Pipelines with Python](https://learning.oreilly.com/videos/building-data-pipelines/9781491970270)

# References
<a name ="ref1"> 1. [O'Reilly: Agile Data Warehouse Design, By: Michael Blaha, ISBN: 9781771374095](https://www.oreilly.com/library/view/agile-data-warehouse/9781771374095/)
</a>    
<a name ="ref2"> 2. The Complete Reference Star Schema, By: Christopher Adamson
</a>
<a name ="ref3"> 3. Delivering Business Intelligence with Microsoft SQL
Server 2016 4th Edition, By: Brian Larson
</a>