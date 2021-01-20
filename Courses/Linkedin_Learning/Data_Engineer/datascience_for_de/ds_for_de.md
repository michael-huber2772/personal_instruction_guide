# Data Science Foundations: Data Engineering
<img src="slides/data_hub.jpg" alt="Data Hub" width="600">

Data Engineers are responsible for the Data Hub and all the lines going in and
out of the data hub.

## Data Hub


#### Back Office
* Staging - This is where untransformed data is stored. In my current role at 
  SLCC, this would be similar to our data stores.
* Cleansing
* Conforming

#### Front Office
* Delivered
* Here we generally build Star Schemas or Data Marts.

### Star Schema Components

#### Facts
* Subject of Analysis
* Numerical
* Atomic Grain
* Multiple Types - Generally these are just event logs of things that have 
  occurred.
* Additive and Semi-Additive

#### Dimensions
* Context of Analysis
* Textual (Most Often)
* Slowly Changing
* Contain Most Attributes
* Slice and Dice - Using a dimension value to filter the data.

<img src="slides/star.jpg" alt="Basic Star" width="600">   

Sales - Is the Fact. Then all the blue boxes surrounding it are the dimensions.

## Data Engineering Responsibilities
* Data Ops Tasks
    * Infrastructure
    * Availability/Performance

* Data Prep
    * Staging, Cleansing, Conforming, Delivering

* Data Interfaces
    * APIs
    * Query Tool Compatibilty

## Data Pipelines
What are the components of a good data pipeline

1. Stage
    * Data Profiles
    * Row Counts
    * Quality Checks
        * Percentage of Null values  in a columns
2. Cleanse
    * Error Logging
    * Notifications
    * Rollback - Pipeline should be able to rollback any changes it make that
      can cause a failure down the line.
3. Conform
    * Go/No Go Check - Determine if it is safe to proceed. You could look at the
      errors that have been logged and any errors from the stage or cleanse 
      phase.
    * SMS Notifications
    * Quality Checks - If these fail perform a rollback.
        * You could check overall sales figures, website traffic or any other
          important stats. If the stats are outside two standard deviations of
          a 4 week moving average they could be wrong. (Know your data).
4. Deliver
    * Automated Rollback - If the data is deemed to be wrong in the quality 
      checks, you should delete the updates rollback the changes and notify
      everyone involved with the data. Especially the users to let them know
      there is a delay in the daily processing of your jobs.

**Warning** There is no way to build a system that will follow these data
pipeline steps from the start. If you attempt to do this it will take you far
to long to build something that will allow your users to get value out of the
data.
Instead you should plan for all the checks and controls you want to have in 
place, then you can strategically add them over time to protect  your users.


