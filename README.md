# docker-magento2-lamp
Setup the server for running Magento 2

## Requirements
You need to install [docker](https://store.docker.com/editions/community/docker-ce-desktop-windows)
Double-click InstallDocker.msi to run the installer.

## Installing

Step 1: Install the Docker container

- Git clone https://github.com/php-cuong/docker-magento2-lamp.git
- Open the docker-compose.yml file and change volumes following the path on your computer, if you enjoy.
- On your Windows 10 press the Windows+S keys to open search.
- Type cmd and Run as administrator
- Switch to the path contains the data git clone.
- Run the following command line:
  - docker pull phpcuong/magento2-apache2
  - docker-compose up -d
- The additional information, run the following command line:
  - docker images
  - docker ps -a
  - docker-compose ps

Step 2: Install Magento 2 on Docker container.

1. Create a host for running Magento 2

- On your Windows 10, go to the path C:\Windows\System32\drivers\etc, open the hosts file
- Insert the new row: 127.0.0.1 magento.giaphugroup.com and press the ctrl + s for saving the new data. If you can't save the hosts file, please change the permission.
- On your browser, press https://localhost:10000, log in with the account information: 
	- Username: root
	- Password: root
- Create new virtual host

2. Download Magento 2.

- See https://magento.com/tech-resources/download
- You need to have an account here, please sign up if you have not yet.
- Download the Magento 2 latest.
- Copy the Magento zip file to the path, where magento.giaphugroup.com point to
- Unzip the Magento zip file.

3. Create a database
- On your browser, press https://localhost:8080, log in with the account information: 
	- Username: root
	- Password: pw
- Create the database name magento.2.1.7.
- Another way, I use the HeidiSQL software connect to mysql on my localhost
- If you do not install this software yet, please see https://www.heidisql.com/download.php

4. Install Magento 2
- On your browser press http://magento.giaphugroup.com
- The information for connecting to mysql.
	- host: mysql
	- username: root
	- password: pw
	- database: magento.2.1.7
- Finish the steps for installing Magento 2.

Step 3: ssh into the apache2_service container
docker exec -it apache2_service bin/bash
cd /var/www/html/
php bin/magento setup:static-content:deploy
php bin/magento cache:flush
php bin/magento cache:clean

Step 4: Test and see the results

## Thank for your watching!, I hope this video will save your time. Don't forget to subscribe my channel for getting the newest videos.

## Please do not hesitate to contact me if you need me to join your Magento project. My rate is $25/hour in Magento 1 and $30/hour in Magento 2.