export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH="$HOME/.local/share/oh-my-zsh"


ZSH_THEME="dracula"


plugins=(git
zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

#exports here
export DRACULA_ARROW_ICON="❯"
export EDITOR=nvim
export BAT_THEME=Dracula

#alias here
alias cat="bat"
alias ls="lsd -a"
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% " 


[[ -r "$HOME"/.local/share/marlonrichert/zsh-snap ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git "$HOME"/.local/share/marlonrichert/zsh-snap

LS_COLORS+=':ow=01;33'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
source "$HOME"/.local/share/marlonrichert/zsh-snap/znap.zsh


znap prompt sindresorhus/pure


znap source marlonrichert/zsh-autocomplete
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source marlonrichert/zcolors
znap eval zcolors "zcolors ${(q)LS_COLORS}"
znap source dracula/zsh

znap function _pyenv pyenv 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenv
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

#startups here
