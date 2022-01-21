## ~/.zshrc


###---------- EXPORTS ----------###

export BROWSER="brave"
export EDITOR="vim"
export VISUAL="vim"
export FZF_DEFAULT_COMMAND="find -L"
export PATH=$HOME/.local/bin/:$HOME/.local/scripts/dmenu/:$HOME/.local/scripts/:$PATH
export LESSHISTFILE=-
export MYVIMRC="$HOME/.config/vim/.vimrc"
export VIMINIT="source $MYVIMRC"

###--------- SOURCE ----------###

source ~/.config/zsh/aliases
source ~/.config/zsh/.zsh/spectrum.zsh
source ~/.config/zsh/archive_extract
source ~/.config/zsh/.zsh/zsh_plugins/timer.plugin.zsh
source ~/.config/zsh/.zsh/colored-man-pages.plugin.zsh
source ~/.config/zsh/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh


###---------- THEME ----------###

#source ~/.config/zsh/.zsh/agnoster.zsh-theme
#source ~/.config/zsh/.zsh/jake.zsh-theme
#source ~/.config/zsh/.zsh/gentoo.zsh-theme
#source ~/.config/zsh/.zsh/cloud.zsh
#source ~/.config/zsh/.zsh/bureau.zsh-theme
#source ~/.config/zsh/.zsh/jakes.zsh-theme


###--------- AUTOCOMPLETE ---------###
autoload -Uz promptinit
promptinit
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

setopt autocd
cdpath=(/ $HOME/.config $HOME/.local)
###---------- DECORATION ----------###

logo

case "$TERM" in
    xterm-kitty)
        kitty +kitten icat --align left $HOME/Media/Pictures/logo.gif
        ;;
    st-256color)
        pfetch
        ;;
    alacritty)
        neofetch
        ;;
esac

###---------- PROMPT ----------###

PROMPT=$'%{\e[1;90m%} \{ %{\e[1;32m%}$ %{\e[1;90m%}\} %{\e[1;37m%}\ ' 
#PROMPT=$'%{\e[1;34m%}\┌─[%{\e[1;37m%}%t %D %{\e[1;34m%}]──%{\e[1;31m%}> %{\e[1;34m%}%n%{\e[1;37m%}@%{\e[1;34m%}%M: %{\e[0;37m%}$ \n%{\e[1;34m%}\└────%{\e[1;31m%}> '  
RPROMPT=$'\$vcs_info_msg_0_ %{\e[1;32m%}\U007B%{\e[1;90m%} %~ %{\e[1;32m%}\U007D '

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%B ⥤    %b  ⥢ '


###---------- CLICKPAD ----------###

#syndaemon -i 1 -t -K -R -d


### ---------- OTHER ----------###

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.config/zsh/.zsh_history

#eval "$(starship init zsh)"

bindkey -s '^h' 'cd \n'
bindkey -s '^b' 'cd .. \n'
bindkey -s '^e' 'cd /home/jake/.config/'
bindkey -s '^x' 'sourcez \n ^l'
bindkey -s '^r' 'ranger \n'

gscp () {
    cd $HOME/.config/suckless
    git add .
    git commit -m "Updated files"
    git push git@gitlab.com:jped/void-suckless.git
    zle reset-prompt
}

gscs () {
    git --git-dir=$HOME/.config/suckless/.git --work-tree=$HOME/.config/suckless status
    zle reset-prompt
}

zle -N gscp
zle -N gscs


bindkey '^g' 'gscp'
bindkey '^a' 'gscs'



