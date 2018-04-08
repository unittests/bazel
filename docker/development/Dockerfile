# This file describes how to build 'Development' Bazel Ubuntu container with
# the latest Bazel version and other development tools installed from binary
# disribution.
#
# Approximate image size 830 MB, time to build 1m30s.
#
# USAGE:
#   # Download and build minimal Bazel dockerfile.
#   mkdir minimal && curl https://raw.githubusercontent.com/unittests/bazel/master/docker/minimal/Dockerfile > minimal/Dockerfile
#
#   # Download dockerfile.
#   mkdir development && curl https://raw.githubusercontent.com/unittests/bazel/master/docker/development/Dockerfile > development/Dockerfile
#
#   # Build the image.
#   docker build -t development development
#
#   # Run the resulting image interactively in the container.
#   docker run -ti development
#

# Using Minimal Bazel image (830 MB)
FROM minimal

# Install development software
# TODO: install pylint, ibazel, python google flags and google test libs
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get install -y --no-install-recommends python && \
    apt-get install -y --no-install-recommends gvim && \
    rm -rf /var/lib/apt/lists/*

# Add image test data
COPY testdata /testdata

# Default development directory
WORKDIR /home
