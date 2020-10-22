# Django Framework

I have added a copy of a .gitignore file that contains most standard things taht need to be ignored when committing to git.

## Starting a Project
```bash
$ django-admin.py startproject <project_name> .
```
Using the "." at the end of the above command will build the project in your current directory.
If you don't use the "." then it will create another folder to contain all your directory files.

Next I want to make sure that my secret key is never committed to version control so I am
going to set up my environment variables now with dotenv. You can install it in your
virtual environment with
```bash
pip install python-dotenv
```

Then I just have to add the following code at the top of my `settings.py` file and
create a `.env` file at the same level as my `manage.py` file or at the same level
as my `settings.py` file

```python
import os

from dotenv import load_dotenv
load_dotenv()
```
As I learn more good settings for a live site I will add them here. For now
the site I generally use for deployment allows me to password protect access
to my site while it is under development.

## Deploying Project
Once I have reached this point in my project, I personally like to deploy to
a live server. Then I will continually add my changes to the live server as I
progress through the project. This allows me to trouble shoot issues on the
server as they come up and not have a bunch of issues to fix at the very end.

Many times I have finished building a website and when I go to deploy so many
things are don't work on the server that I spend countless hours trouble
shooting, or I am not able to get the project live and I have to start over
or find another hosting service.

For the deployment see the deployment instructions for the service you would
like to use.

Make sure to set the `ALLOWED_HOSTS` setting in the `settings.py` file before
deployment.

### Setting Environment Variables

#### Setting Environment Variables in bash console virutal environment
```bash

```

### Beginning Development

Before anything I want to be connected directory to my database. Add
instructions for connecting to postgres....

Once connected I can run my first migration.
```bash
$ python manage.py migrate
```
Next I will add my first application.

### Custom Model/Table ID's
* [Setting ID to start at a certain value](https://stackoverflow.com/questions/117800/how-to-get-django-autofields-to-start-at-a-higher-number)

# REFERENCES
* [PythonAnywhere Environment Variables](https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/)
* [Django Setting Custom ID for a table](https://techstream.org/Web-Development/Custom-Auto-Increment-Field-Django)
* [Django Bootstrap3 Example](https://www.dev2qa.com/django-bootstrap3-example/)