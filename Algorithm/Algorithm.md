# Algorithms
In mathematics and computer science, an algorithm is a finite sequence of 
well-defined, computer-implementable instructions, typically to solve a class of 
problems or to perform a computation. Algorithms are always unambiguous and are 
used as specifications for performing calculations, data processing, automated 
reasoning, and other tasks.


## Recursion
When a function calls itself from within its own code.
```
function f() {
    ...
    f()
}
```
<img src="slides/recursion.jpg" alt="Basic Star" width="600"> 

+ Recursive functions need to have a breaking condition.
+ This prevents infinite loops and eventual crashes.
+ Each time the function is called, the old arguments are saved.
+ This is called the call stack

### Call Stack
<img src="slides/callstack.jpg" alt="Basic Star" width="600">

+ Every time the function repeats it adds a value to the stack until finally the full stack is printed.

### Recursion in Python
```python
def countdown(x):
    if x == 0:
        print("Done!")
        return
    else:
        print(x, "...")
        countdown(x-1)

countdown(5)
```

## Sorting Data
+ bubble sort
+ merge sort
+ quicksorts

### Bubble Sort
+ Compares element 1 to element 2. If the first element is larger than the
  second then the two elements are swapped. Then it will compare element 2 and
  3 and if element 2 is larger than element 3 it will swap them. This will
  continue until the largest value is at the top.

  This is where it gets its name because the values bubble to the top of the
  array.

  Bubble sort has really poor performance and so it won't really be used any
  more.

+ Performance $O(n^2)$ Quadratic
    - For loops inside of for loops are usually $n^2$

### The Merge Sort
* Divide-and-conquer algorithm
* breaks a dataset into individual pieces and merges them
* Uses recursion to operate on datasets
* Performs well on large sets of data
* In general has a performance of O(n log n) time complexity

### The Quicksort
* Divide-and-conquer algorithm, like the merge sort
* Also uses recursion to perform sorting
* Generally performs better than merge sort, O(n log n)
* Operates in place on the data
* Worst case is O(n2) when data is mostly sorted already


## Searching Unordered Data
+ Unordered List Search
+ Ordered List Search

Searching an ordered list is far more efficient then searching an unordered list

+ Binary Search

## Unique Filtering with Hash Tables
+ Hash Table in Python is called a dictionary

## Value Counting with Hash Table
+ Hash table is a two dimensional array with keys and their associated values.
  Each key must be unique but the value can be anything.

## Find Maximum Value with Recursion