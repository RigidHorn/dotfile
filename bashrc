if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

cdls ()
{
  \cd "$@" && ls
}
alias cd="cdls"

alias tmux='tmux -2'

ls
