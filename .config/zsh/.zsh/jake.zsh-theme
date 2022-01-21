# Grab the current date (%D) and time (%T) wrapped in {}: {%D %T}
DATETIME="%{$fg[white]%}{%{$fg[yellow]%}%D %T%{$fg[white]%}} "

# Grab the current filepath, use shortcuts: ~/Desktop
# Append the current git branch, if in a git repository
LOCA="%{$fg[cyan]%}%~\$(git_prompt_info)%{$reset_color%}"

# For the git prompt, use a green text for the branch name
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}[%{$fg[green]%}"
# Close it all off by resetting the color and styles.
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%}"
# Do nothing if the branch is clean (no changes).
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}+"

# Prompt character
PROMPT_CHAR="%{$fg[white]%}❯%{$reset_color%}"

# Put it all together!
PROMPT="$DATETIME$LOCA
$PROMPT_CHAR "

