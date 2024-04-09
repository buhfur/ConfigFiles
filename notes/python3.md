
# Python packages 

On linux , python packages are stored in 

`/usr/local/lib/pythonx.xx/dist-packages`


These are packages installed on your local system.

# Create virtual environment

To create a virtual environment for packages , do. 

``

# Put dictionary keys in list 

```
a = {'key1' : 'value1', 'key2': 'value2' }  

a_list = [*a] # Putting asterisk key before dict gets all keys

print(a_list)

['key1', 'key2']

```

# Print out dictionary values 

```
a = {'key1' : 'value1', 'key2': 'value2' }  


```

# Detect OS platform 

```
import sys


if sys.platform.startswith("linux"):
    print('on linux')

elif sys.platform.startswith("win32"):
    print('on windows')

```

# Print out parent directory of Path object


```
import pathlib

path = pathlib.Path('/home/user/Downloads')

print(path.parent)

```

OUTPUT : 

`/home/user`


# Determine if you are in a certain directory , for example "Downloads"

```
import pathlib 

path = pathlib.Path('/home/user/Downloads')

if pathlib.PurePath(path).match("Downloads") : 
    print('path leads to /home/user/Downloads')

```

# Basic beautiful soup example 

```
from bs4 import BeautifulSoup

html_doc = requests.get(url)

soup = BeautifulSoup(html_doc, 'html.parser')

```
