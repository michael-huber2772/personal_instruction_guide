# Connecting to Quickbooks from Python
Once you have the ODBC driver setup for quickoobks you can use the following
link to find out how to connect to quickbooks. [Link](https://support.flexquarters.com/esupport/index.php?/Knowledgebase/Article/View/2738/44/qodbc-desktop-how-to-connect-to-qodbc-using-python)

Quickbooks is a 32 bit program and my computer is a 64 bit system so the first
time I attempted to connect using the `Quickbooks Data` DSN it gave me the
following error.
```bash
$ python app.py
Traceback (most recent call last):
  File "app.py", line 3, in <module>
    cn = pyodbc.connect('DSN=QuickBooks Data;')
pyodbc.Error: ('IM014', '[IM014] [Microsoft][ODBC Driver Manager] The specified DSN contains an architecture mismatch between the Driver and Application (0) (SQLDriverConnect)')
```
In order to correct this error I used the following [article](https://qodbc.com/64-bit-connections/)
To setup a 64 bit connection using the `QuickBooks Data 64-Bit QRemote`
connection. Once I added the correct IP address for this then the connection
worked perfectly and I was able to import the data into python.

* You can run queries against the quickbooks data using the program VB Demo.
* It appears that quickbooks uses SQL Server


# References
+ [Quickbooks SDK](https://developer.intuit.com/app/developer/qbdesktop/docs/develop/exploring-the-quickbooks-desktop-sdk)