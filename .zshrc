# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/evgeniy/.oh-my-zsh

alias -s {go,txt,cfg,c,cpp,rb,asm,nim,conf,d}=subl3
#alias -s {avi,mpeg,mpg,mov,m2v}=mpv
alias -s {html,htm}=firefox
#alias -s {png,jpg,gif,svg}=feh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source "/home/evgeniy/.oh-my-zsh/themes/spaceship.zsh-theme"

export $(dbus-launch)

export PATH="$PATH:/usr/lib"
export PATH="$PATH:/home/evgeniy/go/bin"
export PATH="$PATH:/home/evgeniy/.local/bin"
export RUST_SRC_PATH=/usr/src/rust/src
export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"
export BROWSER=firefox
export ANDROID_HOME=/opt/android-sdk
export ANDROID_EMULATOR_USE_SYSTEM_LIBS=1

ENABLE_CORRECTION="false"
COMPLETION_WAITING_DOTS="true"

eval $(thefuck --alias fuck)
export LD_LIBRARY_PATH=/opt/cuda/lib64/
export CUDA_HOME=/opt/cuda/
export VIRTUAL_ENV=~/Work/v2/env/bin/activate
export BAT_THEME="TwoDark" 
export ACCESS_TOKEN="773418400:AAE9TtEPQIhrpfkuMWXau7rrxEL4SUKxqvQ"
export BOT_ID="773418400"
export INFURA_API_KEY=2b22a61c23e3476f8de49477912fcc0b
export ETH_HOST=https://ropsten.infura.io/v3/2b22a61c23e3476f8de49477912fcc0b

