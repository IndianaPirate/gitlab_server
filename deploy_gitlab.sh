#!/bin/bash
############################################
#					   #
#	      GITLAB SERVER	           #
############################################

sudo mkdir -p /srv/gitlab || true
mkdir ~/docker-gitlab || true
export GITLAB_HOME=/srv/gitlab

docker run --detach \
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ce:14.10.3-ce.0
