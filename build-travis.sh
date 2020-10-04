#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

#
# Step 1: set repos name.
#
#REPOS_NAME=jc5x/test-repository
REPOS_NAME=fireflyiii/csv-importer
PLATFORMS=linux/amd64,linux/arm64,linux/arm/v7

#
# Step 2: echo some info
#
echo "build-travis.sh v1.2: I am building '${VERSION}' of CSV tool for ${REPOS_NAME}."

if [[ "$DOCKER_USERNAME" != "" ]]; then
	echi 'Optional login!'
	echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
fi

# new script start

echo "Current directory is $DIR"

docker version -f '{{.Server.Experimental}}'
docker version

docker run --rm --privileged multiarch/qemu-user-static --reset -p yes i
docker buildx create --name firefly_iii_builder
docker buildx inspect firefly_iii_builder --bootstrap
docker buildx use firefly_iii_builder

# always also push same label as the version (ie develop)
LABEL=$VERSION

# if the version is an alpha version, push to "alpha":
if [[ $VERSION == *"alpha"* ]]; then
	LABEL="alpha"
fi

# if the version is a beta version, push to "beta":
if [[ $VERSION == *"beta"* ]]; then
	LABEL="beta"
fi

if [[ $VERSION != *"beta"* && $VERSION != *"alpha"* && $VERSION != *"develop"* ]]; then
	LABEL="latest"
fi

echo "Version is '$VERSION' so label will be '$LABEL'."

# build CSV importer.
docker buildx build  --build-arg version=$VERSION --platform $PLATFORMS -t $REPOS_NAME:$LABEL --push . -f Dockerfile

echo "Done!"
