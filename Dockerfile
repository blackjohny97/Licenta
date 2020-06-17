FROM centos:latest
WORKDIR /usr/src/app
COPY package*.json ./
RUN yum update -y
EXPOSE 8080

