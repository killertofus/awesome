autoload -Uz compinit && compinit

###
# ADD GIT INFO TO PROMPT
###
parse_git_branch() {
  local branch=""
  branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  local git_status=$(git status --porcelain 2>/dev/null)
  local color=green
  if echo "$git_status" | grep -q "^ M"; then
    color=yellow
    branch="${branch}*"
  fi
  if echo "$git_status" | grep -qE "^ A|^\?\?"; then
    color=yellow
    branch="${branch}+"
  fi
  if echo "$git_status" | grep -q "^ D"; then
    color=yellow
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




autoload -U colors && colors
# Custom bash prompt via kirsle.net/wizards/ps1.html
#PROMPT='%B%m%~%b$(git_super_status) %# '
#export PS1="$(tput setaf 5)❯$(tput sgr0) %d $(git_super_status) "
