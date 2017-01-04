# Juju aliases

# The alias to run the Juju 2.x charm development container.
alias charmbox='docker run \
  --rm \
  -ti  \
  -h charmbox.juju.solutions \
  -v ${HOME}/.go-cookies:/home/ubuntu/.go-cookies \
  -v ${HOME}/.gitconfig:/home/ubuntu/.gitconfig \
  -v ${HOME}/.local/share/juju:/home/ubuntu/.local/share/juju \
  -v ${HOME}/workspace/bundles:/home/ubuntu/bundles \
  -v ${HOME}/workspace/charms:/home/ubuntu/charms \
  -v ${HOME}/workspace/interfaces:/home/ubuntu/interfaces \
  -v ${HOME}/workspace/layers:/home/ubuntu/layers \
  -v ${PWD}:/home/ubuntu/pwd \
  jujusolutions/charmbox:latest'

# The alias to run the Juju 1.x charm development container.
alias charmbox1='docker run \
  --rm \
  -ti  \
  -h charmbox1.juju.solutions \
  -v ${HOME}/.go-cookies:/home/ubuntu/.go-cookies \
  -v ${HOME}/.gitconfig:/home/ubuntu/.gitconfig \
  -v ${HOME}/.juju:/home/ubuntu/.juju \
  -v ${HOME}/workspace/bundles:/home/ubuntu/bundles \
  -v ${HOME}/workspace/charms:/home/ubuntu/charms \
  -v ${HOME}/workspace/interfaces:/home/ubuntu/interfaces \
  -v ${HOME}/workspace/layers:/home/ubuntu/layers \
  -v ${PWD}:/home/ubuntu/pwd \
  jujusolutions/charmbox:juju-1'

# The alias to run the Juju 2.x container.
alias jujubox=`docker run \
  --rm \
  -ti \
  -h jujubox.juju.solutions \
  -v ${HOME}/.local/share/juju:/home/ubuntu/.local/share/juju \
  -v ${HOME}/workspace/bundles:/home/ubuntu/bundles \
  -v ${HOME}/workspace/charms:/home/ubuntu/charms \
  -v ${PWD}:/home/ubuntu/pwd \
  jujusolutions/jujubox:latest`

# The alias to run the Juju 1.x container.
alias jujubox=`docker run \
  --rm \
  -ti \
  -h jujubox1.juju.solutions \
  -v ${HOME}/.juju:/home/ubuntu/.juju \
  -v ${HOME}/workspace/bundles:/home/ubuntu/bundles \
  -v ${HOME}/workspace/charms:/home/ubuntu/charms \
  -v ${PWD}:/home/ubuntu/pwd \
  jujusolutions/jujubox:juju-1`

# Docker aliases

alias clean-docker=`docker rm $(docker ps -qa)`
alias clean-docker-images=`docker rmi $(docker ps -qa)`

# The alias to run a docker container with system statistics on your machine.
alias docker-monitor='docker run \
  -d \
  --cap-add SYS_PTRACE \
  --name=docker-monitor \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -p 19999:19999 \
  titpetric/netdata \
  && echo "Go to http://localhost:19999"'
