# PYTEST

## Pytest Bash Commands
* `pytest` will search for test itmes in your project and run them.
* `pytest -v` the -v stands for verbose.

## Pytest Fixtures
You can use fixtures to replace setup and tear down functions.

So for example for testing the user interface of a django site. I can use
selenium to pull up a browser, and when I am done I need to close that browser.
So to avoid writing the code to open and close the browser multiple times I can
write the following code.

```python
import pytest
from selenium import webdriver

@pytest.fixture(scope="module")
def driver():
    driver = webdriver.Firefox()
    yield driver
    driver.quit()

def test_homepage(driver):
    driver.get(os.getenv('HOMEPAGE'))
    expected = 'Django'
    assert expected in driver.title
```

Here I define the `driver` function and then add the `@pytest.fixture()` above
it to allow me to use it in other function tests that I define. Then when
I want to test that my homepage exists. I pass my driver fixture into the
`test_homepage` function.

Now fixtures in pytest can be used for many things. One example would be setting
up a connection to a database. Then you could pass that fixture to other test
functions that need to connect to the database. But every time you pass the
fixture to a new function, it is going to make a new connection, which could
be inefficient. So pytest offers scopes that you can set to control how many
times a fixture will be executed.

(Ref 1) "Pytest fixtures have five different scopes: function, class, module, 
package, and session."

### Function = default scope

### Module 



# References
1. [Understand 5 Scopes of Pytest Fixtures](https://medium.com/better-programming/understand-5-scopes-of-pytest-fixtures-1b607b5c19ed)