#!/bin/sh

## Run a docker container

# set the default options
runOpt="-d"

# parse any arguments
while [ "$1" != "" ]; do
  if  [ "$1" == "rm" ] ||
      [ "$1" == "remove" ]; then
        runOpt="--rm"
        shift
  fi
done

# parse the ip address
ipAddr=$(ipconfig getifaddr en1)


# echo "> Creating tunnel"
# socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\" &

echo "> Launching container"
docker run --cap-add=SYS_ADMIN -e DISPLAY=$ipAddr:0 $runOpt harbour
