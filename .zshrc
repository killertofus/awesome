set_prompt_vars() {
  psvar=( )

  git_branch=$(git branch --show-current 2>/dev/null)

  if [[ -n $git_branch ]]; then
    psvar+=( $git_branch )
  else
    psvar+=( $(git rev-parse --short 2>/dev/null) )
  fi

  if [[ $(git status --porcelain 2>/dev/null) ]]; then
    psvar+=( magenta )
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook precmd set_prompt_vars

# directory
PROMPT='%F{blue}%2~%f '

# Git HEAD
PROMPT+="%(2V.%F{%2v}.)%1v%f%(1V. .)"

# prompt char
PROMPT+='%F{%(?.green.red)}%#%f'

local TERM_STRING='%(!.#.❯)'
PROMPT="$TERM_STRING"

autoload -U colors && colors
# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1="$(tput setaf 5)❯$(tput sgr0) %d "
