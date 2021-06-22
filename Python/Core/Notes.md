# Definitions

## Class:

+ Classes allows you to bundle data and functionality together. Creating a new class creates a new type of object,
  allowing new instances of that type to be made. Each class instance can have attributes attached to it for maintaining
  its state. Class instances can also have methods (defined by its class) for modifying its state.[Reference](https://docs.python.org/3/tutorial/classes.html)
+ You can think of class like a factory, that is providing default behavior and able to create objects in its image.
  Which it does every time you execute the class name.
  ```python
  class Tweet:
      pass

  a = Tweet()

  a.message = 'I added this attribute'
  print(a.message) # This will print the text from above

  print(Tweet.message) # This will give an error
  ```

  `a` is an `instance object`. These should always start with a lower case character. While `Tweet` is a class obect and
  these should always start with an upper case character.- Instance objects inherit any class attributes. They can also have new attributes added to them.
+ The following code will throw an error if you attempt to run it.
  ```python
  class Tweet:
      def __init__():
          print('Hi')

  a = Tweet()

  # OUTPUT:
  Traceback (most recent call last):
  File "/code/app.py", line 5, in <module>
      a = Tweet()
  TypeError: __init__() takes 0 positional arguments but 1 was given
  ```

  This is because whenever the class object is called, the instance is always passed as the first argument. So
  `__init__` is there to make assignments to instance attributes.
+ **Self** Always refers to the particular instance of the class.
  - If you do not pass self to any following  methods in the class then those methods will only be available through the
    class namespace, and they won't have access to any instance attributes.
    ```python
    class Tweet:
        def __init__(self, message):
            self.message = message
        def print_tweet():
            print(self.message)

    a = Tweet('This will be pased in as my message')

    a.print_tweet()
    ```

    This means that the above code would fail because I did not pass self to the `print_tweet` method.

## Decorator
A decorator takes in a function, adds some functionality and returns it. It is essentially like putting a function in
as the parameter of another function.
+ You can make a decorator to check something.
+ You can add multiple decorators onto one function

## Dunder Methods

Begin and end with a double underscore. Dunder is short for double underscore.These types of methods are called
automatically at certain times. Classes can override most of these methods.

#### __init__() Function:

+ Always executed when the class is being initiated. (Called automatically whenever an instance is created)
+ It initializes attributes of the method
+ Known as the initializer method or constructor method.

## Function
+ A function can take another function as a parameter.


### Asynchronous I/O Python

[Documentation](https://docs.python.org/3/library/asyncio.html)

This should be used for co-routines in python

#### Priming

+ Either: `object.send(None)` or: `next(object)`

#### yield

Can generate values in generator methods and can consume values sent to it.

Example usage

```python
def finder(x):
    while True:
        input_text = yield
        if x in input_text:
            print(input_text)
  
f = finder('python')

f.send(None) # Tihs line primes the generator
f.send('some text including python')
```

#### Generators

Python generators produce data for iteration, while python co-routines consume data

**Expression**

**Dictionaries**

**Lists**

**Module:**
A Python source file, which can expose classes, functions and global variables.

**Package:**
Is a directory of Python module(s)

For example, imagine the following directory tree in `/usr/lib/python/site-packages`:

```
mypackage/__init__.py <-- this is what tells Python to treat this directory as a package
mypackage/mymodule.py
```

So then you would do:

```
import mypackage.mymodule
```

# References
+ [List of Best Practices](https://gist.github.com/sloria/7001839)
+ [Creating an Opensource Python Project from Scratch](https://jacobtomlinson.dev/posts/2021/testing-and-continuous-integration-for-python-packages-with-github-actions/)