# Setting for tmux
export TERM=screen-256color

# Display Color
[ -e "$HOME/.dir_colors" ] &&
DIR_COLORS="$HOME/.dir_colors" [ -e "$DIR_COLORS" ] ||
DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"
alias ls='ls --color=auto'
