# PIPENV

# Getting Started
Once pipenv is installed in your version of python you can create your
environment by running one of the following commands. There are more ways than this to create the environment.
```bash
pipenv --python 3.8
```
or
```bash
pipenv --three
```

## Install Packages
To install packages
```bash
pipenv install <package-name>
```
If you create your virtual environment in a directory that already has a requirements.txt file it will automatically
add those requirements to your pipfile. Once added to install the what is contained in the pipfile all you have to
do is run
```bash
pipenv install
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