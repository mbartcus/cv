---
authors:
- admin
categories:
- functional programming
- python
- loop
- map()
- filter()
- reduce()
date: "2022-11-13T00:00:00Z"
draft: false
featured: false
lastmod: "2022-11-14T00:00:00Z"
projects: []
subtitle: "Replacing loop and optimizing code in python"
summary: "Replace the loops using some of the functional programming techniques"
tags:
- functional programming
- python
- loop
- map()
- filter()
- reduce()
- article
- python
title: Replacement loops with best practices
---

Loops are very expensive (slow) in python, there is why we must avoid them as possible. Instead of them let us think in programming in a functional way. That is very simple. Like functions are some code that can be called in order to return a value or values, the functional programming computation to combine functions that takes arguments and return a concrete value or values as a result.

Programs developed in functional style have fundamental benefits 
 - easier to develop (code every function in isolation)
 - debug and test (debug and test individual functions without looking to the rest of the program)
 - understand (you do not need to deal with the changes throughout the entire program)

When we  are looking to the functional programming we are in general using list, arrays, ... as iterable data to operate throw them. Processing data in a functional style assume using three techniques:
1) mapping - apply a transformation function to one or more iterable to produce a new iterate. The items in the new iterable are produced by calling the transformation function
2) filtering - consist in applying a  [predicate or Boolean-valued function](https://en.wikipedia.org/wiki/Boolean-valued_function) to an iterate to generate a new iterable with items filtered out with a given condition
3) reducing - consist in applying a reduction function to an iterable to produce a single cumulative value

But before going further and understand each of thees techniques let us understand the **lambda** function.

## The lambda function
The lambda function is an alternative to a function, writing functions in one line than can be executed in optimized way (faster with less space in our code). Let us take an example:
```python
def pw_2(x):
	return x**2
```
This is writen in lambda way like:
```python
lambda x: x**2
```

Using lambda function is a very good  alternative to functions in practice.

Here I return to the idea why I started writing this article. The loops are very slow and we use them every time we need to process data. When our data becomes big and the program becomes slow, we start thinking how can we optimize it. The first think to do is to transform every loop in using one of the 3 techniques: map, filter or reduce. Theese are writen in C programming language, that is why it will be gain in efficience and will use less memory.  Let me introduce them, so that we can find easly how to transform the loops using one of the techniques.

## The map() function 

Let us understand how map function is used. The map() function iterates over the items of an iterate input and returns an result after applying some function to every item in the data. Let us see how the function works in action, but first the syntax:

```python
map(function, iterable[, iterable1, iterable2,..., iterableN])
```

