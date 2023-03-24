JUPYTERLAB_VERSION=lab-3.5.3
REV=u3

REGISTRY=hub.ucloudadmin.com
USER=devops
IMAGE_NAME=scipy-notebook
IMAGE_TAG=${JUPYTERLAB_VERSION}-${REV}
MANIFEST=${IMAGE_NAME}

# remove local manifest from previous build so that
# we don't have previous versions to pollute the new build
podman manifest exists ${MANIFEST}
if [[ $? -eq 0 ]]; then
    podman manifest rm ${MANIFEST}
fi

podman manifest create ${MANIFEST}
podman build \
    --jobs 2 \
    --platform linux/amd64,linux/arm64/v8 \
    --manifest ${MANIFEST} \
    --tag $REGISTRY/$USER/$IMAGE_NAME:$IMAGE_TAG \
    .

podman manifest push --all ${MANIFEST} docker://$REGISTRY/$USER/$IMAGE_NAME:$IMAGE_TAG
