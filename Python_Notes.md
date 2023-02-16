

## :computer: Python
Python is one example, of a high level programming language. Programs written in a high level language must be converted into machine code to run. This is either done ahead of time by converting a whole program to machine code with a compiler program (compiling the code), or line by line as the program runs by an interpreter. 
It is mainly used for web development, data analytics, automation and mathematical computing. It has recently been employed in the AI and Machine Learning fields due its readability and ease of use.
With over 415 000 libraries, Python was designed to be highly extensible as it provides tools to many different types of tasks. Python Package Index ([PyPI](https://pypi.org/)) is the official software repository. It carries software developed and shared by the Python community.

Example libraries installation:
```python
!pip install numpy # %pip install numpy on MacOS
!pip install geopandas
!pip install fuzzywuzzy
!pip install matplotlib
```
Example libraries import:
```python
import geopandas as gpd
import plotly.express as px
import numpy as np, 
import matplotlib.pyplot as plt
import pandas as pd
import geopandas as gpd
```

```python

## Reading a csv, shp, json
    #CSV file
    df = pd.read_csv("path", sep=',')

  - #Shapefile
    df = gpd.read_file("path")

  - #json
    df = pd.read_json("path")
```


## Variables
Allow us to store values for future use.
```python
#Examples of variables
some_list = [1, 2, 3]
x, y = 1, 2
```

## Expressions
```python
5/2       
> 2.5     # division
5//2 
> 2       # floor division
5%2 
> 1       # modulo
5**3
> 25      # exponential

#Rounding
import math
x = math.ceil(1.4)
y = math.floor(1.4)

print(x) # returns 2
print(y) # returns 1
```

### 1. Logical

1. and
2. or
3. not

### 2. Conditional
```python
name = "Zakki"

if name == "Zakki":
      print("Correct")
elif name != "Amy":
    print("Not Amy")
else:
     print("Not Zakky, probably Amy")

> Correct

if "oza" in "Kartoza":
    print(True)

> True
```

## Loops
```python
for i in range(0,3):
    print(i)

> 0
> 1
> 2

for name in ["Zakki", "Amy"]:
    print(name)

>Zakki
>Amy

#range(start, end, step)
for i in range(3, 100, 3):
    print(i)

> 
# Print every car class for every make
class = ["sedan", "SUV"]
make = ["Merc", "Audi"]

for x in class:
  for y in make:
    print(x, y)

> sedan Merc
> sedan Audi
> Suvi Merc
> SUV Audi

# While loop that prints, for loop that does the same.
#While
name_list = [""]
idx = 0
while idx < len(name_list):
  print(name_list[idx])
  idx += 1

#For
for name in name_list:
  print(name)
```

## Collections
- List

Are indexed from [0] and are thus ordered and allow duplicates and appendages. 
```python
> list = [1, 2, 3, 3]
> print(list)
> print(list[-2:])
> print(list[0:2])
> print(list[0::2])

[1, 2, 3, 3]
[3, 3]
[1, 2]
[2, 3]
```
- Set

Not indexed so unordered, unchangeable, and do not allow duplicate values.
```python
> set = {1, 2, 3, 3, 4}
> b = {1,2}
> print(set)
> print(set.add(5)) # It will add but 
> print(set.union(b))
> dir(set) # Shows the available functions

1, 2, 3, 4
1, 2, 3, 4, 5


```


- Tuples

Can have items of the same value but strictly unchangeable. Converting it to a list and changing values is a work around.
```python
tuple = (1, 2, 3)
print(tuple)

> 1, 2, 3
```

- Dictionary

Stores data values in key:value pairs. It is by far the most used of the collections.
It is ordered, changeable (editable) but does not allow duplicates, as every key must be unique.


```python
> dict = 
{
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
  "year": 1958
}
> print(dict)
{'brand': 'Ford', 'model': 'Mustang', 'year': 1958}

# Dict method of creating dictionaries
> d = dict(name = "Community", genre = "Comedy", year = "2007")
> print(d)
{'name': 'Community', 'genre': 'Comedy', 'year': '2007'}
```

## Error Handling
This helps us fix problems that occur as a result of user input or incorrect logic. This prevents breaks in the code that may shut down the programme.

In the **'try'**  block, we type the code that is prone to error in the hope that the **'except'** block will pick up on the error and handle it more gracefully. The **'else'** block is for the event that there is no error while in **'finally'** will be executed regardless of whether the error occurred or not.

```python
lat = 'text'

try:
  lat = input('Latitude: ')
except Exception: #Exception catches all errors
  print('Error')
else:
  print('No error bro.')
```

## File Handling
```python
f = open('file.txt') # By default, it opens using read. It opens but is not editable.

"r" - read   
"c" - create
"a" - append: f = open('file.txt','a')
              f.write('new content')

"w" - write:  f = open('file.txt','w') # Overwrites existing file content
              f.write('new content')

# Loop through file
f = open('file.txt','w')
for i in range(10):
  f.write(f'{i}\n')
```

## Functions
```python
> def addition(a, b):
     return(a + b)

> sum = addition(1, 2) # Fixed argument i.e. it requires all arguments
> print(sum)
3

> def addition(a = 0, b = 0): # Non-fixed
     print(a + b)
> addition(2) # It assigns a = 2 while b = 0 since no different argument is inputted
2
```
## Classes

```python
class Human:
  x = 2

    def __init__(self, name, age):
      self.name = name
      self.age = age

    def __str__(self): # Useful for printing just the object itself
      return f'{self.name}, {self.age}

    def eat(self, food): # Add another object
      print("I'm eating " + food)

> zakki = Human('Zakki', 16)
> print(zakki)
> zakki.eat('pizza')
```
