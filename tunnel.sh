#!/bin/sh

## Launch the socat X11 tunnel

echo "> Starting tunnel"
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
