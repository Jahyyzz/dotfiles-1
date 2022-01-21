PROMPT=$'%{\e[1;37m%}\┌─[%t %D ]─> %{\e[0;34m%}%n %{\e[1;33m%}\U00BB %{\e[1;37m%}%~ %{\e[1;1;33m%}\U00AB %{\e[0;34m%}%M: %{\e[0;37m%}$ \n%{\e[1;37m%}\└────> '  
RPROMPT=$'\$vcs_info_msg_0_ %{\e[1;37m%}\U23F0 %{\e[1;37m%}\U007B%{\e[1;34m%}%T %{\e[1;36m%}%D%{\e[1;37m%}\U007D     '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
##RPROMPT=\$vcs_info_msg_0_
## PROMPT=\$vcs_info_msg_0_'%# '
zstyle ':vcs_info:git:*' formats '%B ⥤    %b  ⥢ '

prompt_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="$vcs_info_msg_0_"
  if [[ -n "$ref" ]]; then
    if is_dirty; then
      color=11
      ref="${ref} $PLUSMINUS"
    else
      color=10
      ref="${ref} "
    fi
    if [[ "${ref/.../}" == "$ref" ]]; then
      ref="$BRANCH $ref"
    else
      ref="$DETACHED ${ref/.../}"
    fi
    prompt_segment $color $PRIMARY_FG
    print -n " $ref"
  fi
}


