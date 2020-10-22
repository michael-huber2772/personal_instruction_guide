# Virtual Environment

## Normal Virtual Environment

## Pipenv

### Creating Virtual Environment with Pipenv

From within the directory you want to use run the following command. Other 
packages besides django can be installed at this time.
```bash
$ pipenv install Django==3.1.2 --python 3.8
```

#### Creating requirements.txt from pipenv

```bash
$ pipenv lock --requirements > requirements.txt
```