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

# Setting up you Postgres Database on Python Anywhere
If you have developed out your website to the point you are using a database,
you can follow the following instructions to setup your database on Python
Anywhere.

Just jump down to the section "Creating a new database on Python Anywhere"

## STARTING AN APP ON PYTHONANYWHERE
Now it is time to start an app.

Here are the instruction that Python Anywhere provides on how to do this.
[Deploying Existing Django Application](https://help.pythonanywhere.com/pages/DeployExistingDjangoProject/)


## Deploying Static Files
Set the following two variables in your settings.py file.
```python
STATICFILES_DIRS = [
    os.path.join(BASE_DIR, 'static')
]

STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
```
Here is another configuration for your static settings as well.
```python
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.9/howto/static-files/
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATIC_URL = '/static/'

# Extra places for collectstatic to find static files.
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'core/static'),
)
```
once these two values are set you can run the following command in the bash
terminal.
```bash
$ python manage.py collectstatic
```
This will collect all the static files into one directory.

After this is done you can push your changes to github and then pull them to
the Python Anywhere server. Then you just have to go  into the "Web" tab
of Python Anywhere and set the URL and directory for static files.

Here are the [Instructions](https://help.pythonanywhere.com/pages/DjangoStaticFiles/)
Python Anywhere provides for setting this up.




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
* [Main Python Anywhere tutorial I followed](https://www.youtube.com/watch?v=SCoGwHCNXVw)
* [Django App on PythonAnywhere Tutorial](https://www.youtube.com/watch?v=Y4c4ickks2A)
* [Python Anywhere Environment Variables](https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/)
* [Deploying Existing Django Application](https://help.pythonanywhere.com/pages/DeployExistingDjangoProject/)
* [Connecting to DB with Pgadmin4](https://help.pythonanywhere.com/pages/AccessingPostgresFromOutsidePythonAnywhere/)  
* [JS Fiddle Code Templates](https://jsfiddle.net/ivanov11/hzf0jxLg/)
* [Connecting to PythonAnywhere Postgres dB using SSH](https://arduino103.blogspot.com/2015/07/introduction-hebergement-python.html)
