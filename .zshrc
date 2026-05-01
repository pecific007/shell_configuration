# Created by newuser for 5.9
# Some of .zshrc and .zshenv is taken from https://github.com/Phantas0s/.dotfiles/tree/master/zsh

#---------- SETOPTS -----------#

    setopt AUTO_CD             # Go to folder path without using cd.
    setopt AUTO_PUSHD          # Push the old directory onto the stack on cd.
    setopt PUSHD_IGNORE_DUPS   # Do not sotre duplicates in the stack.
    setopt PUSHD_SILENT        # Do not print the directory stack after pusd or popd.
    setopt PROMPT_SUBST        # For displaying Git related information on prompt

    setopt CORRECT             # Spelling correction.
    setopt CDABLE_VARS         # Change directory to a path sotred in a variable.
    setopt EXTENDED_GLOB       # Use extended blobbing syntax.

#------------------------------#


#------------------- ALIASES -> Variables -------------------#

    projects='/run/media/prashant/Prashant/Code_projects/'

#------------------------------------------------------------#


#--------------- ALIASES ------------#

    alias ls='ls -lh --color=auto'
    alias rm='rm -v'
    alias rmdir='rmdir -v'
    alias grep='grep --color=auto'
    alias valg='valgrind  --leak-check=full  --show-leak-kinds=all  --track-origins=yes'
    alias projects='cd $projects'
    alias makec='$projects/makec_files/makec'
    alias boo='ghostty +boo'
    alias wall-paper="~/wallpaper"
    alias open='xdg-open'
    alias pyserv='python -m http.server'

#------------------------------------#


#--------------- GIT ------------#
#----------------- GIT -----------------#

autoload -Uz compinit && compinit
autoload -Uz colors && colors
autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' unstagedstr '*'
# zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '✗'
zstyle ':vcs_info:git:*' stagedstr '✓'
zstyle ':vcs_info:git:*' formats ' (%b) %u %c'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a)%u %c'

#---------------------------------------#

#--------------- PROMPT ------------#

COLOR_RED='%F{red}'
COLOR_CYAN='%F{cyan}'
COLOR_RESET='%f'

PROMPT="${COLOR_CYAN}"' %2~'"${COLOR_RED}"'${vcs_info_msg_0_}'"${COLOR_RESET}"$'\n> '
# PROMPT=$'┌─'"${COLOR_RED}"'@%m:'"${COLOR_CYAN}"'[ %1~ ]'"${COLOR_RED}"'${vcs_info_msg_0_}'"${COLOR_RESET}"$':\n└$ '

#------------------------------------#


#--------------- KEYBINDS ------------#

bindkey ";5D" backward-word
bindkey ";5C" forward-word
bindkey "5D" backward-word
bindkey "5C" forward-word

bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal


#------------------------------------#


#--------------- GO-PATH ---------------#

export PATH="$PATH:$(go env GOPATH)/bin"

#---------------------------------------#

#--------------- ZSH_PLURINGS ---------------#

source $DOTFILES/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#-------------------------------------------#


# This will prevent the error message when SU-ing
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"
