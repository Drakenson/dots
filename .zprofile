if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh
  export MOZ_ENABLE_WAYLAND=1
  export QT_STYLE_OVERRIDE=adwaita-dark
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
  export XDG_CURRENT_DESKTOP=sway
  exec sway
fi
