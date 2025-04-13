# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables to non-interactive (useful for apt)
ENV DEBIAN_FRONTEND=noninteractive

# Update and install basic packages
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    vim \
    nano \
    build-essential \
    software-properties-common \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Default command
CMD [ "bash" , "-D" , "FOREGROUND"]

