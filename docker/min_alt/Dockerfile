# Use Ubuntu
FROM ubuntu:latest

# Run update before installing any packages
RUN apt-get update

# Install Java
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get install -y oracle-java8-installer

# Install Bazel
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
RUN curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
RUN apt-get install -y bazel
RUN apt-get upgrade -y bazel

# Cleanup package lists
RUN rm -rf /var/lib/apt/lists/*
