#!/usr/bin/bash

function finish { read -rp "Press Enter to exit..."; }

IMAGE=minimal
echo TEST: ${IMAGE}: Bazel image test started
echo TEST: ${IMAGE}: Building the image...
time docker build -t ${IMAGE} ${IMAGE} || finish
echo TEST: ${IMAGE}: Image built done

echo TEST FAILED
finish

