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

zplug "ak1t0/zsh", from:github, use:"config.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
	echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ak1t0/.sdkman"
[[ -s "/home/ak1t0/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ak1t0/.sdkman/bin/sdkman-init.sh"
