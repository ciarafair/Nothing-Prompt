#!/usr/bin/env zsh

NT_PROMPT_SYMBOL=':'

function precmd(){
  autoload -U add-zsh-hook
  setopt prompt_subst

  current_time='%F{cyan}[%*]%f'
  current_active_directory='%F{yellow}[%~]%f'
  current_user='%F{gray}%n@%m%f'

  PROMPT='${current_time} ${current_active_directory}
${current_user}%(?.%F{green}${NT_PROMPT_SYMBOL}%f.%F{red}${NT_PROMPT_SYMBOL}%f) '

  if [[ "$NT_HIDE_EXIT_CODE" == '1' ]]; then
  	RPROMPT=''
  else
  	RPROMPT='%(?..%F{red}%B%S  $?  %s%b%f)'
  fi
  
}

