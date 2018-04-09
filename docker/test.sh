#!/bin/bash

echo -------- 1. Minimal image testing.
IMAGE=minimal
docker build -t ${IMAGE} ${IMAGE} || exit 1
docker run -t ${IMAGE} bazel version || exit 1

echo -------- 2. Development image testing.
IMAGE=development
docker build -t ${IMAGE} ${IMAGE} || exit 1
docker run -t -w testdata ${IMAGE} bazel test ... || exit 1

echo TEST PASSED
