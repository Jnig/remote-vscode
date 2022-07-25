#!/bin/bash

init-dotfiles.sh &
init-sshd.sh &
init-docker.sh &


sleep infinity
