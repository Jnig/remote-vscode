FROM debian:11

# prepare
RUN apt-get update && apt-get install -y docker.io openssh-server neovim zsh fuse-overlayfs curl wget iproute2 inetutils-ping

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


RUN git config --global user.email jakobniggel@gmail.com && git config --global user.name "Jakob Niggel"
ADD init-docker.sh init-sshd.sh init-dotfiles.sh init.sh /usr/local/bin/

CMD init.sh
