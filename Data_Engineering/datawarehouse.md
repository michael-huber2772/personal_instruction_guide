# Data Warehousing Techniques


## Hierarchies
Different types of hierarchies.
* Balanced  Hierarchy (Standard) - Contains a fixed number of levels.
  * Attribute Hierarchies - a set of mandatory parent-child relationships among 
    subsets of attributes. All attribute hierarchies are balanced.
* Unbalanced (Variable Depth) Hierarchy
  * Instance Hierarchies - relationships between rows of the dimension. These 
    are recursive. Instance hierarchies are usually unbalanced but they won't 
    always be unbalanced. You can use recursive SQL to query these types of 
    hierarchies. You can also flatten the hierarchy or create a bridge table
    to more easily look up or down the hierarchy.
* Ragged

## Data Profile
### Slow Change Data
* Type 1 - Use when history of the data element is not significant. When data in
  your source system changes you simply update the data and overwrite the
  previous value.
* Type 2 - Use when you need to preserve the historic context of facts. When the
  source data changes then a new row is added to the table so the previous
  version remains unchanged.
* Type 3
* Frozen
* Time-stamped dimensions - used for point in time analysis.
* Hybrid Techniques

