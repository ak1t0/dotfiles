### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin installer's chunk

zplugin light "zsh-users/zsh-syntax-highlighting"
zplugin light "zsh-users/zsh-history-substring-search"
zplugin light "zsh-users/zsh-autosuggestions"
zplugin light "zsh-users/zsh-completions"
zplugin light "chrissicool/zsh-256color"

zplugin ice pick"async.zsh" src"pure.zsh"
zplugin light sindresorhus/pure

zplugin snippet "https://github.com/ak1t0/zsh/blob/master/config.zsh"

[[ -z "$TMUX" && ! -z "$PS1" ]] && exec tmux

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ak1t0/.sdkman"
[[ -s "/home/ak1t0/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ak1t0/.sdkman/bin/sdkman-init.sh"