Observe the fist think to pass to the map function is a **function object**. This means that we will not pass any arguments to it. No pair of paranthesis will be used here. This function can be
- [built-in functions](https://docs.python.org/3/library/functions.html#built-in-functions), 
- [classes](https://realpython.com/lessons/classes-python/), 
- [methods](https://realpython.com/lessons/mastering-method-types-oop-pizza-example/), 
- [`lambda` functions](https://realpython.com/courses/python-lambda-functions/),  
- [user-defined functions](https://realpython.com/defining-your-own-python-function/).

### Exemple of using map function:

Suppose we want to compute the previous **sq**() function for a list of data. 
```python
data = [1, 2, 3, 4, 5]
```
Writing the function in a standart way:

```python
pw = []
for num in data:
    pw.append(pw_2(num))
pw
[1, 4, 9, 16, 25]
```

Now, let us see how will it looks like when using the map() function:

```python
pw = map(pw_2, data)

list(pw)
[1, 4, 9, 16, 25]
```

Observe that the second type of programming is in a more compact way and more clear. We just say: " compute the **pw_2**() function for every element in data". Now to writing it just in a sigle line, without creating the function, we use the lambda function:

```python
pw = map(lambda x: x**2, data)

list(pw)
[1, 4, 9, 16, 25]
```

Using the **map()** can process multiple input iterables. Passing a function wich needs more iterable to the map function need to have this number of iterable passed. Each iteration of the map function will pass one value from each iterable and will stop when the shortest iterable ends.

```python
first_it = [1, 2, 3]
second_it = [4, 5, 6, 7]

list(map(pow, first_it, second_it))
[1, 32, 729]
```

Let us see how we can use the lambda function over the map.

```python
list(map(lambda x, y: x - y, [8, 10, 12], [7, 8, 10]))
[1, 2, 2]

>>> list(map(lambda x, y, z: x + y + z, [1, 1], [1, 3], [1, 6]))
[3, 10]
```

## The filter() and filterfalse() function

Another technique used in functional programming is the filter function. With **filter()** function we think as for the map function. We apply a filter function to an iterable to produce a new iterable that satisfies a given condition. Filtering operation consist in testing all values in a iterable using a predicate function and retain only the values returning a true result.
**filterfalse()** - does the oposite of the filter() function does.

Here is the syntax for filter function:
```python
filter(function, iterable)
```
Here the difference is that the function returns true or false, this is a boolean valued function. This function plays a role of decision function or filtering function. And like in the map function iterable holds generators or iterator objects like list, set, ...

Let us see an example. Suppose we want to extract all positive numbers from our data
```python
data = [-9, 9, 10, -1, 2, 13]
```

```python
# Using a lambda function
positive_numbers = filter(lambda n: n > 0, numbers)
list(positive_numbers)
[9, 10, 2, 13]

# Using a user-defined function
def is_positive(n):
     return n > 0

list(filter(is_positive, numbers))
[9, 10, 2, 13]
```

## The reduce() function

The reduce function is a little bit different from the previous 2 functions, map and filter. It  implements the mathematical technique called folding or reduction. This means that it will be applied iteratively to all the values of iterable and will return one single cumulative value. The reduce function perform the following steps:
1) apply a function to the first two items in an iterable and generate a partial result
2) use the partial result, together with the third item in the iterable to generate another partial result
3) repeat - repeat the process until the iterable is exhausted and then return a single cumulative value

Let us see the syntax of the reduce function.
```python
from functools import reduce

reduce(function, iterable[, initializer])
```

And an example of the reduce function will look like this:

```python
def adding(x, y):
	return x+y

data = [1, 2, 3]

# Using a user-defined function
reduce(adding, data)
# Using a lambda function
reduce(lambda x,y: x+y, input_list))
```
The two of them results 6.

Using one of the three techniques in python is a nice style programming in functional way. But hey there, we do not forget that a pythonic way also exists. This means using **list comprehension** and **generators**. I would like to introduce them equally in this article because of the importance of using them in python programming, instead of the previous functional programming techniques.

## List comprehension

Let us see the syntax for the list comprehension.
```python
new_list = [expression for member in iterable]
```
where:
 - expression : is a call to a method, or any valid expression that returns a value
 - member : is a object or value in a list of iterable
 - iterable - list set, sequence, generator or any object that returns it's objects one at a time
An example would look like this:
```python
squares = [x ** x for x in range(10)]
```
We can add conditions using list comprehension using the following syntax:
```python
new_list = [expression for member in iterable (if conditional)]
```
or
```python
new_list = [expression (if conditional) for member in iterable]
```

An example would be:
```python
original_prices = [-1.35, -6.25, 3.12, 8.48, -2.22, 3.16]
>>> prices = [i if i > 0 else abs(i) for i in original_prices]
>>> prices
[1.35, 6.25, 3.12, 8.48, 2.22, 3.16]
```

Example of **filter()** function using the list comprehension:
```python
# Generating a list with filter()
list(filter(function, iterable))

# Generating a list with a list comprehension
[item for item in iterable if function(item)]
```

### Generator expression
Another natural replacement for one of the three techniques introduced before is the general expression. We observe that the map object is an iterator that yields items on demand, and generator expressions returns generator objects on demand. To turn a list comprehension to a generator we replace [] by (). With generators we write code that will be creaner to read.


```python
en_exp = (square(x) for x in numbers)
gen_exp
<generator object <genexpr> at 0x7f254e056890>
list(gen_exp)
```

or more simple

```python
list(square(x) for x in numbers)
```

Let us see how to use generators in place of filter function.

```python
list(filter(function, iterable))
# Use a generator expression
even_numbers = (number for number in numbers if is_even(number))
even_numbers
<generator object <genexpr> at 0x7f586ade04a0>
list(even_numbers)
```