# Setting Up the Environment
1. [Virtual Box VM Manager](https://www.virtualbox.org/wiki/Downloads)
   Download virtual box and install it.
2. Next we will be running in Cloudera with their sandbox 5.8. [Link](https://goo.gl/Mmc7Kf)

[Windows Setup Instructions](http://www.vmwareinsight.com/Articles/2020/6/5803025/How-to-install-Cloudera-On-VirtualBox-In-Windows)

More instructions https://teradatatech.blogspot.com/p/start-your-learning.html

[New Sandbox Potentially](https://www.cloudera.com/downloads/hortonworks-sandbox/hdp.html)
I am going to try this old version first.
https://docs.cloudera.com/documentation/enterprise/release-notes/topics/cdh_vd_cdh_download.html

### Download Links
Download Location: https://downloads.cloudera.com/demo_vm/virtualbox/cloudera-quickstart-vm-5.12.0-0-virtualbox.zip
 
Download Location: https://downloads.cloudera.com/demo_vm/vmware/cloudera-quickstart-vm-5.12.0-0-vmware.zip
 
Download Location: https://downloads.cloudera.com/demo_vm/kvm/cloudera-quickstart-vm-5.12.0-0-kvm.zip
 
Download Location: https://downloads.cloudera.com/demo_vm/docker/cloudera-quickstart-vm-5.12.0-0-beta-docker.tar.gz

I got Cloudera UP and working. Once inside the virtual machine. To access my 
files that I have mounted from my machine I need to do the following.
1. Open the terminal
2. Type the following command
    ```bash
    sudo gedit /etc/group
    ```
3. This will open a file that I can edit and add my permissions. At the very
   bottom of the file look for `vboxsf` after the number listed add the user
   `cloudera` and then save the file and restart the machine.


# Getting Started
1. Launch the HUE UI (Hadoop User Interface)
  username: Cloudera
  password: Cloudera
  (sidenote for the horton works sandbox it is `maria_dev` for both of those.)
2. Then you can choose the query editor that you want to use.
3. Next open the `2_1.sql` script and the terminal and begin typing out the
   commands listed there to create the directories to store your information.
4. Next look for the line that installs csv serde. This just makes it so Hive
   can read csv files. This will be done inside the user interface.
5. Go to the file browser in the user interface and then select upload a file.
   Then select the jar file from my setup files to upload.
6. Then run the `add` command in the Hive query editor.



# Loading and Profiling the Data
1. Create staging environment
2. Upload Sales data
3. Do simple row count audit

You can get to the exercise files on the Cloudera machine with the follow 
command.
```bash
cd /media/sf_exercise_files/
```

# Data Quality Testing
1. Identify blank values
2. Find missing locations
3. Check for invalid dates
`2_2.sql`
* With Hive the csv loader can't handle nulls, so it loads blank values.

# Adding Data Types
<img src="slides/add_data_types.jpg" alt="Basic Star" width="600">  

* 3_1.sql file
1. Create the new table with updated data types
2. Copy the data in from our staging table
  * If the query has any problem converting any of the column data types that
    column will most likely be full of Null values. In this instance we know 
    some columns will be NULL. This is why we put data quality checks in place
    before we convert the data.
3. Finally we do a row count as a check for our audit table
  * This helps if something goes wrong in processing you can go back and check
    how many rows made it.

# Handling Missing Values
<img src="slides/missing_values.jpg" alt="Basic Star" width="600"> 

* 3_2.sql excercise file
* `insert overwrite` replaces the data from the filter clause in the table 
  specified.

# Verifying Addresses
<img src="slides/verify_address.jpg" alt="Basic Star" width="600">

* 3_3.sql
  * I got the following error when trying to run the query to find all rows
    where city or state differ. 
    `FAILED: Execution Error, return code 2 from org.apache.hadoop.hive.ql.exec.mr.MapredLocalTaskI`
   From the comments they said it would work when switched to an inner join.
   Then someone said to run the following command in the query window for hive
   and the left join should work.
   `set hive.auto.convert.join=false;`

   # Performing Master Data Lookups
   <img src="slides/mdl.jpg" alt="Basic Star" width="600">

   * Our cleansed_sales table does not have client_ids.
   * 4_1.sql
   * The lookup is performed with a join between the two tables.

   # Handling Inferred Members
   * When there are not dimension records for the associated event record we
     call these Inferred Members.
  
  **Inferred Members**
  When new dimensions appear prior to existing in the lookup table

  <img src="slides/inferred_member.jpg" alt="Basic Star" width="600">

# Loading the Star Schema
1. Insert/update new dimensions
2. Insert new facts

We load the dimensions first and then when we load the sales data we are going
to do lookups on all of the associated dimensions.
 <img src="slides/star.jpg" alt="Basic Star" width="600">


# Loading Dimension Tables
1. Create client dimension table
2. Load client table

* 5_2.sql

# Loading Fact Tables
1. Create sales fact table
2. Insert data from cleansed environment
3. Perform row count

* 5_3.sql

# Creating Views
1. Create view with calculated measures
2. Combine client dimension and sales fact to a single view
3. Create aggregated table for monthly metrics: OrderCount, SalesTotal, and
   AvgOrderSize

* 5_4.sql


# Additional Courses
* Transitioning from Data Warehousing to Big Data
* Analyzing Big Data with Hive
