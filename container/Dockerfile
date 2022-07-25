FROM debian:11

# prepare
RUN apt-get update && apt-get install -y docker.io openssh-server neovim zsh fuse-overlayfs curl wget iproute2

# dind
RUN wget https://raw.githubusercontent.com/moby/moby/v20.10.17/hack/dind -O /usr/local/bin/dind \
&& chmod +x /usr/local/bin/dind

# docker-compose
RUN wget https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-linux-x86_64 -O /usr/local/bin/docker-compose \
&& chmod +x /usr/local/bin/docker-compose 

# node
RUN wget https://nodejs.org/dist/v16.16.0/node-v16.16.0-linux-x64.tar.xz -O /tmp/node.tar.xz \
&& tar -xJf /tmp/node.tar.xz -C /usr/local --strip-components=1 --no-same-owner \
&& rm /tmp/node.tar.xz \
&& npm install -g pnpm


ADD init-docker.sh init-sshd.sh /usr/local/bin/

WORKDIR /projects
ENTRYPOINT ["bash", "-c", "init-sshd.sh & init-docker.sh"]
CMD [ "sleep", "infinity" ]
