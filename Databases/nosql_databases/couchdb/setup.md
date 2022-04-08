# Setup
Getting this service setup I had to follow the following instructions after
I downloaded the service.

* Search in Windows for `Services` This is an application where  you can see if
  Apache CouchDB is running. When I opened up the properties mine was switching
  from starting to running in an endless loop.
* [Instructions to Fix](https://stackoverflow.com/questions/44107334/couchdb-fails-to-start-after-applying-windows-10-creators-update/44107335#44107335)
* After I replaced the `nssm.exe` file in bin and started the service it said it
  was running but when I opened the properties it was still switching between
  running and starting.

After that I tried to follow these instructions
```
Issue it's happening since the last updates released by Microsoft. I'm not 
completely aware of what's causing it, but I think it's something related to 
CouchDB service not been able to start using Local Administrator rights. However 
I've managed to start the service manually, by doing so:

Open Command Prompt - in the Search from the Start Menu or Task Bar type "cmd"
Run it as an Administrator - right click on the Command Prompt application and 
choose "Run as administrator" option /this is really IMPORTANT as it will allow 
the service to have administrator access/
Navigate to the folder where CouchDB is install - default path is "D:/CouchDB", 
but could be anywhere else; you have to find it
Go to the "bin" folder in there
Type "couchdb" as a command to start the service
You will see a message showing after this - "kernel-poll not supported; "K" 
parameter ignored"
If it adds some error messages after it or closes the whole terminal, you're 
making some things bad from this guide, so follow it strictly.
You can now open up the Fauxton application in the browser like normal from 
here - http://localhost:5984/_utils/
Keep in mind that you have to leave the cmd opened in order the service to be 
working as expected. As far as I saw no information was lost, so it's all good. 
This is a temporary solution though, as we are waiting a relase from either 
Microsoft or Apache to solve the issue, or at least give us more explanation 
about it.
```
These instructions did not work either.

Looks like I found the following [post](https://github.com/apache/couchdb/issues/2680)
and they are having the same issue that I am having. Looks like this issue may
have been fixed.

I found this other [thread](https://github.com/apache/couchdb/issues/3309) that
may be causing my issues. Looks like the last response was from 8 days ago. I 
will need to monitor this because it looks like it is still an ongoing issue.

I finally went back to version 2.3.1 and that one is working.

# Setup within Fauxton
+ First thing go to the `verify` tab and click `Verify Installation` this will
  make sure that the database is up and running correctly.
+ Next go to the `Setup` tab.
  - `Configure a Cluster` - is for running across servers and dealing with a
    large amount of data. You won't need it on a personal computer.
  - `Configure Single Node` - Select this and create a login.