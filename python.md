

## Python
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

