# ビルドやコマンドの実行で都合が悪いケースがあるためrootはLANG=C。
export LANG=ja_JP.UTF-8
case ${UID} in
  0)
    LANG=C
    ;;
esac

# 色設定。
autoload colors
colors
PROMPT="%{${reset_color}%}[%{${fg[green]}%}%.%{${reset_color}%}]$ "
RPROMPT="%{${reset_color}%}[%{${fg[green]}%}%~%{${reset_color}%}]"
PROMPT2="%{${reset_color}%}%_$ "
SPROMPT="correct: %R -> %r ? "

# ファイル名だけでもディレクトリ移動が可能。
setopt auto_cd

# cd -tabでディレクトリ履歴一覧が表示される。
setopt auto_pushd

# コマンドが間違っていたら、正しいと思われるものを勧めてくれる。
setopt correct

# ファイルの一覧などを表示するときに、間を詰めて表示する。
setopt list_packed

# パスの最後の/を自動で削除しない。
setopt noautoremoveslash

# エラー音を消す。
setopt nolistbeep

# コマンドプロントでvimキーバインドを有効にする。
bindkey -v
#bindkey "^[[1~" beginning-of-line # Home gets to line head
#bindkey "^[[4~" end-of-line # End gets to line end
#bindkey "^[[3~" delete-char # Del

# ctrl-p,ctrl-nで履歴の選択。
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
#bindkey "\\ep" history-beginning-search-backward-end
#bindkey "\\en" history-beginning-search-forward-end

# shift-tabで逆補完。
bindkey "\e[Z" reverse-menu-complete

# 履歴設定。
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# 補完設定。
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit

# 予測補完。
#autoload predict-on
#predict-off

# コマンド置換。
setopt complete_aliases     # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
  freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
  linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

cdls ()
{
  \cd "$@" && ls
}
alias cd="cdls"

alias tmux='tmux -2'

## terminal configuration
#
case "${TERM}" in
  screen)
    TERM=xterm
    ;;
esac

# 補完表示色をlsと同じものに設定。
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# set terminal title including current directory
#
case "${TERM}" in
  xterm|xterm-color|kterm|kterm-color)
    precmd() {
      echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

# ~/.zshrc.mineがあれば、適用する。
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.mine

# とりあえずls。
ls

# tmuxつけようか。
[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux
