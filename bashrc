set -o emacs

PS1='\[\e[32m\][(\w)]
\t \h:\l [(\W)] \$ \[\e[m\]'

[[ $EUID == 0 ]] && PS1='\[\e[31m\][(\w)]
\t \h:\l [(\W)] \$ \[\e[m\]'

alias scpresume="rsync --partial --progress --rsh=ssh"
alias vimdiff="vimdiff -c 'set diffopt+=iwhite'"

#
# Enable color support for vi
#
alias vi='TERM=xtermc vim'

# Auto-screen invocation. see: http://taint.org/wk/RemoteLoginAutoScreen
# if we're coming from a remote SSH connection, in an interactive session
# then automatically put us into a screen(1) session.   Only try once
# -- if $STARTED_SCREEN is set, don't try it again, to avoid looping
# if screen fails for some reason.
#: if [ "$PS1" != "" -a "${STARTED_SCREEN:-x}" = x -a "${SSH_TTY:-x}" != x ]
#: then
#:   STARTED_SCREEN=1 ; export STARTED_SCREEN
#:   [ -d $HOME/lib/screen-logs ] || mkdir -p $HOME/lib/screen-logs
#:   sleep 1
#:   screen -RR && exit 0
#:   # normally, execution of this rc script ends here...
#:   echo "Screen failed! continuing with normal bash startup"
#: fi
#: # [end of auto-screen snippet]

# avoid duplicates
export HISTCONTROL=ignoredups:erasedups
# big big history
export HISTSIZE=100000
export HISTFILESIZE=100000
# append history entries
shopt -s histappend
# After each command, save and reload history
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export HISTTIMEFORMAT=": %F %T: "

export NVM_DIR="/Users/brillig/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

mkdir -p $HOME/.kube/environments
touch $HOME/.kube/environments/blank.cfg
confPath=$HOME/.kube/environments/
configString=$(echo -E $(ls -m $confPath))
configString=$HOME/.kube/config:$confPath${configString//, /:$confPath}
export KUBECONFIG=${configString}

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
#alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias kflat='kubectl config view --minify --flatten'
#alias klogs="for service in $(kubectl get po |grep -- -0 |awk '{print $1}'); do  echo service $service; kubectl logs $service ; done "
alias got='git '
alias get='git '
alias clugr='mv ~/runlogs/*.* ~/runlogs/discards'

alias laptop='bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)'

alias gpr='git pull-request -m "$(git log -1 --pretty=%B)"'
alias mygpr='gpr -r rherardi,SmoothMaverick,prasadjjoshi'


alias kdash='kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml'

export PATH="$HOME/.bin:$PATH"

eval "$(hub alias -s)"

#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv

export HOMEBREW_GITHUB_API_TOKEN="1829a276e0a02c1d2c2b31c490f8710de02f0976"

#source /usr/local/bin/virtualenvwrapper.sh

source /usr/local/share/chruby/chruby.sh

source /usr/local/share/chruby/auto.sh

chruby ruby-2.4.3
set -o emacs


#==> Caveats
#To enable auto-activation add to your profile:
#  if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
#==> Summary


export NVM_DIR="/Users/brillig/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/brillig/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /Users/brillig/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/brillig/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /Users/brillig/.nvm/versions/node/v10.10.0/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

export FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"

export GOPATH="${HOME}/go"
