

# Setup Instructions Used when Windows instructions didn't work
https://airflow.apache.org/docs/apache-airflow/stable/start/docker.html
https://docs.docker.com/engine/install/
https://docs.microsoft.com/en-us/windows/wsl/install-win10
https://cx-oracle.readthedocs.io/en/latest/user_guide/installation.html
Step 1 - Hyper V
Changed Settings to put hyper v on
Step 2 - Containers
Turn containers on
Step 3 - Run the following in powershell as admin:
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
curl.exe -L -o Ubuntu_2004_x64.appx https://aka.ms/wslubuntu2004
powershell Add-AppxPackage Ubuntu_2004_x64.appx
Reboot
Step 4
Download Linux Kernel and move it to the C:\temp directory.
PS C:\WINDOWS\system32> msiexec /a "wsl_update_x64.msi" /qb TARGETDIR="C:\temp"
I tried a million things but you need to run this from powershell.
PS C:\temp> wsl_update_x64.msi
Step 5
wsl --set-default-version 2
Step 6 -
installed ubuntu from microsoft store
step 7 -
install and start up docker
step 8 -Run this in bash git
curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.1.0/docker-compose.yaml'
mkdir ./dags ./logs ./plugins
echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env
docker-compose up airflow-init
docker-compose up -d
step 9:
now you can bring up airflow in its gui and mess around
http://localhost:8080