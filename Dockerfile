FROM centos:9
LABEL maintainer="bhagyash1raut@gmail.com"
RUN yum install -y httpd zip unzip && yum clean all
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/kider.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip kider.zip
RUN cp -rvf kider.zip/*
RUN rm -rf kider kider.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80


