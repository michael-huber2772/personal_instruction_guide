# +++++++++++ DJANGO +++++++++++
# To use your own django app use code like this:
import os
import sys
from dotenv import load_dotenv

project_folder = os.path.expanduser('~/portfolio') # update project path
load_dotenv(os.path.join(project_folder, '.env'))
# assuming your django settings file is at '/home/michaelhuber/mysite/mysite/settings.py'
# and your manage.py is is at '/home/michaelhuber/mysite/manage.py'
path = '/home/michaelhuber/portfolio' # update project path
if path not in sys.path:
    sys.path.append(path)

os.environ['DJANGO_SETTINGS_MODULE'] = 'portfolio.settings' # change portfolio to file containing settings.py file

# then:
from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()