# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to non-interactive (useful for apt)
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic packages
RUN apt-get update && apt-get install -y \
    nginx \
    curl \
    unzip && \
    apt clean
RUN rm -rf /var/www/html/*   
RUN wget carvilla.zip https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip && \
    unzip carvilla.zip && \
    cp -r carvilla/* /var/www/html/ && \
    rm -rf carvilla.zip carvilla

# Set working directory
WORKDIR /app

EXPOSE 80

# Default command
CMD [ "nginx" , "-g" , "daemon off;"]

