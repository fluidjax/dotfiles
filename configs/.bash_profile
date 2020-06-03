
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/chris/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"

if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/chris/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/chris/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/chris/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<


export PATH=$PATH:/Users/chris
alias btcdir="cd ~/.bitcoin/" #linux default bitcoind path
alias bc="bitcoin-cli"
alias bd="bitcoind"
alias btcinfo='bitcoin-cli getwalletinfo | egrep "\"balance\""; bitcoin-cli getnetworkinfo | egrep "\"version\"|connections"; bitcoin-cli getmininginfo | egrep "\"blocks\"|errors"'
alias btcblock="echo \`bitcoin-cli getblockcount 2>&1\`/\`wget -O - http://blockexplorer.com/testnet/q/getblockcount 2> /dev/null | cut -d : -f2 | rev | cut -c 2- | rev\`"


alias bcstart="bitcoind -daemon"
alias btstart="bitcoind -testnet -daemon"
alias bcstop="bitcoin-cli stop"
alias btstop="bitcoin-cli -testnet stop"
alias bc="bitcoin-cli"
alias bt="bitcoin-cli -testnet"
alias bdir="cd /Users/chris/Library/Application\ Support/Bitcoin"

#Lightning
alias lmstart="lnd --bitcoin.mainnet"
alias ltstart="lnd --bitcoin.testnet"


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=on
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export GO111MODULE=on
