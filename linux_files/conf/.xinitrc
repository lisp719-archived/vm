#!/bin/sh

. /etc/X11/xinit/xinitrc-common

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

ibus-daemon -drx

exec i3
