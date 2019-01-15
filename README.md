# docker-magento2-lamp
How to install Magento 2 with Docker Compose on Windows 10 Pro

Hi everybody, I am Cuong, Welcome back to my Magento 2 tutorial video series.

Today, I am going to show everybody the best practice, How to install Magento 2 with Docker Compose on Windows 10 Pro.

You have a computer using the Operation system Windows 10 Professional, you are using the XAMPP or Vagrant for developing Magento 2, you see it working very slowly, you can't complete your tasks fast. Then you are searching for another platform replacing XAMPP or Vagrant to work faster.

Today, I show you the Docker software, this software will help you to develop Magento 2 faster than XAMPP and Vagrant, I think it is faster 80 percent. Also, you can be used the Ubuntu directly on the Operation system Windows for developing Magento 2 by using the Docker.

Before doing this practice, you must sure your computer meets the following requirements.

## The basic System Requirements:
- Windows 10 64bit: Pro, Enterprise or Education (1607 Anniversary Update, Build 14393 or later). You can check Windows 10 Build Version on your computer by going to Run ? enter the winver.
- Virtualization is enabled in BIOS. Typically, virtualization is enabled by default. This is different from having Hyper-V enabled. For more detail see Virtualization must be enabled in Troubleshooting.
https://docs.docker.com/docker-for-windows/troubleshoot/#virtualization-must-be-enabled
- At least 4GB of RAM.
- Git is installed on windows 10 Pro, go to the link for downloading https://git-scm.com/download/win
- Docker Community Edition 17.06.2-ce-win27 is installed, go to the link for downloading https://docs.docker.com/docker-for-windows/release-notes/#docker-community-edition-17062-ce-win27-2017-09-06

What will I do in this video?

1. I skip the step installing Git on windows 10 Pro 64 bit.
2. I skip the step enabling the Virtualization on my computer.
3. I install Docker CE 17.06.2 on the Windows 10 Pro 64bit
4. I create the docker containers from docker-compose.yml
5. I install Magento 2.2.6 with Docker

Okie, let's go.

Let's do this practice, you need to follow steps by step:

## Step 1: Install Docker CE 17.06.2 on the Windows 10 Pro 64bit
Go to the link https://docs.docker.com/docker-for-windows/release-notes/#docker-community-edition-17062-ce-win27-2017-09-06 for downloading the docker CE 17.06.2

## Step 2: Create the docker containers from docker-compose.yml
- Before creating the docker containers, you must share the local drives where you will save the source codes for your projects. Go to Docker -> Settings -> Shared Drivers, select the local drives you want to be available to your containers.
- Move to the local drive that you are working on it, don't use the C drive, because all your data will be lost if you re-install windows.
- Git clone https://github.com/php-cuong/docker-magento2-lamp.git
- Open the docker-compose.yml file and change volumes following the path on your computer
- Create the docker containers from docker-compose.yml file
Run the command line: docker-compose up -d
- Let's see the images on your computer
Run the command line: docker images
- Let's see the containers on your computer
Run the command line: docker ps -a

## Step 3: Install Magento 2.2.6 with Docker
- Before downloading and installing Magento 2.2.6, you must sure the server meet the minimum following requirements:
Apache 2.4
MySQL 5.7
PHP 7.0.13–7.0.x or 7.1.x
- Accessing the server where you will install Magento 2.2.6

1. Where having the PHP, Apache2, Webmin
- Run the command line: docker exec -it apache2_service bin/bash
- php -v, apache2 -v
- Webmin: https://127.0.0.1:10000
- username: root
- password: root

2. Where having the MySQL
- Run the command line: docker exec -it mysql_service bin/bash
- Run the command line: mysql -u root -p, enter the password "giaphugroup"
- Create the new database named magento.2.2.6
- Downloading the Magento 2.2.6, go to the link https://magento.com/tech-resources/download
- On your windows, move to the D drive, create the folder named magento/2.2.x/2.2.6, then copy the zip file just downloaded to this folder and unzip the file.
- Create a host for running Magento 2.3

On your Windows 10 Pro 64bit, go to the path C:\Windows\System32\drivers\etc, open the hosts file
Insert the new row: 127.0.0.1 magento-en.2.2.6.giaphugroup.com and press the ctrl + s for saving the new data. If you can't save the hosts file, please change the permission.

On your browser, press https://localhost:10000, log in with the account information:

Username: root
Password: root

Then Go to the Webmin -> Servers -> Apache Webserver -> Create virtual host -> Create a New Virtual Server

- Accessing the container has the PHP, Apache2, Webmin. Then restart apache2, Run the command line: service apache2 restart
- Install Magento 2.2.6

On your browser, press http://magento-en.2.2.6.giaphugroup.com

The information for connecting to mysql.

- host: mysql
- username: root
- password: giaphugroup
- database: magento.2.2.6

- Deploy static content
Run the command line: php bin/magento setup:static-content:deploy

## Let's install the sample data for Magento 2 please see the practice http://bit.ly/2OKBBwK

Thank you for your watching. If you have any questions about this practice, please feel free to leave a comment below.

Don't forget to like, comment, share my videos and subscribe to my channel for getting the latest videos.

Please do not hesitate to contact me, if you need me to join your Magento project. My rate is $25/hour in Magento 1 and $30/hour in Magento 2.

## See the video about this lesson
1. Youtube: https://www.youtube.com/watch?v=akcaOBrLTzM&list=PL98CDCbI3TNvPczWSOnpaMoyxVISLVzYQ
2. Facebook: https://www.facebook.com/giaphugroupcom/videos/2236992436576130/

