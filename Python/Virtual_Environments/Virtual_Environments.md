# Virtual Environment

## Normal Virtual Environment

## Pipenv
* [Real Python: Pipenv Tutorial](https://realpython.com/pipenv-guide/)
### Creating Virtual Environment with Pipenv

From within the directory you want to use run the following command. Other 
packages besides django can be installed at this time.
```bash
$ pipenv install Django==3.1.2 --python 3.8
```
You can also setup the virtual environment by installing from a requirements.txt
file by running the following in the bash window.
```bash
$ pipenv install -r requirements.txt --python 3.8
```

#### Creating requirements.txt from pipenv

```bash
$ pipenv lock --requirements > requirements.txt
```