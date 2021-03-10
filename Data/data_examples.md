# Data Examples
This document is simply to track different forms of data that I have encountered
for future reference.

## Group Assignment Data
The following two examples of data I encountered when formulating a strategy
for how to handle start and end dates for assigning students to groups.
Essentially we were creating data similar to a type 2 slowly changing dimension,
but it was in a fact table. These are examples of the two types of data we used
to populate the table.

### Finite Change
The first example was assigning a student to an advisor. In this example the
data would come in the following format.


### Continuous Change
The second example we were assigning students to an advising group. (This had
nothing to do with their advisor assignment.) 
**Metadata**
|column|description|
|-|-|
|student_id|Primary key for student|
|group|name of the group the student is assigned to.|
|indicator|Tells whether the student is currently in the group or not. Y = Yes; N = No|
|created|Date the student first entered the group. This value will never be updated|
|updated|Date the indicator column was updated.|
**Example Data**
This example is the same record repeated over and over again with the updates
we would expect to see from the source system.
|student_id|group|indicator|created|updated|
|-|-|-|-|-|
|111|business|Y|12/1/2019|12/1/2019|
|111|business|N|12/1/2019|12/10/2019|
|111|business|Y|12/1/2019|12/20/2019|
|111|business|N|12/1/2019|12/1/2019|