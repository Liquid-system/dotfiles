# Start configuration added by Zim install {{{
# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# vimキーバインドにする
bindkey -v

# Prompt for spelling correction of commands.
setopt CORRECT

# Customize spelling correction prompt.
SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/.pypy3/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=~/.goApp/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH="$HOME/.poetry/bin:$PATH"
export CPPFLAGS LDFLAGS PKG_CONFIG_PATH
export GOPATH=$HOME/.go
export PATH=$PATH:~/.zig
export PATH=$PATH:$GOPATH/bin
export TMUX_TMPDIR=/tmp
export DENO_INSTALL="/home/liquid_system/.deno"
export PATH=$PATH:~/zls
export PATH="$DENO_INSTALL/bin:$PATH"

export CPATH=$CPATH:$HOME/edk2/MdePkg/Include
export CPATH=$CPATH:$HOME/edk2/MdePkg/Include/X64
export COLORTERM=truecolor

#OSごとにファイルを分割
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`
#マシンごとにファイルを分割
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

fpath+=~/.zfunc

alias mikan='cd $HOME/edk2&&source edksetup.sh&&build&&$HOME/osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/workspace/mikanos/kernel/kernel.elf'
alias n='nvim'
alias cxx='g++ -std=c++17 -Wall -O2 '
alias cxxg='g++ -std=c++17 -Wall -O2 -g -Wall -Wextra -Wshadow -Wconversion -Wfloat-equal -Wno-char-subscripts -ftrapv -fsanitize=address,undefined -fno-omit-frame-pointer -fno-sanitize-recover -D_GLIBCXX_DEBUG'

function open() { cmd.exe /c start $(wslpath -w $1) }

. "$HOME/.cargo/env"

# gh
eval "$(gh completion -s zsh)"

# lsコマンドで表示されるファイルの色を変更する
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
# Set up the prompt
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

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
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
	alias ls='exa --icons --colour=always'
  alias la='exa -1'
fi
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# export DISPLAY=`hostname`.mshome.net:0.0

. "$HOME/.cargo/env"

ZSH_DISABLE_COMPFIX="true"


#ヒストリで補完する
ZSH_AUTOSUGGEST_STRATEGY=history
#zsh補完を無効化する
ZSH_AUTOSUGGEST_COMPLETION_IGNORE="rm *"

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

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

#zshrcの自動コンパイル
if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
   zcompile ~/.zshrc
fi
