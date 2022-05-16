#!/bin/sh -l

ORIGINAL_TAG=$1
NEW_TAG=$2
REPO_NAME=$3

# Get the manifest for the existing image
MANIFEST=$(aws ecr batch-get-image --repository-name=$REPO_NAME --image-ids imageTag=$ORIGINAL_TAG --output json | jq --raw-output --join-output '.images[0].imageManifest')

# Confirm that the image was found
if [ "$MANIFEST" = "null" ]; then
    echo "The docker image tag $ORIGINAL_TAG could not be found in repository $REPO_NAME."
    echo "Make sure that the repository and tag exist, and that the user has proper permissions."
    exit 1
fi

# Push the new tag name
aws ecr put-image --repository-name=$REPO_NAME --image-tag $NEW_TAG --image-manifest "$MANIFEST"
