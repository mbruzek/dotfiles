
# The alias to run charmbox with juju 2.*
alias devbox='docker run \
  --rm \
  -ti  \
  -h devbox.juju.solutions \
  -v $HOME/.local/share/juju:/home/ubuntu/.local/share/juju \
  -v $HOME/.go-cookies:/home/ubuntu/.go-cookies \
  -v $HOME/.gitconfig:/home/ubuntu/.gitconfig \
  -v $HOME/workspace/interfaces:/home/ubuntu/interfaces \
  -v $HOME/workspace/layers:/home/ubuntu/layers \
  -v $HOME/workspace/charms/builds:/home/ubuntu/builds \
  -v $HOME/workspace/charms/trusty:/home/ubuntu/trusty \
  -v $HOME/workspace/charms/xenial:/home/ubuntu/xenial \
  -v $HOME/workspace/bundles:/home/ubuntu/bundles \
  -v $PWD:/home/ubuntu/pwd \
  jujusolutions/charmbox:devel'

# The alias to run jujubox with juju 1.*
alias charmbox='docker run \
  --rm \
  -ti  \
  -h charmbox.juju.solutions \
  -v $HOME/.juju:/home/ubuntu/.juju \
  -v $HOME/workspace/interfaces:/home/ubuntu/interfaces \
  -v $HOME/workspace/layers:/home/ubuntu/layers \
  -v $HOME/workspace/charms/trusty:/home/ubuntu/trusty \
  -v $HOME/workspace/charms/xenial:/home/ubuntu/xenial \
  -v $HOME/workspace/charms/builds:/home/ubuntu/builds \
  -v $HOME/workspace/bundles:/home/ubuntu/bundles \
  -v $PWD:/home/ubuntu/pwd \
  jujusolutions/charmbox:latest'

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
