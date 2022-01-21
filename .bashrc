#####---------- EXPORTS ----------###
export BROWSER="brave"
export EDITOR="vim"
export VISUAL="vim"
export PATH="$HOME/.local/bin:$HOME/.local/scripts:$PATH"
export MYVIMRC="$HOME/.config/vim/.vimrc"
export VIMINIT="source $MYVIMRC"

###---------- DECORATION ----------###

neofetch

###---------- PROMPT ----------###

#PS1="\e[00;36m\]┌─[ \e[00;37m\]\T \d \e[00;36m\]]──\e[00;31m\]>\e[00;37m\] \u\e[00;31m\]@\e[00;37m\]\h\n\e[00;36m\]└────\e[00;31m\]> \e[00;37m\]\w \e[00;31m\]\$ \e[01;37m\]"
PS1="\[\e[01;37m\]{ \[\e[01;34m\]\w \[\e[01;37m\]} \[\e[01;35m\]\[\$ \]\[\e[01;37m\]"


###---------- ALIASES ----------###

#update
alias grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias update="sudo xbps-install -Syu"

#navigate files and directories
alias ..="cd .."
alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -a"
alias lsla="lsd -la"
alias sr="sudo ranger"
alias r="ranger"
alias cl="clear"
alias copy="rsync -P"
alias x="xplr"
alias sx="sudo xplr"

#fun stuff
alias cnews="fortune | cowsay"
alias qnews="fortune | ponysay"
alias pics="sxiv -t Pictures"
alias wp="sxiv -t wallpaper"
alias temp="curl wttr.in/rogers"
alias colors="msgcat --color=test"
alias flameshot="flameshot launcher"

#git
alias status="git status"
alias push="git push origin"
alias pull="git pull origin"
alias commit="git commit -m"
alias add="git add ."
alias gitname="git config --global user.name 'Jacob Pedersen'"
alias gitmail="git config --global user.email 'jdpedersen1@yahoo.com'"
alias ginit="git init"
alias remote="git remote add origin"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

#poweroff
alias po="sudo shutdown now"
alias rs="sudo reboot"

#sync
alias dsync="~/.emacs.d/bin/doom sync"
alias merge="xrdb -merge ~/XTerm"

#file access
alias zconf="vim ~/.config/zsh/.zshrc"
alias bconf="vim ~/.bashrc"
alias cp="cp -riv"
alias mv="mv -iv"
alias mkdir="mkdir -vp"
#alias vim="nvim"

#editors
alias v="vim"
alias e="emacs"
alias n="nano"

#youtube
alias ytm="youtube-dl --extract-audio --audio-format mp3"
alias ytv="youtube-dl -f bestvideo+bestaudio"

#shell
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"
alias sourcez="source .zshrc"
alias sourceb="source .bashrc"

#keys
alias gpg1="gpg --keyserver pool.sks-keyservers.net --recv-keys"

#phone
alias aft="android-file-transfer"

#disk
#alias gparted="sudo gparted"

#website
alias webserver="ssh root@jpedmedia.com"
alias nmoupdate="rsync -vrP --delete-after ~/notmyown/public/ root@jpedmedia.com:/var/www/notmyown"
alias jpedupdate="rsync -vrP --delete-after ~/website/jpedmedia/ root@jpedmedia.com:/var/www/jpedmedia"
#alias arch="ssh 10.42.0.222"

###---------- ARCHIVE EXTRACT ----------###

ex ()
{
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1   ;;
        *.tar.gz)    tar xzf $1   ;;
        *.bz2)       bunzip2 $1   ;;
        *.rar)       unrar x $1   ;;
        *.gz)        gunzip $1    ;;
        *.tar)       tar xf $1    ;;
        *.tbz2)      tar xjf $1   ;;
        *.tgz)       tar xzf $1   ;;
        *.zip)       unzip $1     ;;
        *.Z)         uncompress $1;;
        *.7z)        7z x $1      ;;
        *.deb)       ar x $1      ;;
        *.tar.xz)    tar xf $1    ;;
        *.tar.zst)   unzstd $1    ;;
        *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ---------- OTHER ----------###

HISTSIZE=10000
#SAVEHIST=10000
