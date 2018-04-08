#!/usr/bin/bash

echo -------- 1. Minimal image testing.
IMAGE=minimal
echo TEST: ${IMAGE}: Bazel image test started
echo TEST: ${IMAGE}: Building the image...
time docker build -t ${IMAGE} ${IMAGE}
echo TEST: ${IMAGE}: Image built done

echo -------- 2. Minimal_Java image testing.
IMAGE=minimal_java
echo TEST: ${IMAGE}: Bazel image test started
echo TEST: ${IMAGE}: Building the image...
time docker build -t ${IMAGE} ${IMAGE}
echo TEST: ${IMAGE}: Image built done

echo TEST PASSED
