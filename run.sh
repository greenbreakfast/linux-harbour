#!/bin/sh

## Run a docker container
##  requires argument: ip address

# ensure argument exists
if [ "$1" == "" ]; then
  echo "ERROR: expected IP address as argument"
  exit
fi

# parse the ip argument
ipAddr=$1
shift

# set the default options
runOpt="-d"

# parse additional arguments
while [ "$1" != "" ]; do
  if  [ "$1" == "rm" ] ||
      [ "$1" == "remove" ]; then
        runOpt="--rm"
        shift
  fi
done


# echo "> Creating tunnel"
# socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &

echo "> Launching container"
docker run --cap-add=SYS_ADMIN -e DISPLAY=$ipAddr:0 $runOpt harbour
