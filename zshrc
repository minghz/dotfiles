source ~/dotfiles/functions.sh
source ~/dotfiles/aliases.sh

# fzf and ripgrep keybindings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='-m --height 50% --border' # appearance

# vim commands
# export PATH="/Applications/MacVim.app/Contents/bin:$PATH"
export EDITOR=nvim
set -o vi

# Install pure prompt
# https://github.com/sindresorhus/pure
autoload -U promptinit; promptinit
prompt pure

# Environment
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)" # load automatically

# rails
export BACKTRACE='yes'

# nvm - node version manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

if [ -f ~/dotfiles/square.sh ]; then
  source ~/dotfiles/square.sh
fi
