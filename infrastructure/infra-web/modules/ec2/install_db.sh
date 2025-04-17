#! /bin/bash
sudo yum update -y
sudo yum install python3 -y 
sudo yum install pip -y
cd ~
sudo yum install git -y
git clone https://github.com/shadibadria/PythonRestApi
sleep 20
cd PythonRestApi
pip3 install -r requirements.txt
echo 'Waiting for 30 seconds before running the app.py'
sudo yum install util-linux -y
setsid python3 -u app.py &
sleep 30