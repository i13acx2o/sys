# Loadkeys config
doas loadkeys $XDG_CONFIG_HOME/zsh/keysrc

# startx check
[[ $(tty) = "/dev/tty1" ]] && startx
