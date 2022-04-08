# Nifi
Starting Nifi on Windows

Navigate to the bin folder in your nifi installation and double click the 
`run-nifi.bat` file

To shut down NiFi, select the window that was launched and hold the Ctrl key 
while pressing C.

Now that NiFi has been started, we can bring up the User Interface (UI) in order 
to create and monitor our dataflow. To get started, open a web browser and 
navigate to http://localhost:8080/nifi. The port can be changed by editing the 
nifi.properties file in the NiFi conf directory, but the default port is 8080.

### Changing the port
Open the file `conf/nifi.properties` and change the following value 
`nifi.web.http.port=8080`
You may need to open up the port on your computer.


# References
+ [Download Nifi](https://nifi.apache.org/download.html)
+ [Installation Guide](https://nifi.apache.org/docs/nifi-docs/html/getting-started.html#downloading-and-installing-nifi)
+ [Nifi Admin Guide](https://nifi.apache.org/docs/nifi-docs/html/administration-guide.html)