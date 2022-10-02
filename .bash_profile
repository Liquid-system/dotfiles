export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:~/.yarn/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=~/.goApp/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH="$HOME/.poetry/bin:$PATH"
export CPPFLAGS LDFLAGS PKG_CONFIG_PATH
export GOPATH=$HOME/.go
export PATH=$PATH:~/.zig
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:~/lua-language-server/bin
export TMUX_TMPDIR=/tmp

if [[ -f ~/.bashrc ]] ; then
  . ~/.bashrc
fi

alias cxx='g++ -std=c++17 -Wall -O2'
alias cxxg='g++ -std=c++17 -Wall -O2 -g -fsanitize=undefined -D_GLIBCXX_DEBUG'
alias mikan='cd $HOME/edk2&&source edksetup.sh&&build&&$HOME/osbook/devenv/run_qemu.sh Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi $HOME/MIKANOS/mikanos/kernel/kernel.elf'




export PATH="$HOME/.poetry/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
. "$HOME/.cargo/env"
