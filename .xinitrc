urxvtd -q -o -f
eval $(gpg-agent)
eval $(ssh-agent)

exec i3
