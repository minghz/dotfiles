source ~/dotfiles/aliases.sh
source ~/dotfiles/functions.sh
source ~/dotfiles/git_helpers.sh
source ~/dotfiles/git_helpers_batch.sh

# fzf and ripgrep keybindings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='-m --height 50% --border' # appearance

## Vim editor

# For MavVim
# export PATH="/Applications/MacVim.app/Contents/bin:$PATH"

export EDITOR=vim # For nvim
set -o vi # enable vi commands on cli

# Install `pure` CLI prompt
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

# Below imports company-specific configs.
# Add them to .gitignore to protect company IP
if [ -f ~/dotfiles/square.sh ]; then
  source ~/dotfiles/square.sh
fi
