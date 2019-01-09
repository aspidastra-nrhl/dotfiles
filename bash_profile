source ~/.bashrc

alias laptop='bash <(curl -s https://raw.githubusercontent.com/18F/laptop/master/laptop)'

export PATH="$HOME/.bin:$PATH"

eval "$(hub alias -s)"

export NVM_DIR="/Users/brillig/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

source /usr/local/share/chruby/chruby.sh

source /usr/local/share/chruby/auto.sh

chruby ruby-2.4.3
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/brillig/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/brillig/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/brillig/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/brillig/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
export PATH="/usr/local/sbin:$PATH"

export PATH=$PATH:$(go env GOPATH)/bin
