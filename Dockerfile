FROM ubuntu:20.04

MAINTAINER bhagyash1raut@gmail.com

# Avoid interactive prompts during install (for tzdata, etc.)
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, unzip, and zip
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean

# Add and unzip the template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip kider.zip && \
    cp -rvf kider/* . && \
    rm -rf kider kider.zip

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80 443

