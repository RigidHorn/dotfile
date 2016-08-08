if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

cdls ()
{
  \cd "$@" && ls
}
alias cd="cdls"
