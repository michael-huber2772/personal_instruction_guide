# Pip
Pip allows you to install and uninstall packages within Python.


## Install
```bash
python -m install <package_name>
```

## Uninstall
If you want to uninstall all packages you have installed using pip you can run
the following command.
```bash
pip freeze | xargs pip uninstall -y
```