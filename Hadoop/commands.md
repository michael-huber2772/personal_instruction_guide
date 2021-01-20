# Hadoop Command Line Commands
* Create a file directory
  ```bash
  hadoop fs -mkdir /data
  hadoop fs -mkdir /data/sales
  ```
  This creates a directory named `data` and then within that it creates a
  directory named `sales`.

* Move files into your Hadoop directories
  ```bash
  hadoop fs -put * /data/sales/
  ```