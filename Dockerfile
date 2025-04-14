# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to non-interactive (useful for apt)
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic packages
RUN apt-get update && apt-get install -y nginx && apt clean
   
RUN echo "<h1>Hello from Ubuntu + Nginx Docker Container!</h1>" > /var/www/html/index.html


EXPOSE 80

# Default command
CMD [ "nginx" , "-g" , "daemon off;"]

