export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.pypy3/bin
export PATH=$PATH:~/tig
export LIBGL_ALWAYS_INDIRECT=1
export PATH=$PATH:/usr/local/go/bin
export PATH=~/.goApp/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:~/flutter/bin
export LIBGL_ALWAYS_INDIRECT=0
export CPPFLAGS LDFLAGS PKG_CONFIG_PATH
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

fpath+=~/.zfunc
alias mikan='cd $HOME/edk2&&source edksetup.sh&&build&&$HOME/osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/workspace/mikanos/kernel/kernel.elf'
alias pip='python3.9 -m pip'
alias cl='clear'
alias vim='nvim'
alias n='nvim'
function open() { cmd.exe /c start $(wslpath -w $1) }

. "$HOME/.cargo/env"
export PYTHONPATH=${PYTHONPATH}:~/.local/lib/python3.9/site-packages/

# GUI
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# gh
eval "$(gh completion -s zsh)"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# 重複を記録しない
setopt hist_ignore_dups
# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt share_history
# automatically change directory when dir name is typed
setopt auto_cd
#grep
setopt +o nomatch 
# コマンド訂正
setopt correct
# jjで抜ける
bindkey "jj" vi-cmd-mode
# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [[ $(command -v exa) ]]; then
	alias e='exa --icons --colour=always'
	alias l=e
	alias ls=e
fi
# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#case "${OSTYPE}" in
#darwin*)
#  alias ls ="ls -G"
  alias la="ls -aG"
#  alias ll="ls -lG"
#  ;;
#  linux*)
#  alias ll='ls -alF'
#  alias la='ls -A'
#  alias l='ls -CF'
#  ;;
#esac

export DISPLAY=`hostname`.mshome.net:0.0

. "$HOME/.cargo/env"
# This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

ZSH_DISABLE_COMPFIX="true"

#zshプラグイン
source ~/.zplug/init.zsh

# コマンドを種類ごとに色付け
zplug "zsh-users/zsh-syntax-highlighting", defer:2
#フォントを白源にするhttps://github.com/yuru7/HackGen
zplug "romkatv/powerlevel10k", as:theme, depth:1

#ヒストリで補完する
ZSH_AUTOSUGGEST_STRATEGY=history
#zsh補完を無効化する
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="rm *"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#zshrcの自動コンパイル
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fix_wsl2_interop() {
for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
	if [[ -e "/run/WSL/${i}_interop" ]]; then
		export WSL_INTEROP=/run/WSL/${i}_interop
	fi
done
}
zshaddhistory() {
local line=${1%%$'\n'}
local cmd=${line%% *}

# 以下の条件をすべて満たすものだけをヒストリに追加する
[[ ${#line} -ge 5
	&& ${cmd} != (l|l[sal])
	&& ${cmd} != (c|cd)
	&& ${cmd} != (m|man)
]]
}
if [[ $(grep -i Microsoft /proc/version) ]]; then
export DISPLAY="$(awk '/nameserver/ { print $2 }' < /etc/resolv.conf)":0
else
export DISPLAY=127.0.0.1:0
fi
export COLORTERM=truecolor

alias luamake=/home/liquid_system/lua-language-server/3rd/luamake/luamake
