ANSIBLE_VERSION=2.11
REV=2

REGISTRY=docker.io
USER=schnell18
IMAGE_NAME=ansible
IMAGE_TAG=${ANSIBLE_VERSION}-${REV}-alpine
MANIFEST=${IMAGE_NAME}

podman manifest create ${MANIFEST}
podman build \
    --jobs 2 \
    --platform linux/amd64,linux/arm64/v8 \
    --manifest ${MANIFEST} \
    --build-arg SSH_KEY="$(cat ../../id_ed25519_opsbot)" \
    --tag $REGISTRY/$USER/$IMAGE_NAME:$IMAGE_TAG \
    .

podman manifest push --all ${MANIFEST} docker://$REGISTRY/$USER/$IMAGE_NAME:$IMAGE_TAG
