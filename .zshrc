# ADD GIT INFO TO PROMPT
parse_git_branch() {
  local branch=""
  branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  local git_status=$(git status --porcelain 2>/dev/null)
  local color=green
  if echo "$git_status" | grep -q "^ M"; then
    color=#DA70D6
    branch="${branch}*"
  fi
  if echo "$git_status" | grep -qE "^ A|^\?\?"; then
    color=cyan
    branch="${branch}+"
  fi
  if echo "$git_status" | grep -q "^ D"; then
    color=red
    branch="${branch}-"
  fi

  if [[ -n "$branch" ]]; then
    branch=[%F{${color}}${branch}%F{reset}]
  fi
  echo "$branch"
}
update_prompt() {
PS1="%F{cyan}%~
%F{green}%1~ %F{magenta}❯%{$reset_color%}$(parse_git_branch) "

}
precmd_functions+=(update_prompt)
update_prompt

bindkey "\e[3~" delete-char


#exports here
export EDITOR=helix
export BAT_THEME=Dracula
export HISTFILE=~/.zsh_history
HISTSIZE=8000
SAVEHIST=8000


#sources here
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source /usr/share/fzf/key-bindings.zsh

#autoload
autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -U promptinit && promptinit


#alias here
alias hx="helix"
alias cat="bat"
alias ls="lsd -a"
alias lz="lazygit"
alias fzf="fzf --preview "bat --color=always --style=numbers --line-range=:500 {}""

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
