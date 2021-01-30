# Django Framework

I have added a copy of a .gitignore file that contains most standard things taht need to be ignored when committing to git.

## Installing Django
Installs the most recent version of Django.
```bash
pip install Django
```


## Starting a Project
```bash
$ django-admin.py startproject <project_name> .
```
Using the "." at the end of the above command will build the project in your current directory.
If you don't use the "." then it will create another folder to contain all your directory files.

At this point you can check and make sure that your project is up and running,
by running the following command in your bash terminal and following the link
that is outputted.
```bash
python manage.py runserver
```

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
In a `.env` file you can add environment variables in the following format.
```
SECRET_KEY='XXXXXXX'
DB_PORT='1111'
```

#### Setting Environment Variables in bash console virutal environment
```bash

```

### Beginning Development

Before anything I want to be connected directory to my database. Add
#### Connecting to Postgres Database
1. First replace the database section of the `settings.py` file with the
   following chunk of code.
```python
DATABASES = {
    'default': {
        'ENGINE': os.getenv('DB_ENGINE'),
        'NAME': os.getenv('DB_NAME'),
        'USER': os.getenv('DB_USER'),
        'PASSWORD': os.getenv('DB_PASSWORD'),
        'HOST': os.getenv('DB_HOST'),
        'PORT': os.getenv('DB_PORT')
    }
}
```
2. Next add the following enironment variables to your `.env` file. Make sure
   to replace the values with values that pertain to your database
```
DB_ENGINE='django.db.backends.postgresql'
DB_NAME='db_name'
DB_USER='db_user'
DB_PASSWORD='db_password'
DB_HOST='db_host'
DB_PORT='db_port'
```
3. If you do not already have one start an app in your Django project. This can
   be done by running the following in your bash window.
```bash
python manage.py startapp <app_name>
```

4. Once your app has been started you should add it to the list of installed
   apps in the `settings.py` file.

5. Once connected and with an app started run your first migration.
```bash
$ python manage.py migrate
```
Next I will add my first application.

#### Adding a new page to the site
#####  1. Add a template for the new page
If this is your first time adding a template to your application you will need
to create folder called `templates` in your application folder. This is the
folder that does not contain the `settings.py` file. If you already have a
templates folder then skip to paragraph 3.

Inside the templates folder you should create another file that is the same name
as your application. `app>templates>app` You don't have to do this the project
will still work if you give it other names. But some people may say it is
Django's naming convention.

If you already have a templates folder then you can create your `.html` file
inside of this folder.

##### 2. Render your template with a view
Once your template is created you need to create a view to render your template.

The view is just a python function that takes in a request and return the
template.

Here are some examples of views you can use to render your template
```python
def home(request):
    return render(request, "portfolio/home.html")
```

##### 3. Creating a URL path
If this is your first time adding a url to this application add a new file in
the application folder called `urls.py` and add the following import statements
and code. If you have already configured your url path. Skip to paragraph 3 to
see example url paths you can add.
```python
from django.urls import path
from . import views

urlpatterns = [
    path('', views.home),
]
```

Again if this is your first time adding this file you need to also add the path
to this file in your main `urls.py` file that can be found in your main folder
that contains the `settings.py` file. It will be setup similar to what you see
above minus the import of the views. You will want to configure it to look like
the following.
```python
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('app.urls')),
]
```
Paragraph 3 ADD EXAMPLE URL PATHS

## Staticfiles, CSS, Images, Javascript
If you will be adding these things to your project in your root directory you 
will want to create a folder called `staticfiles`. Then inside this folder you
can create more folders for the specific items that you are adding.

Watch the following [Video starting at 10 minute mark](https://www.youtube.com/watch?v=pLN-OnXjOJg&list=PL-51WBLyFTg38qZ0KHkJj-paDQAAu9HiP&index=1)
to finish these notes.

## Bootstrap Styling
I know of 3 different ways to work with bootstrap in Django.

1. You can download bootstrap and include the files in your staticfiles 
   directory.
2. You can add the CDN URL's to your html files.
3. You can use the python django bootstrap package. Found [here](https://pypi.org/project/django-bootstrap4/)
`django-bootstrap4`

I am not sure what are the advantages of using the package over just copying
the CDN URLs so I am going to try it out.


# Migrations
You can think of migrations as version control for the database schema
* [Django Migration Documentation](https://docs.djangoproject.com/en/3.1/topics/migrations/)


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


# Third Party Django Applications/Packages
* [Django Packages Site](https://djangopackages.org/) 
* Grappelli
* [Django RA  ERP](https://github.com/ra-systems/django-ra-erp) Can be used to
create business applications, for managing data and resource reporting.
* [Django Slick Reporting](https://github.com/ra-systems/django-slick-reporting)
A reporting engine, to create reports.

## Django CMS Packages that may be useful
* [Mezzanine](https://github.com/stephenmcd/mezzanine) This Looks the most
promising.
* [Wagtail](https://github.com/wagtail/wagtail) Wagtail is an open source 
content management system built on Django, with a strong community and 
commercial support. It's focused on user experience, and offers precise control 
for designers and developers. (THIS MAY BE WHAT I NEED)
* [django-cms](https://github.com/django-cms/django-cms) Widely used content
management system that can be integrated with other apps.
* Compare these with Django cookie cutter.


# REFERENCES
* [PythonAnywhere Environment Variables](https://help.pythonanywhere.com/pages/environment-variables-for-web-apps/)
* [Django Setting Custom ID for a table](https://techstream.org/Web-Development/Custom-Auto-Increment-Field-Django)
* [Django Bootstrap3 Example](https://www.dev2qa.com/django-bootstrap3-example/)
* [Django on Google App Engine](https://medium.com/bluekiri/gae-django-3-0-production-ready-app-using-cookiecutter-in-5-minutes-adb6c35a2b3e)
* [Django ORM if you already know SQL](https://amitness.com/2018/10/django-orm-for-sql-users/)
* [Djanog Wordpress API Article](https://swapps.com/blog/simple-django-wordpress-integration-with-django-wordpress-api-library/)