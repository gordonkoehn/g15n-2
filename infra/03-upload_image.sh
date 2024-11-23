#!/bin/sh
# Build and push the Docker image
docker push "${IMAGE_TAG}${GITHUB_SHA}"