# Docker LAMP Developer
FROM ubuntu
MAINTAINER Cuong Ngo <bestearnmoney87@gmail.com>

# Base Packages
RUN apt-get update
RUN apt-get -y install git
RUN apt-get -y install wget
RUN apt-get -y install curl
RUN apt-get -y install nano
RUN apt-get -y install unzip

# SSH
RUN apt-get -y install openssh-server
RUN service ssh start

# Apache
RUN apt-get -y install apache2
RUN service apache2 start
RUN a2enmod rewrite
RUN rm -rf /etc/apache2/apache2.conf
COPY configs/apache2.conf /etc/apache2/
RUN service apache2 restart
RUN chmod go-rwx /var/www/html
RUN chmod go+x /var/www/html

# PHP
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0 php7.0-common php7.0-gd php7.0-mysql php7.0-mcrypt php7.0-curl php7.0-intl php7.0-xsl php7.0-mbstring php7.0-zip php7.0-bcmath php7.0-iconv

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer -v

# Webmin
RUN apt-get upgrade -y
RUN echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
RUN wget http://www.webmin.com/jcameron-key.asc
RUN apt-key add jcameron-key.asc
RUN apt-get update
RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes
RUN apt-get purge apt-show-versions
RUN rm /var/lib/apt/lists/*lz4
RUN apt-get -o Acquire::GzipIndexes=false update
RUN apt-get -y install apt-show-versions
RUN apt-get -y install webmin
RUN /etc/init.d/webmin start
RUN /usr/share/webmin/changepass.pl /etc/webmin root root

# Start
EXPOSE 80 10000
RUN cd /sbin
RUN touch run.sh
RUN echo "#!/bin/bash" >> run.sh
RUN echo "while /bin/true; do" >> run.sh
RUN echo "service webmin start" >> run.sh
RUN echo "service apache2 start" >> run.sh
RUN echo "sleep 60" >> run.sh
RUN echo "done" >> run.sh
RUN chmod +x run.sh
ENTRYPOINT ["./run.sh"]
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]