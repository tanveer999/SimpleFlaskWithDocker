# Use an official Python runtime as a parent image
FROM ubuntu:22.04

# Install Apache and mod_wsgi
RUN apt-get update && \
    apt-get install -y curl netcat apache2

RUN a2enmod ssl &&\
    a2enmod proxy && \
    a2enmod proxy_balancer && \
    a2enmod proxy_http && \
    a2enmod headers

# Copy the Apache config file
COPY apache-revproxy/apache-rev-proxy.conf /etc/apache2/sites-available/000-default.conf
COPY apache-revproxy/apache2.conf /etc/apache2/apache2.conf
COPY apache-revproxy/headers.conf /etc/apache2/mods-enabled/headers.conf

# Start Apache when the container launches
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
