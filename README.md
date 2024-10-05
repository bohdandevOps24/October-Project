# October-Project

#                                 START AND STOP EC2-INCTANCE AUTOMATICALLY 

#          Introduction

# 1 .     Automatically creating EC2 instances in AWS using the Command Line Interface (CLI) can help you manage your resources more efficiently and automate tasks. 
#          Here are some benefits of using the CLI to create EC2 instances:

#          a. Manage multiple services
#             You can use the CLI to control and automate multiple AWS services from the command line
#          b. Automate tasks
#             You can use scripts to automate tasks, making it easier to manage large-scale deployments.
#          c. More powerful and flexible
#            The CLI is more powerful and flexible than the AWS Console, which is more user-friendly and easier for beginners.

#         Deployment Steps   

# 1. Navigate to https://us-east-2.console and loging with username and password
# 2. Navigate to instances page
# 3. Click "Launch Inctance"
# 4. Provide inctance name
# 5. Choose "ohio-public-key" as a public key name (if no public key - generate one)
# 6. Click "Launch or Save Inctance"
# 7. Navigate to IAM page in AWS
# 8. Click on Users
# 9. Click "Create User"
# 10. Provide User Name and click Next
# 11. Choose "Attach policies directly" as a Permissions Options
# 12. Choose "AdministratorAccess" role as a Permissions policies
# 13. Click Next and then click Create User
# 14. After saving user click on username from IAM users page
# 15. Then click on Security credentials tab under user info
# 16. Click "Create Access Key" under Access keys tab and click Next
# 17. Choose Command Line Interface (CLI) option under Access key best practices & alternatives 
# 18. Select understand check box and click Next
# 19. Click "Create Access Key"
# 20. User should see Access and Secret Keys generated 

# =============================================================================================
# 
# From VS Code app ssh to ec2-instace - ssh ec2-user@ip
# Generate public and private key using following command : ssh-keygen
# Copy public key from you vm using following command: cat ~/.ssh/id_rsa.pub and copy the value
# Navigate to GitHub with following URL: https://github.com/
# Click on user name on top right and go to Settings
# Click "SSH AND GPG KEYS"
# Click "New SSH key" and paste value to Key field and provide Title and click Add ssh key
# Create new project by clicking New button
# Provide project name and select README file and click Save
# Navigate to newly created project, click Code button and copy SSH key
# From vs code run following commands : sudo yum install git -y
#                                       git clone git@github.com:bohdandevOps24/October-Project.git
# 
# ==============================================================================================

# Next step is to configure aws:

# Run following command:
#                        aws configure
# You will be prompted to provide access key: use key generated from line # 20 and click Enter
# You will be prompted to provide private key: use key generated from line # 20 and click Enter
# You will be prompted to provide region: us-east-2
# You will be prompted to provide format: json
# Run following command to verify that aws was configured : ls -a , user should see .aws file


# ===============================================================================================

# Next step: 
# Navigate to git project from vs code app: cd October-Project
# Create shell file by running following command: vi startStopInstance.sh
# Copy next block and paste into startStopInctance.sh file

#!/bin/bash


id_for_ami="ami-037774efca2da0726"


instance_id=$(aws ec2 run-instances \
    --image-id $id_for_ami \
    --count 1 \
    --instance-type t2.micro \
    --key-name ohio-public-key \
    --region us-east-2 \
    --query 'Instances[0].InstanceId' \
    --output text)


sleep 60

# stoping the instance
aws ec2 terminate-instances --instance-ids $instance_id --region us-east-2


# =============================================================================

# Save file and test is manually with following command: ./startStopInstance.sh
#                                                          chmod +x startStopInstance.sh
# Navigate to aws, instance should be automatically created and stopped after 60 seconds
# Now install cron on you vm :
         
#                            #sudo yum install cronie -y
#                            #sudo service crond start
#                            #sudo chkconfig crond on

# Set cron job with following command:
#                                    crontab -e
# Insert following line into the cron file:
#                                          38 3 30 9 1  /home/ec2-user/October-Project/startStopInstance.sh
# Cron job should be triggerd automatically at the time is specified 
# Navigate to aws page instance should be created automatically and then stopped.

# Delete all instances after done testing


