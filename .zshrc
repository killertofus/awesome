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
%F{green}%1~ %F{magenta}❯%{$reset_color%}$(parse_git_branch)"

}
precmd_functions+=(update_prompt)
update_prompt


#exports here
export EDITOR=nvim
export BAT_THEME=Dracula
 export HISTFILE="$XDG_STATE_HOME"/zsh/history
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


LS_COLORS+=':ow=01;33'
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'



compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"


#startups here
