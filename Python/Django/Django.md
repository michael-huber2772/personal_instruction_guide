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

#### My Steps for Adding a new page to my site
1. Create URL path
2. Add a view
3. Create HTML page.


## DEFINITIONS
* [Static File Definitions](https://stackoverflow.com/questions/24022558/differences-between-staticfiles-dir-static-root-and-media-root)
    * `MEDIA_ROOT` is the folder where files uploaded using FileField will go.
    Absolute filesystem path to the directory that will hold user-uploaded files.
    * `STATIC_ROOT` is the folder where static files will be stored after using 
    `manage.py collectstatic`
    > The absolute path to the directory where `collectstatic` will collect 
    > static files for deployment. 
    > If the staticfiles contrib app is enabled (default) the collectstatic 
    > management command will collect static files into this directory. 
    > See the howto on managing static files for more details about usage.
    * `STATICFILES_DIRS` is the list of folders where Django will search for 
    additional static files aside from the static folder of each app installed.
    >This setting defines the additional locations the staticfiles app will 
    > traverse if the FileSystemFinder finder is enabled, e.g. if you use the 
    > collectstatic or findstatic management command or use the static file 
    > serving view.



### Custom Model/Table ID's
* [Setting ID to start at a certain value](https://stackoverflow.com/questions/117800/how-to-get-django-autofields-to-start-at-a-higher-number)

# Django Templates/Boilerplat Code
* [AppSpeed Django Templates](https://appseed.us/django)
* [Django Dattaable Template](https://github.com/app-generator/django-dashboard-dattaable)
* [Django Staradmin Template](https://github.com/app-generator/django-dashboard-staradmin)
* [Django Atlantis Dark Template](https://appseed.us/admin-dashboards/django-dashboard-atlantis-dark)
* [Django Corona Dark Template](https://appseed.us/admin-dashboards/django-dashboard-corona-dark)


# REFERENCES
* [PythonAnywhere Environment Variables](https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/)
* [Django Setting Custom ID for a table](https://techstream.org/Web-Development/Custom-Auto-Increment-Field-Django)
* [Django Bootstrap3 Example](https://www.dev2qa.com/django-bootstrap3-example/)
* [Django on Google App Engine](https://medium.com/bluekiri/gae-django-3-0-production-ready-app-using-cookiecutter-in-5-minutes-adb6c35a2b3e)