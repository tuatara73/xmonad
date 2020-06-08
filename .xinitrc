#!/bin/bash

# xrandr
xrandr --output VGA1 --right-of HDMI1 &

# autostart programs
numlockx &
xautolock -time 20 -locker slock &
xcompmgr -c &
nitrogen --restore &
flameshot &

# starting window manager
exec xmonad


