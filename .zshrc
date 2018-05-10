source ~/.zplug/init.zsh

HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

alias e="emacs -nw"
alias s="git status"

zplug "zplug/zplug", hook-build:"zplug --self-manage"

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "mafredri/zsh-async", from:github
zplug "powerline/powerline", use:"powerline/bindings/zsh/powerline.zsh"
zplug "knu/z", use:z.sh, nice:10


if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
