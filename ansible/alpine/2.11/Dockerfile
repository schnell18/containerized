FROM cytopia/ansible:2.11-tools

ARG SSH_KEY

RUN apk add --no-cache --update tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    apk del tzdata && \
    rm -rf /var/cache/apk/* && \
    ansible-galaxy collection install community.docker ansible.posix && \
    mkdir -p ~/.ssh && chmod 700 ~/.ssh && \
    umask 177 && echo "$SSH_KEY" > ~/.ssh/id_ed25519 && \
    echo "StrictHostKeyChecking no " > ~/.ssh/config
