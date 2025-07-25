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
     PS1="$(tput setaf 5)❯$(tput sgr0) %~ $(parse_git_branch) "

}
precmd_functions+=(update_prompt)
update_prompt


#exports here
export EDITOR=nvim
export BAT_THEME=Dracula

#sources here
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh


#autoload
autoload -Uz compinit && compinit
autoload -U colors && colors


#alias here
alias cat="bat"
alias ls="lsd -a"
alias lz="lazygit"
alias fzf="fzf --preview "bat --color=always --style=numbers --line-range=:500 {}""


LS_COLORS+=':ow=01;33'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'


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
