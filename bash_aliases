
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
