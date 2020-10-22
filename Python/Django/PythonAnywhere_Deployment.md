# Python Anywhere Deployment Instructions

## DEPLOYING FROM GITHUB
Once your code is on github follow the steps outlined below.

1. From the root directory in the main console on Python Anywhere clone your
code from github.
```bash
$ git clone <repo URL>
```

Once that is cloned I can `cd` into my directory for the project.

Now I need to create a virtual environment for my project. PythonAnywhere has
a special way to do this so I will include those instructions below.
For PythonAnywhere's full set of instructions visit the following 
[Link](https://help.pythonanywhere.com/pages/Virtualenvs)
```bash
$ mkvirtualenv <virual env name> --python=/usr/bin/python3.8
```
To deactivate the environment just type the command `deactivate` in the console.
To turn use the virtual environment.
```bash
$ workon <virual env name>
```

Once I am on the virtual environment I can install the packages from my
`requirements.txt` file.

```bash
$ pip install -r requirements.txt
```
ADD INSTRUCTIONS  ON HOW TO SETUP WSGI FILE

See my `example_WSGI.py` file in this directory.



Once your requirements are installed you will need to add a .env file to your
project directory. This should be the same location as your manage.py file.

Finally follow the steps outlined [here](https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/) to finish setting them up.



## STARTING AN APP ON PYTHONANYWHERE

## Connecting Database to PGAdmin

```bash
ssh -4 -L 9999:postgres-server-hostname:postgres-server-port username@ssh.pythonanywhere.com
```
postgres-server-hostname= Address
postgres-server-port= Port


## Creating a new Database on PythonAnywhere
```sql
CREATE DATABASE production
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    ;
```


# REFERENCES
* [Python Anywhere Environment Variables](https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/)
* [Deploying Existing Django Application](https://help.pythonanywhere.com/pages/DeployExistingDjangoProject/)
* [Connecting to DB with Pgadmin4](https://help.pythonanywhere.com/pages/AccessingPostgresFromOutsidePythonAnywhere/)