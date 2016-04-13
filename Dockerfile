############################################################
# Dockerfile to build out Python Bottle site
# Based on Debian
############################################################

# Base Image is latest Debian package
FROM debian:latest

# File Author / Maintainer
MAINTAINER Caleb Soileau

# Update the repository
RUN apt-get update

# Install necessary tools
RUN  apt-get install -y nano sudo wget curl dialog net-tools python python-pip python-dev

# Install python bottle
RUN pip install bottle

# Create the run user
RUN useradd -d /home/bottle -m -s /bin/bash bottle

# add user to sudo
# RUN adduser sudo bottle

# Set the current user to the created user account
USER bottle

# Set the working directory to the run user's home dir
WORKDIR /home/bottle

# Copy contents of current directory to WORKDIR defined above
COPY . .
COPY ./ ./
COPY ./views ./views
COPY ./static ./static

# Expose public port
EXPOSE 8080

# Run the bottle framework
CMD python hello.py


#####  END  ######
