# This file describes how to build 'Minimal_java' Bazel Ubuntu container with
# the latest Bazel version installed from binary disribution.
# NOTE: The only difference from 'minimal' config, is the OS image which comes
# with no Java pre-installed.
#
# Approximate image size 915 MB, time to build 2m.
#
# USAGE:
#   # Download dockerfile.
#   wget http://raw.githubusercontent.com/unittests/bazel/master/docker/minimal_java/Dockerfile
#
#   # Build the image.
#   docker build -t minimal_java .
#
#   # Run the resulting image interactively in the container.
#   docker run -ti minimal_java
#
FROM ubuntu:latest

# Bazel install (https://docs.bazel.build/versions/master/install-ubuntu.html)
RUN \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends wget && \
    wget -qO- --no-check-certificate https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y --no-install-recommends bazel && \
    apt-get upgrade -y bazel && \
    rm -rf /var/lib/apt/lists/* && \
    bazel version
