#!/usr/bin/bash

echo -------- 1. Minimal image testing.
IMAGE=minimal
echo TEST: ${IMAGE}: Bazel image test started
echo TEST: ${IMAGE}: Building the image...
time docker build -t ${IMAGE} ${IMAGE} || exit 1
echo TEST: ${IMAGE}: Image built done

echo -------- 2. Development image testing.
IMAGE=development
echo TEST: ${IMAGE}: Bazel image test started
echo TEST: ${IMAGE}: Building the image...
time docker build -t ${IMAGE} ${IMAGE} || exit 1
echo TEST: ${IMAGE}: Image built done

echo TEST PASSED
