#!/bin/sh
# Build the Docker image
docker build -f app.Dockerfile -t "$IMAGE_TAG:${GITHUB_SHA}" .