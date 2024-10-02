# October-Project
# In order to set up aws configure run following command - aws configure
# In order to install and make sure cron is up and running run following-
#sudo yum install cronie -y
#sudo service crond start
#sudo chkconfig crond on
# Provide following command in to cron file - 25 2 30 9 6 /home/ec2-user/October-Project/startStopInstance.sh
# Cron job should be triggerd automatically at the time is specified 
# Navigate to aws and see if instance was created 
