

#exports here
export EDITOR=nvim
export BAT_THEME=Dracula
export HISTFILE=~/.zsh_history
HISTSIZE=8000
SAVEHIST=8000

PS1="%F{green}%~ %F{magenta}❯ "



#sources here
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh


#autoload
autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -U promptinit && promptinit

#alias here
alias cat="bat"
alias ls="lsd -a"
alias lz="lazygit"
alias fzf="fzf --preview "bat --color=always --style=numbers --line-range=:500 {}""


LS_COLORS+=':ow=01;33'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'


compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"


#startups here
if [ -z "$TMUX" ]
then
    tmux attach -t TMUX || tmux new -s TMUX \; new-window \ yazi;
fi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
