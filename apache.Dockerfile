# Use an official Python runtime as a parent image
FROM ubuntu:22.04

# Install Apache and mod_wsgi
RUN apt-get update && \
    apt-get install -y curl netcat python3-pip apache2 libapache2-mod-wsgi-py3

# Enable mod_wsgi
RUN a2enmod wsgi

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /var/www/flaskapp
COPY app.py .
COPY apache_application.wsgi application.wsgi

# Install the Python requirements
RUN pip install flask

# Copy the Apache config file
COPY apache_vhost.conf /etc/apache2/sites-available/000-default.conf
COPY apache_ports.conf /etc/apache2/

# Expose the port that Apache will run on
EXPOSE 80

# Start Apache when the container launches
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
