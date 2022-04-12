if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  eval $(gnome-keyring-daemon --start)
  export SSH_AUTH_SOCK
#  /usr/bin/proptest -M i915 -D /dev/dri/card0 95 connector 97 1
  export MOZ_ENABLE_WAYLAND=1
  export XDG_CURRENT_DESKTOP=sway
  exec sway
fi
