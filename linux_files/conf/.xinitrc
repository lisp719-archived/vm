#!/bin/sh

. /etc/X11/xinit/xinitrc-common

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

fcitx

tilda &
tint2 &
exec openbox
