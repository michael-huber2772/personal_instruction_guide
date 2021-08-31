# Data Warehousing Methods

## Methodologies
+ Bill Inmon's Top-Down Atomic Data Warehouse
+ Ralph Kimball's Bottom-Up Dimensional Data Warehouse
+ Data Mesh

## Types of Data Warehouses
+ Enterprise Data Warehouse (EDW): Centralized
+ Operational Data Store (ODS):
+ Data Mart: Subset of a data warehouse. Generally designed for a specific part of the business. E.g. Sales, finance
+ Hub-and-spoke Data Mart
+ Distributed Data Warehouse

## Definitions
+ Data Warehouse:
  - Inmon's Definition: subject-oriented, non-volatile, time-variant and integrated data source.
    * Subject-Oriented – the data is organized so that the data, related by subject area, is linked together
    * Non-Volatile – once data is entered it is never updated or deleted; all data is retained for future reporting    
      needs.
    * Time-Variant – because of the non-volatile nature of the data and the need for time-based reporting, once data is 
      entered into the warehouse it cannot be modified, new records must be added to reflect the changes in data over 
      time.
    * Integrated – data is sourced from most to all of the enterprise’s information systems and organized in a  
      consistent and unified manner.
    Inmon then creates data marts, subject or department focused subset of the data warehouse, which is designed to 
    address the data and reporting needs of the targeted subset of business users.
  - [Guru 99 Definition:](https://www.guru99.com/data-warehousing.html) Process for collecting and managing data from
    varied sources to provide meaningful business insights. Used for data analysis and reporting.

## Integration Approaches
Taken from the following [tutorial](https://www.tutorialspoint.com/dwh/dwh_data_warehousing.htm)
+ Query driven approach: 
  - Traditional Approach for integrating heterogeneous databases
  - Process:
    * Query  issued on client. Metadata dictionary translates the query into an appropriate form.
    * Now queries are mapped and sent to query processor
    * Results from the different sites are integrated into a global answer set. 
+ Update-driven Approach:
  - Most common approach
  - Information from multiple sources are integrated in advance and are stored in a warehouse.

# References
1. [Data Warehouse Design Methodologies](https://www.nuwavesolutions.com/dw-design-methodologies/)
2. [Guru 99](https://www.guru99.com/data-warehousing.html)
3. [Comparison of Data Warehousing Methodologies](http://people.cs.aau.dk/~tdn/itev/uploads/media/a_comparison_of_DW_methods.pdf)
4. [Data Warehousing Tutorials Point](https://www.tutorialspoint.com/dwh/dwh_data_warehousing.htm)
5. [Data Mesh Principles](https://martinfowler.com/articles/data-mesh-principles.html)