source ~/.zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

zplug "chrissicool/zsh-256color"
zplug "mafredri/zsh-async", from:github, use:"async.zsh"
zplug "sindresorhus/pure", from:github, use:"pure.zsh", as:theme

zplug "peco/peco", from:gh-r, as:command
zplug "x-motemen/ghq", from:gh-r, as:command
zplug "BurntSushi/ripgrep", from:gh-r, as:command, rename-to:"rg"
zplug "ogham/exa", from:gh-r, as:command
zplug "docker/compose", from:gh-r, as:command, rename-to:"docker-compose", use:"*Linux-x86_64*"

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "~/.zsh", from:local, use:"*.zsh"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
