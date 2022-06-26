if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
  export MOZ_ENABLE_WAYLAND=1
  export XDG_CURRENT_DESKTOP=sway
  exec sway
fi
