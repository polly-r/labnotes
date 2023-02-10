

## :computer: Python
Python is one example, of a high level programming language. Programs written in a high level language must be converted into machine code to run. This is either done ahead of time by converting a whole program to machine code with a compiler program (compiling the code), or line by line as the program runs by an interpreter. 
It is mainly used for web development, data analytics, automation and mathematical computing. It has recently been employed in the AI and Machine Learning fields due its readability and ease of use.
With over 415 000 libraries, Python was designed to be highly extensible as it provides tools to many different types of tasks. Python Package Index ([PyPI](https://pypi.org/)) is the official software repository. It carries software developed and shared by the Python community.

Example libraries installation:
```python
!pip install numpy
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

```

## Collections
- List

Are indexed from [0] and are thus ordered and allow duplicates. 
```python
list = [1, 2, 3, 3]
print(list)

> 1, 2, 3, 3
```
- Set

Not indexed so unordered, unchangeable, and do not allow duplicate values.
```python
set = {1, 2, 3, 3, 4, 4, 4}
print(set)

> 1, 2, 3, 4
```


- Tuples

Can have items of the same value but strictly unchangeable. Converting it to a list and changing values is a work around.
```python
tuple = (1, 2, 3)
print(tuple)

> 1, 2, 3
```

- Dictionary

Stores data values in key:value pairs.
It is ordered, changeable (editable) but does not allow duplicates, as every key must be unique.


```python
dict = 
{
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964
  "year": 1958
}
print(dict)

> {'brand': 'Ford', 'model': 'Mustang', 'year': 1958}

# Dict method of creating dictionaries
d = dict(name = "Community", genre = "Comedy", year = "2007")
print(d)

> {'name': 'Community', 'genre': 'Comedy', 'year': '2007'}
```
## Functions
```python
def addition(a, b):
     print(a, b)

```
