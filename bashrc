if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

auto_cdls()
{
  if [ "$OLDPWD" != "$PWD" ]; then
    ls
    OLDPWD="$PWD"
  fi
}
PROMPT_COMMAND="$PROMPT_COMMAND"$'\n'auto_cdls
