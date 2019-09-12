# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# fzf and ripgrep keybindings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#bind -x '"\C-p": gvim $(fzf);'

### Prompt styling ###
RED="\[\033[0;31m\]"
YELLOW="\[\e[0;33m\]"
GREEN="\[\e[0;32m\]"
RED="\[\e[31m\]"
NO_COLOUR="\[\033[0m\]"

export PS1="\t[\w/]>"
PS1="$RED\`nonzero_return\`$YELLOW\t\[\e[0m\]@$GREEN[\w/]\[\e[0m\]$YELLOW (\$(git_current_branch))$NO_COLOUR\$ "

# Environment
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)" # load automatically

# rails
export BACKTRACE='yes'

# vim commands
export PATH="/Applications/MacVim.app/Contents/bin:$PATH"
export EDITOR=vim

source ~/dotfiles/functions.sh
source ~/dotfiles/aliases.sh

if [ -f ~/dotfiles/cover.sh ]; then
  source ~/dotfiles/cover.sh
fi
