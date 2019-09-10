source ~/dotfiles/functions.sh
source ~/dotfiles/aliases.sh
source ~/dotfiles/cover.sh

# fzf and ripgrep keybindings
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#bind -x '"\C-p": gvim $(fzf);'

# vim commands
export PATH="/Applications/MacVim.app/Contents/bin:$PATH"
export EDITOR=vim

# Environment
# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)" # load automatically

# rails
export BACKTRACE='yes'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mzhao/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mzhao/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mzhao/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mzhao/dev/google-cloud-sdk/completion.zsh.inc'; fi

# nvm - node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
