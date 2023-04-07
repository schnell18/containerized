FROM docker.io/jupyter/scipy-notebook:lab-3.5.3
LABEL MAINTAINER Justin Zhang "schnell18@gmail.com"

# This is required to support IPV6 until the patch:
# https://github.com/jupyter-server/jupyter_server/pull/1207
# is included in the jupyter-server
COPY serverapp.py /opt/conda/lib/python3.10/site-packages/jupyter_server/serverapp.py

USER root

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends curl iputils-ping libmysqlclient-dev python-dev

USER ${NB_UID}
