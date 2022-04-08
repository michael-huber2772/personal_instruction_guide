# ArangoDB
Multi-model Database


## AQL Examples

Select all the names from the Students Collection
```aql
FOR x IN Students RETURN x.name
```

Select all the names from the Students Collection who have a gpa greater than 3.5
```aql
FOR x IN Students 
    filter x.gpa > 3.5
RETURN x.name
```

# References
+ [Intro to AQL](https://www.arangodb.com/docs/stable/aql/tutorial.html)