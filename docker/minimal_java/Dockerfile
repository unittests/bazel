# This file describes how to build 'Minimal_java' Bazel Ubuntu container with
# the latest Bazel version installed from binary disribution.
#
# NOTE: The only difference from 'minimal' config, is the OS image which comes
# with no Java pre-installed.
#
# Approximate image size 915 MB, time to build 2m.
#
# USAGE:
#   # Download dockerfile.
#   mkdir minimal_java && curl https://raw.githubusercontent.com/unittests/bazel/master/docker/minimal_java/Dockerfile > minimal_java/Dockerfile
#
#   # Build the image.
#   docker build -t minimal_java minimal_java
#
#   # Run the resulting image interactively in the container.
#   docker run -ti minimal_java
#

# Using Ubuntu latest image (112 MB)
FROM ubuntu:latest

# TODO: BROKEN. For some reason failing with no disk space error when
# installing openjdk-9-jre-headless. Also is super slow.

# Bazel install (https://docs.bazel.build/versions/master/install-ubuntu.html)
RUN \
    echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates curl gnupg && \
    curl https://bazel.build/bazel-release.pub.gpg | apt-key add - && \
    apt-get update && \
    apt-get install -y --no-install-recommends -o Dpkg::Options::="--force-overwrite" bazel && \
    apt-get upgrade -y bazel && \
    apt-get purge --auto-remove -y curl gnupg && \
    rm -rf /etc/apt/sources.list.d/bazel.list && \
    rm -rf /var/lib/apt/lists/* && \
    bazel version
