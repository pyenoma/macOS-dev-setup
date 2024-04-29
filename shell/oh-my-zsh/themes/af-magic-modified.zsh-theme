# af-magic-modified.zsh-theme
#
# Author: Andy Fleming
# Modified: Akshay Mittal

function preexec() {
  timer=$(($(date +%s%0N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%0N)/1000000))
    elapsed=$(($now-$timer))
    DASHED_STRING_SUFFIX="${elapsed}ms "
    unset timer
  fi
}

function getDashedStringSuffix() {
  local local_DASHED_STRING_SUFFIX
  local_DASHED_STRING_SUFFIX=$DASHED_STRING_SUFFIX
  echo $local_DASHED_STRING_SUFFIX
}

# dashed separator size
function afmagic_dashes {
  local exitCode="$?"
  # check either virtualenv or condaenv variables
  local python_env_dir="${VIRTUAL_ENV:-$CONDA_DEFAULT_ENV}"
  local python_env="${python_env_dir##*/}"
  # if there is a python virtual environment and it is displayed in
  # the prompt, account for it when returning the number of dashes
  if [[ -n "$python_env" && "$PS1" = *\(${python_env}\)* ]]; then
    dashes_length=$(( COLUMNS - ${#python_env} - 3 ))
  else
    dashes_length=$COLUMNS
  fi
  echo $dashes_length - ${#DASHED_STRING_SUFFIX} - ${#exitCode} - 3
}

# primary prompt: dashed separator, directory and vcs info
setopt promptsubst
PS1="${FG[237]}\${(l.\$(afmagic_dashes)..-.)}%F{cyan}\$(getDashedStringSuffix)%{$reset_color%}%(?.%{$fg[green]%}.%{$fg[red]%})[%?↵]%{$reset_color%}
${FG[032]}%~\$(git_prompt_info)\$(hg_prompt_info) ${FG[105]}%(!.#.»)%{$reset_color%} "

PS2="%{$fg[red]%}\ %{$reset_color%}"

# right prompt: return code, virtualenv and context (user@host)
# RPS1="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
# if (( $+functions[virtualenv_prompt_info] )); then
#   RPS1+='$(virtualenv_prompt_info)'
# fi
# Set hostname in right prompt
# RPS1+=" ${FG[237]}%n@%m%{$reset_color%}"

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[075]}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
