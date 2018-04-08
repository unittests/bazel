# This file describes how to build 'Minimal' Bazel Ubuntu container with
# the latest Bazel version installed from binary disribution.
#
# Approximate image size 830 MB, time to build 1m30s.
#
# USAGE:
#   # Download dockerfile.
#   mkdir minimal && curl https://raw.githubusercontent.com/unittests/bazel/master/docker/minimal/Dockerfile > minimal/Dockerfile
#
#   # Build the image.
#   docker build -t minimal minimal
#
#   # Run the resulting image interactively in the container.
#   docker run -ti minimal
#

# Using Ubuntu with pre-installed JDk 8 image (726 MB)
FROM openjdk:8-jdk

# Bazel install (https://docs.bazel.build/versions/master/install-ubuntu.html)
RUN \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y --no-install-recommends bazel && \
    apt-get upgrade -y bazel && \
    rm -rf /etc/apt/sources.list.d/bazel.list && \
    rm -rf /var/lib/apt/lists/* && \
    bazel version
