# PIPENV

# Getting Started
Once pipenv is installed in your version of python you can create your
environment by running the following command.
```bash
pipenv --python 3.8
```

To install packages
```bash
pipenv install <package-name>
```

To start working in the virtual environment
```bash
pipenv shell
```

### Creating a requirements.txt File
```bash
$ pipenv lock --requirements > requirements.txt
```
## Deactivate Virtual Environment
```bash
exit
```

## Remove Virtual Environment
```bash
pipenv --rm
```