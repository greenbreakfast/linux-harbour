# linux-harbour
Docker image that allows running Linux apps on the Mac desktop

# Prerequesites

## XQuartz

Install XQuartz, an X11 server that will be used for display output:
```
brew install Caskroom/cask/xquartz
```

Need to change the security preferences:
* Open XQuartz, open the Preferences
* Go to the Security tab
* Ensure `Authenticate Connections` and `Allow connections from network clients` are both checked


## Socat

Install `socat`, to tunnel from an open X11 port through to the local Unix socket where XQuartz is listening for connections
```
brew install socat
```

# Docker Usage
## Building the image

```
docker build -t harbour .
```

## Running the Container

First,  use `socat` to create a tunnel:
```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```

Spin up a container:
```
docker run -e DISPLAY=<IP ADDR>:0 --name harbour -d harbour
```

Where `IP ADDR` is the current IP address of your machine


# Usage

Start XQuartz.

Build the `harbour` image:
```
sh build.sh
```

In a separate terminal tab, start the tunnel:
```
sh tunnel.sh
```

Spin up the container:
```
sh run.sh
```
This will open an XQuartz Chrome window.


Close the window to stop the container.


Use
```
sh run.sh <IP ADDR> rm
```
to automatically remove the image when it shutsdown.

# To Do

* Implement automatic tunnel creation (+destruction)
