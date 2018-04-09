# This file describes how to build 'Development' Bazel Ubuntu container with
# the latest Bazel version and other development tools installed from binary
# disribution.
#
# Approximate image size 1068 MB, time to build 1m30s.
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

# Using Minimal Bazel image (970 MB)
FROM minimal

# Install development software
# TODO: install pylint, python google flags and google test libs
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends git-core git-doc git-gui gitk && \
    apt-get install -y --no-install-recommends python && \
    apt-get install -y --no-install-recommends vim-gtk && \
    rm -rf /var/lib/apt/lists/*

# Install Ibazel from sources
RUN \
    git clone https://github.com/bazelbuild/bazel-watcher /opt/bazel-watcher && \
    cd /opt/bazel-watcher && \
    bazel build //ibazel && \
    cp /opt/bazel-watcher/bazel-bin/ibazel/linux_amd64_pure_stripped/ibazel /bin/ibazel && \
    rm -rf /root/.cache/bazel

# Add image test data
COPY testdata /testdata

# Default development directory
WORKDIR /home
